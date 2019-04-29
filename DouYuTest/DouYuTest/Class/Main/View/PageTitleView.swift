//
//  PageTitleView.swift
//  DouYuTest
//
//  Created by pp on 2019/4/16.
//  Copyright © 2019 pp. All rights reserved.
//

import UIKit


protocol PageTitleViewDelegate : class {
    func pageTitleView(titleView : PageTitleView, selectedIndex index: Int)
}

private let KScrollLineH : CGFloat = 2 ;


private let kNormalColor : (CGFloat,CGFloat,CGFloat) = (85,85,85)
private let kSelectColor : (CGFloat,CGFloat,CGFloat) = (255,128,0)

class PageTitleView: UIView {
    
    private var currentIndex : Int = 0
    private var titles :[String]
    weak var delegate : PageTitleViewDelegate?
    
    private lazy var  titleLabels = [UILabel]() ;
    
    //lazy
    private lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        return scrollView
        
    }()
    
    
    private lazy var scrollLine : UIView = {
        let scrollLine = UIView();
        scrollLine.backgroundColor = UIColor.orange;
        return scrollLine;
    }()
    
    //自定义构造函数
    init(frame: CGRect,titles : [String]) {
        self.titles = titles
        
        super.init(frame: frame);
        
        setupUI();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension PageTitleView{
    private func setupUI(){
        addSubview(scrollView)
        scrollView.frame = bounds
        
        setUpTitleLabels();
        
        setupBottomMenyAndScrollLine();
    }
    
    private func setUpTitleLabels(){
        let lableW : CGFloat = frame.width / CGFloat(titles.count)
        let lableH : CGFloat = frame.height - KScrollLineH;
        let lableY : CGFloat = 0;
        
        for (index,title) in titles.enumerated() {
            let label = UILabel();
            label.text = title;
            label.tag = index ;
            label.font = UIFont.systemFont(ofSize: 16.0)
            label.textColor = UIColor(r: kNormalColor.0, g: kNormalColor.1, b: kNormalColor.2)
            label.textAlignment = .center
            
            //frame
            let lableX : CGFloat = lableW * CGFloat(index)
            
            label.frame = CGRect(x: lableX, y: lableY, width: lableW, height: lableH);
            
            scrollView.addSubview(label);
            titleLabels.append(label);
        
            //添加手势
            label.isUserInteractionEnabled = true;
            let tagGes = UITapGestureRecognizer(target: self, action: #selector(self.titleLabelClick(tapGes:)))
            label.addGestureRecognizer(tagGes);
        }
    }
    
    private func setupBottomMenyAndScrollLine(){
        
        let bottomLine = UIView();
        bottomLine.backgroundColor = UIColor.lightGray;
        let linH  : CGFloat = 0.5 ;
        bottomLine.frame = CGRect(x: 0, y: frame.height - linH, width: frame.width, height: linH);
        
        addSubview(bottomLine);
        guard let firstLable = titleLabels.first else {
            return
        }
        firstLable.textColor = UIColor(r: kSelectColor.0, g: kSelectColor.1, b: kSelectColor.2)
        scrollView.addSubview(scrollLine);
        
        scrollLine.frame = CGRect(x: firstLable.frame.origin.x, y: frame.height - KScrollLineH, width: firstLable.frame.width, height: KScrollLineH)
    }
}

extension PageTitleView {
    @objc private func titleLabelClick(tapGes : UITapGestureRecognizer){
        //当前lable
        guard let currentLable = tapGes.view as? UILabel else {return}
        //获取之前label
        let oldLable = titleLabels[currentIndex]
        
        if currentLable.tag == oldLable.tag {return}
        //保存最新
        currentIndex = currentLable.tag
        
        currentLable.textColor = UIColor(r: kSelectColor.0, g: kSelectColor.1, b: kSelectColor.2)
        oldLable.textColor = UIColor(r: kNormalColor.0, g: kNormalColor.1, b: kNormalColor.2)
        
        //滚动条位置
        let scrollLineX = CGFloat(currentLable.tag) * scrollLine.frame.width
        UIView.animate(withDuration: 0.15, animations: {
            self.scrollLine.frame.origin.x = scrollLineX;
        })
        //通知代理
        delegate?.pageTitleView(titleView: self, selectedIndex: currentLable.tag);
    }
}

extension PageTitleView {
    func setTitleWithProgress(progress : CGFloat , sourceIndex : Int , targetIndex : Int)  {
        let sourceLabel = titleLabels[sourceIndex];
        let targetLabel = titleLabels[targetIndex];
        
        //滑块逻辑
     let moveTotalX = targetLabel.frame.origin.x - sourceLabel.frame.origin.x
        let moveX = moveTotalX * progress;
        scrollLine.frame.origin.x = sourceLabel.frame.origin.x + moveX
        
        
 
        //颜色渐变
        let colorDelta : (CGFloat,CGFloat,CGFloat) = (kSelectColor.0 - kNormalColor.0 , kSelectColor.1 - kNormalColor.1, kSelectColor.2 - kNormalColor.2)
        
        
        sourceLabel.textColor = UIColor(r: kSelectColor.0 - colorDelta.0 * progress, g: kSelectColor.1 - colorDelta.1 * progress, b: kSelectColor.2 - colorDelta.2 * progress)
        
        
        targetLabel.textColor = UIColor(r: kNormalColor.0 + colorDelta.0 * progress, g: kNormalColor.1 + colorDelta.1 * progress, b: kNormalColor.2 + colorDelta.2 * progress)
        
        //记录最新的index
        currentIndex = targetIndex
    }
    
    

}
