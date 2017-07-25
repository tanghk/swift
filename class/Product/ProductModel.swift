//
//  ProductModel.swift
//  hk
//
//  Created by otouzi on 2016/11/7.
//  Copyright © 2016年 otouzi. All rights reserved.
//

import UIKit

class ProductModel: NSObject {
    var name: String?
    var revenue: String?
    var invest_percent: String?
    var way_repayment: String?
    var increase: String?
    var total_invest_money: String?
    var thumb:String?
    var id: String?
    var risk :String?
    
    
    init(dict: [String: AnyObject]) {
        super.init()
       revenue = dict["revenue"] as? String
       invest_percent = dict["invest_percent"] as? String
       way_repayment = dict["way_repayment"] as? String
       id = dict["id"] as? String
       increase = dict["increase"] as? String
       total_invest_money = dict["total_invest_money"] as? String
       name = dict["name"] as? String
       thumb = dict["thumb"] as?  String
       risk = dict["risk"] as? String
    }

    
}
/*
 {
 activityIncrease =         (
 "\U6ee1\U6807+0.8%"
 );
 attribute = "\U8bf7\U9009\U62e9";
 "attribute_key" = 0;
 category = "\U4f18\U9009\U6563\U6807";
 "category_key" = 2;
 "closed_period" = 3;
 "created_at" = 1478254464;
 deadline = "12\U6708";
 "deadline_key" = 12;
 "detail_thumb" = "http://debug.otouzi.com:8012/Public/uploads/project2016-11-04/m_581c5f80d0537.png";
 extend =         {
 event = OpenBrowser;
 href = "http://debug.otouzi.com:8012/product/browser/info/1287.html";
 };
 id = 1287;
 increase = "0.0";
 industry = "<null>";
 "invest_percent" = "0.01";
 money = 150000;
 name = "\U6d4b\U8bd5\U6295\U8d44";
 restMoneyNum = "148000.0";
 revenue = "10.10";
 risk = A;
 "risk_key" = 1;
 showFixedDate = 0;
 state = "\U52df\U96c6\U4e2d";
 thumb = "http://debug.otouzi.com:8012/Public/uploads/project2016-11-04/581c5f80d0537.png";
 "total_invest_money" = "2000.00";
 "way_repayment" = "\U7b49\U672c\U7b49\U606f";
 "way_repayment_key" = 5;
 },

 */
