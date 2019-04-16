//
//  UiBarButtonItem_Extension.swift
//  DouYuTest
//
//  Created by pp on 2019/4/15.
//  Copyright © 2019 pp. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    convenience  init (imageName : String, highImageName  : String = "", size :  CGSize = CGSize.zero) {
        let btn = UIButton();
        btn.setImage(UIImage(named: imageName), for: .normal)
        if highImageName != "" {
        btn.setImage(UIImage(named: highImageName), for: .highlighted)
        }
        if size == CGSize.zero{
            btn.sizeToFit();
        }
        else{
            btn.frame=CGRect(origin: CGPoint.zero, size: size)
            
        }
        self.init(customView:btn)
    }
    
    
    
    
    
    class func createItem(imageName : String , highImageName : String = "", size : CGSize = CGSize.zero) -> UIBarButtonItem{
        let btn = UIButton();
        btn.setImage(UIImage(named: imageName), for: .normal)
        if highImageName != ""{
            btn.setImage(UIImage(named: highImageName), for: .highlighted)
        }
        if size == CGSize.zero{
            btn.sizeToFit();
        }else{
            btn.frame=CGRect(origin: CGPoint.zero, size: size)
        }
        return UIBarButtonItem(customView: btn);
        
    }
    
}
