//
//  ViewController.swift
//  hk
//
//  Created by otouzi on 2016/10/31.
//  Copyright © 2016年 otouzi. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate {
 
    
    
     var tableView : UITableView?
     var name :UILabel?
    
    
    var entertString:String?
    
    
    
    var enterText: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        /*
         * UIlabel
         */
        name = UILabel (frame: CGRect( x:100, y:101, width:250, height:220))
      //  name?.text = "你好沃投资我们的投资理财产品"
        name?.font = UIFont(name:"Zapfino",size:20)
        
        self.view.addSubview(name!)

     
        let attributeString = NSMutableAttributedString(string:"你好沃投资我们的投资理财产品")
        
        attributeString.addAttribute(NSFontAttributeName,
                                     value: UIFont(name: "HelveticaNeue-Bold", size: 16)!,
                                     range: NSMakeRange(0,6))
        //设置字体颜色
        attributeString.addAttribute(NSForegroundColorAttributeName, value: UIColor.blue,
                                     range: NSMakeRange(0, 3))
        //设置文字背景颜色
        attributeString.addAttribute(NSBackgroundColorAttributeName, value: UIColor.green,
                                     range: NSMakeRange(3,3))
      
            name?.attributedText = attributeString
        
        
        
        /*
         *UIButton
         */
        
        
        //创建按钮
        let button:UIButton = UIButton(type:.custom)
        //设置按钮位置和大小

        button.frame = CGRect(x:100, y:250, width:100, height:30)
        //设置按钮文字
        button.setTitle("确定", for:.normal)
        button.backgroundColor = UIColor.red
        button.setTitle("取消", for:.selected)
  
        self.view.addSubview(button)
        
        button.addTarget(self, action: #selector(btnclick(button:)), for: UIControlEvents.touchUpInside)
        
        
        /*
         *UIImageView
         */
        
        let imageV:UIImageView = UIImageView (frame:CGRect(x:0.0, y:0.0, width:414, height:64));

        imageV.image  = UIImage(named:"home")
     
        self.view .addSubview(imageV)
        
        
    
    
        
        /**
         *tableView
         */
        let headerTabel = UITableView (frame:CGRect(x:0.0, y:64.0, width:414, height:240));
        
        headerTabel.delegate = self
        headerTabel.dataSource = self
        

        self.view .addSubview(headerTabel)
        
        
        
        
        /*
         *UItextfield
         */
    
       enterText = UITextField(frame:CGRect(x:280, y:64.0, width:414, height:240))

        enterText?.placeholder = "请输入内容"
        enterText?.delegate = self
        self.view.addSubview(enterText!)
        
        
        
        
        
        
        
    
    
    }

    
    

    
    
    
    
    func btnclick(button :UIButton) {
        
        
        button.isSelected = !button.isSelected
        print("你好我投资")
        name?.text = "你好"
        
    }
    /*
     *tableveiw代理方法
     */
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
        
    }

  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10 ;
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier="identtifier";
        
        var cell=tableView.dequeueReusableCell(withIdentifier: identifier);
        
        if(cell == nil){
            
            cell=UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: identifier);
            
        }
        
        
        cell?.textLabel?.text = "你更好" + "\(indexPath.row)"
        cell?.accessoryType=UITableViewCellAccessoryType.disclosureIndicator;
        
        return cell!;
    }
    
    
    
    /*
     *textfield代理方法
     */
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(textField.text)
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       enterText?.resignFirstResponder()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

