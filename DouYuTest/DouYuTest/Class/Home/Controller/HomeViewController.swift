//
//  HomeViewController.swift
//  DouYuTest
//
//  Created by pp on 2019/4/15.
//  Copyright © 2019 pp. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUi()
    }
    
}
//设置界面
extension HomeViewController {
    private func setupUi() {
        
        setupNaviBar()
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
}
