//
//  CollectionHeaderCode_View.swift
//  DouYuTest
//
//  Created by pp on 2019/4/19.
//  Copyright © 2019 pp. All rights reserved.
//

import UIKit

class CollectionHeaderCode_View: UICollectionReusableView {
    
    let headerView = UIView()
    let imageView = UIImageView()
    let titleLable = UILabel()
    let moreBtn = UIButton();
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        setupUI();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CollectionHeaderCode_View{
    private  func setupUI(){
        
        self.backgroundColor = .white
        
        headerView.backgroundColor = UIColor(r: 238, g: 238, b: 238);
        imageView.image = UIImage.init(named: "home_header_hot");
        titleLable.text = "推荐"
        titleLable.font = UIFont.systemFont(ofSize : 16.0);
        moreBtn.setTitle("更多 >", for: .normal);
        moreBtn.setTitleColor( .gray, for: .normal)
        moreBtn.titleLabel?.font=UIFont.systemFont(ofSize : 16.0);
        self.addSubview(headerView);
        self.addSubview(imageView);
        self.addSubview(titleLable);
        self.addSubview(moreBtn);
        headerView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview();
            make.height.equalTo(10);
        }
        imageView.snp.makeConstraints { (make) in
            make.height.width.equalTo(18);
            make.left.equalToSuperview().offset(10)
            make.centerY.equalToSuperview().offset(5)
        }
        titleLable.snp.makeConstraints { (make) in
            make.centerY.equalTo(imageView)
            make.left.equalTo(imageView.snp.right).offset(5)
        }
        moreBtn.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-10);
            make.centerY.equalTo(imageView)        
            make.width.equalTo(60);
        }
    }
    
}
