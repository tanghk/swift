//
//  GuideController.swift
//  hk
//
//  Created by otouzi on 2016/11/2.
//  Copyright © 2016年 otouzi. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Foundation


var scrollView = UIScrollView()
var button = UIButton()
var pageControl:UIPageControl!
let numOfPages = 3


class GuideController: UIViewController,UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
      let frame = self.view.bounds
        
        
        self.view.backgroundColor = UIColor (colorLiteralRed: 244/255.0, green: 244/255.0, blue: 244/255.0, alpha: 1)

        scrollView = UIScrollView(frame: frame)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
    //    scrollView.contentOffset = CGPointZero
        // 将 scrollView 的 contentSize 设为屏幕宽度的3倍(根据实际情况改变)
        scrollView.contentSize = CGSize(width: frame.size.width * CGFloat(numOfPages), height: frame.size.height)
        
        scrollView.delegate = self
        
        for index  in 0..<numOfPages {
            // 这里注意图片的命名
            let imageView = UIImageView(image: UIImage(named: "5help\(index + 1)"))
            imageView.frame = CGRect(x: frame.size.width * CGFloat(index), y: 0, width: frame.size.width, height: frame.size.height)
            scrollView.addSubview(imageView)
        }
        
        self.view.addSubview(scrollView)
        
        
        pageControl = UIPageControl()
        pageControl.frame = CGRect(x: 0 , y: 0, width: 90, height: 30)
           
     pageControl.pageIndicatorTintColor = UIColor (colorLiteralRed: 246/255.0 ,green:216/255.0 , blue:96/255.0, alpha:1/1.0)
 
        
        pageControl.center=CGPoint(x:SCREEN_WIDTH/2,y:120*SCREEN_HEIGHT/1334);
            pageControl.backgroundColor = UIColor.clear
        pageControl.numberOfPages = numOfPages
            pageControl.currentPage = 0
        //设置页控件点击事件
        pageControl.addTarget(self, action: #selector(pageChanged(sender:)),
                              for: UIControlEvents.valueChanged)
    
        

        self.view.addSubview(pageControl)
    
        //创建按钮
       button = UIButton(type:.custom)
        //设置按钮位置和大小
        button.frame = CGRect(x:(SCREEN_WIDTH-294/2)/2, y:self.view.frame.size.height-50-10, width: 294/2, height:67/2+10)
        //设置按钮文字
button.backgroundColor = UIColor.clear
        self.view.addSubview(button)
        
        button.addTarget(self, action: #selector(btnclick(button:)), for: UIControlEvents.touchUpInside)
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        

        let uuid          =  UIDevice.current
        let uuidxx        =  uuid.identifierForVendor?.uuidString
        let uuids:String  =  NSString(format: "%@",uuidxx! ) as String
        let udid          =  UIDevice.current.model
        let timeSp        =  NSString(format: "%.0f",NSDate().timeIntervalSince1970)
  

      
    let parameters: Parameters = [
            "device_type": "ios",
            "device_unique":uuids,
            "device_model": udid,
            "system_version": "2.2.1",
            "request_timestamp": timeSp as String,
            "app_session_token":"2222222222222222222222222222222",
            "api_version":"5"
]
        UserDefaults.standard.set("2222222222222222222222222222222", forKey: "Session")
        //设置同步
        UserDefaults.standard.synchronize()

        
        
        print("parameters\(parameters)")
        

        Alamofire.request ("http://debug.otouzi.com:8012/device/register" ,method: .post ,parameters:parameters,encoding: JSONEncoding.default )
            .responseJSON { response in
               
                if let JSON = response.result.value {
                    print("JSON: \(JSON)") //具体如何解析json内容可看下方“响应处理”部分
           
                
                }
                
                
                
            switch response.result.isSuccess {
                case true:
                    //把得到的JSON数据转为字典
                    if let j = response.result.value as? NSDictionary{
                        //获取字典里面的key为数组
                        let data = j.value(forKey: "data")as? NSDictionary
                        //便利数组得到每一个字典模型
                        
                        
                       let access_token = data?.value(forKey: "access_token")
                        let token  = NSString(format: "%@",access_token as! CVarArg)as String

                        print("token+\(token)")
                        UserDefaults.standard.set(token, forKey: "Token")
                          UserDefaults.standard.set(token, forKey: "Token")
                      //设置同步
                        UserDefaults.standard.synchronize()
                    }
                case false:
                    
                    print(response.result.error)
                
                
                }
                
     
                
                    }
     

        
        
        
        
        
    }
    

    func btnclick(button :UIButton) {
        
        
      
    
        let main = MainTabController()
        UIApplication.shared.keyWindow?.rootViewController = main
    }
    
    
    
    
    //点击页控件时事件处理
    func pageChanged(sender:UIPageControl) {
        //根据点击的页数，计算scrollView需要显示的偏移量
        var frame = scrollView.frame
        frame.origin.x = frame.size.width * CGFloat(sender.currentPage)
        frame.origin.y = 0
        //展现当前页面内容
        scrollView .scrollRectToVisible(frame, animated:true)
    }
    
    
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset
        // 随着滑动改变pageControl的状态
        pageControl.currentPage = Int(offset.x / view.bounds.width)
        
        // 因为currentPage是从0开始，所以numOfPages减1
        if pageControl.currentPage == numOfPages - 1 {
            UIView.animate(withDuration: 0.5) {
               button.alpha = 1.0
            }
        } else {
            UIView.animate(withDuration: 0.2) {
               button.alpha = 0.0
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



    
    

    
    
}
