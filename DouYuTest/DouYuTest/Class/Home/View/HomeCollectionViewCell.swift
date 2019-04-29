//
//  HomeCollectionViewCell.swift
//  DouYuTest
//
//  Created by pp on 2019/4/19.
//  Copyright © 2019 pp. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    let imageView = UIImageView()
    let homecateImageView = UIImageView()
    let romTitleLabel = UILabel();
    
    let nikeNameLabel  = UILabel()
    let onLineBtn = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension HomeCollectionViewCell{
    func setupUI()  {
        self.contentView.backgroundColor = .white
        
        imageView.image = UIImage(named: "Img_default");
        homecateImageView.image = UIImage(named: "home_live_cate_normal");
        romTitleLabel.text = "小aasdd";
        romTitleLabel.font = UIFont.systemFont(ofSize: 11);
        romTitleLabel.textColor = UIColor("6F7179");
        
        nikeNameLabel.text = "昵称"
        nikeNameLabel.font = UIFont.systemFont(ofSize: 11);
        nikeNameLabel.textColor = .white
        
        onLineBtn.titleLabel?.font = UIFont.systemFont(ofSize: 11);
         onLineBtn.titleLabel?.textColor = .white
         onLineBtn.setImage(UIImage(named: "Image_online"), for:  .normal)
        onLineBtn.setTitle("131313", for: .normal)
        imageView.addSubview(onLineBtn)
        imageView.addSubview(nikeNameLabel)
        
       self.contentView.addSubview(imageView)
       self.contentView.addSubview(homecateImageView)
       self.contentView.addSubview(romTitleLabel)

        homecateImageView.snp.makeConstraints { (make) in
            make.height.width.equalTo(14);
            make.left.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-5)
        }
        romTitleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(homecateImageView.snp_right).offset(5);
            make.right.equalToSuperview().offset(-5)
            make.centerY.equalTo(homecateImageView)
        }
        imageView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(homecateImageView.snp_top).offset(-5)
        }
        nikeNameLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(5);
            make.bottom.equalToSuperview().offset(-5)
        }
        onLineBtn.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-5)
            make.centerY.equalTo(nikeNameLabel)
        }
    }
}
