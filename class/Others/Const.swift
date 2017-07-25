//
//  Const.swift
//  hk
//
//  Created by otouzi on 2016/12/27.
//  Copyright © 2016年 otouzi. All rights reserved.
//

import UIKit

//设备屏幕尺寸
public let SCREEN_WIDTH = UIScreen.main.bounds.size.width
public let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
//RGB转换
func RGB(r:CGFloat,g:CGFloat,b:CGFloat) ->UIColor{
    //
    return UIColor(red: r/225.0, green: g/225.0, blue: b/225.0, alpha: 1.0)
}


let MainColor = RGB(r: 233/255.0, g: 76/255.0, b: 61/255.0)

/// iPhone 4
let iphone4x_3_5 = SCREEN_HEIGHT == 480 ? true : false
/// iPhone 5
let iphone5x_4_0 = SCREEN_HEIGHT == 568 ? true : false
/// iPhone 6
let iphone6_4_7 = SCREEN_HEIGHT  == 667 ? true : false
/// iPhone 6P
let iphone6Plus_5_5 = SCREEN_HEIGHT == 736 ? true : false

func Font(R:CGFloat)->UIFont{
    
    return UIFont.systemFont(ofSize: R)
}
let RETURN_OK = 200
