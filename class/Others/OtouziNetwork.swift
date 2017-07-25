//
//  OtouziNetwork.swift
//  hk
//
//  Created by otouzi on 2016/11/4.
//  Copyright © 2016年 otouzi. All rights reserved.
//

import UIKit
import Alamofire
//创建请求类枚举
enum RequestType: Int {
    case requestTypeGet
    case requestTypePost
    case requestTypeDelegate
}





//关于网络检测枚举
let ReachabilityStatusChangedNotification = "ReachabilityStatusChangedNotification"

enum ReachabilityType: CustomStringConvertible {
    case WWAN
    case WiFi
    
    var description: String {
        switch self {
        case .WWAN: return "WWAN"
        case .WiFi: return "WiFi"
        }
    }
}

enum ReachabilityStatus: CustomStringConvertible  {
    case Offline
    case Online(ReachabilityType)
    case Unknown
    
    var description: String {
        switch self {
        case .Offline: return "Offline"
        case .Online(let type): return "Online (\(type))"
        case .Unknown: return "Unknown"
        }
    }
}



//创建一个闭包(注:oc中block)
typealias sendVlesClosure = (AnyObject?, NSError?)->Void
typealias uploadClosure = (AnyObject?, NSError?,Int64?,Int64?,Int64?)->Void



class OtouziNetwork: NSObject {

    
     let BaseURL = "http://debug.otouzi.com:8012"
   
    //网络请求中的GET,Post,DELETE
    func request(type:RequestType ,URLString:String, Parameter:[String:AnyObject], block:@escaping sendVlesClosure) {
     
        let  token    = UserDefaults .standard.object(forKey: "Token")
        let  sesssion = UserDefaults .standard.object(forKey: "Session")
        let urlString = NSString(format: "%@%@",BaseURL,URLString ) as String

        
        let headers = [
            "Access-Token": token as! String,
            "Application-Session": sesssion as! String,
            "Api-version":"5"
        
        ]
        switch type {
        case .requestTypeGet:
          
            
            
            Alamofire.request (urlString ,
                               method: .get ,
                               parameters:Parameter,
                               encoding: JSONEncoding.default,
                headers: headers)
                .responseJSON { response in
                    
                    block(response.result.value as AnyObject?,nil)
                    
                    }
            
            
            
            
            
            

        case .requestTypePost:
            
            
            Alamofire.request (urlString ,
                               method: .post ,
                               parameters:Parameter,
                               encoding: JSONEncoding.default ,
                               headers: headers)
                .responseJSON { response in
                    
                   block(response.result.value as AnyObject?,nil)
                 //   block(response as AnyObject?,nil)
            }
            
            
            
            
            
            
            
            
        case .requestTypeDelegate:
            
            
            Alamofire.request (urlString ,
                               method:.delete ,
                               parameters:Parameter,
                               encoding: JSONEncoding.default,
                               headers: headers )
                .responseJSON { response in
                    
                    block(response.result.value as AnyObject?,nil)
                    
            }        }
        
    }

    
    
    
   
   
}
