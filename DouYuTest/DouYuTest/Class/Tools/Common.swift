//
//  Common.swift
//  DouYuTest
//
//  Created by pp on 2019/4/16.
//  Copyright © 2019 pp. All rights reserved.
//

import UIKit

//let kStatusBarH : CGFloat = 20
let kNaviBarH :CGFloat = 44

let kScreenW = UIScreen.main.bounds.width
let kScreenH = UIScreen.main.bounds.height

let kStatusBarH = UIApplication.shared.statusBarFrame.height
let kBottomH = CGFloat((UIApplication.shared.delegate?.window?!.safeAreaInsets.bottom)!)
let kTabbarH :CGFloat = 49
let kNavAndTabH = kNaviBarH + kStatusBarH + kBottomH + kTabbarH


