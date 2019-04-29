//
//  HomeViewController.swift
//  DouYuTest
//
//  Created by pp on 2019/4/15.
//  Copyright © 2019 pp. All rights reserved.
//

import UIKit
import SnapKit

private let KTitleViewH : CGFloat = 40


class HomeViewController: UIViewController {
    
    
    private lazy var pageTitleView : PageTitleView = {[weak self] in
        let titleFramge = CGRect(x: 0, y: 0, width: kScreenW , height: KTitleViewH);
        let titles = ["推荐","游戏","娱乐","趣玩"];
        
        let titleView = PageTitleView(frame: titleFramge, titles: titles)
        titleView.delegate = self
        return titleView
    }()
    
    
    private lazy var pageContentView : PageContentView = {[weak self] in
        var childVcs = [UIViewController]()
        
        childVcs.append(RecommendViewController())
        for _ in 0..<3 {
            let vc = UIViewController();
            vc.view.backgroundColor = UIColor(r: CGFloat( arc4random_uniform(255)), g:  CGFloat( arc4random_uniform(255)), b:  CGFloat( arc4random_uniform(255)))
            
            let  btn = UIButton()
            btn.backgroundColor =  UIColor.red;
            vc.view.addSubview(btn);
            
            btn.snp.makeConstraints({ (make) in
                make.bottom.equalToSuperview();
                make.width.equalTo(100);
                make.height.equalTo(100);
            })
            
            childVcs.append(vc);
        }
        let pageContentView = PageContentView(frame: CGRect.zero, childVcs:childVcs, parentViewControll: self , height : kScreenH - kNavAndTabH - KTitleViewH);
        
        pageContentView.delegate = self
        
        return pageContentView;
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUi()
    }
    
}
//设置界面
extension HomeViewController {
    private func setupUi() {
        //设置变局 及其设置上下颜色
        setupNaviAndTabbarColor();
        
        setupNaviBar()
        //添加titleview
        view.addSubview(pageTitleView);
        
        //添加pageview
        view.addSubview(pageContentView);
        pageContentView.backgroundColor = .purple;
        
        
        pageContentView.snp.makeConstraints { (make) in
            make.top.equalTo(pageTitleView.snp_bottom);
            make.left.equalToSuperview();
            make.bottom.right.equalToSuperview();
        }

    }
    
    private func setupNaviBar(){
        //左侧item
         navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo")
        
        let size = CGSize(width: 40, height: 40);
        let historyItem = UIBarButtonItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size)
        let seacrhItem = UIBarButtonItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size)
        let qrcodeItem = UIBarButtonItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size)
        navigationItem.rightBarButtonItems = [historyItem,seacrhItem,qrcodeItem];
    }
    private func setupNaviAndTabbarColor(){
        self.navigationController?.navigationBar.isTranslucent=false;
        self.tabBarController?.tabBar.backgroundColor  = .white
        self.edgesForExtendedLayout = []//UIRectEdge.bottom
     }
}

//代理
extension HomeViewController : PageTitleViewDelegate{
    func pageTitleView(titleView: PageTitleView, selectedIndex index: Int) {
        print(index)
        pageContentView.setCurrentIndex(currentIndex: index);
    }
}

extension HomeViewController : PageContentViewDelegate {
    func pageConentView(contentView: PageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        pageTitleView.setTitleWithProgress(progress: progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
}
