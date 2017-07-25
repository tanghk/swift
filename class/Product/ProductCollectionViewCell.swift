//
//  ProductCollectionViewCell.swift
//  hk
//
//  Created by otouzi on 2016/11/7.
//  Copyright © 2016年 otouzi. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher
import SDWebImage
 class ProductCollectionViewCell: UICollectionViewCell {
 
    let width = UIScreen.main.bounds.size.width//获取屏幕宽
      var thumb: String?
    
    var imagePadding:Int?
    var nameFont:CGFloat?
    var increaseFont:Int?
    var widthPad:Int?
    var investBtnWidth:Int? //投资按钮的宽度
    
    var risk_key:String? //风险级别
    
    
    var imageWidth:Double?
    var imageHeight:Double?
    var revenueLeft:Int?
    var closeLeft:Int?
    
    var topPad:Int?
    
    var scalePad:Int?
    
    
    var progress:Int?
    
    
    var restMoneypad:Int?
    var nameWidth:Int?

    
    
    
    
    
    
    
    let const = "%"
    
    
    var titleLabel:UILabel?//标题

    lazy var levelImageView = UIImageView() //图片
    
    lazy var riskImageView = UIImageView()//风险
    
    lazy var revenueLabel = UILabel()//年化收益
    
    
    var productModel: ProductModel? {
        didSet {
            
            titleLabel?.text = String(format: "%@", productModel!.name!)
           
            thumb = productModel!.thumb
            let imageUrl = URL(string: thumb!)
            
            levelImageView.sd_setImage(with: imageUrl, placeholderImage: UIImage(named:"info_default_img"))
           
            risk_key = String(format: "%@", productModel!.risk!)

            let  risk = Int(risk_key!)
            switch risk! {
            case 1:
                riskImageView.image = UIImage(named: "info_grade_a")
            case 2:
                riskImageView.image = UIImage(named: "info_grade_b")
            case 3:
                riskImageView.image = UIImage(named: "info_grade_c")
            case 4:
                riskImageView.image = UIImage(named: "info_grade_d")
            case 5:
                riskImageView.image = UIImage(named: "info_grade_f")
            default:
                break
            }

            revenueLabel.text = String(format: "%@%%", productModel!.revenue!)

            
            //富文本设置
            let attributeString = NSMutableAttributedString(string:"welcome to hangge.com")
            //从文本0开始6个字符字体HelveticaNeue-Bold,16号
            attributeString.addAttribute(NSFontAttributeName,
                                         value: UIFont(name: "HelveticaNeue-Bold", size: 16)!,
                                         range: NSMakeRange(0,6))
            //设置字体颜色
            attributeString.addAttribute(NSForegroundColorAttributeName, value: UIColor.blue,
                                         range: NSMakeRange(0, 3))
            //设置文字背景颜色
            attributeString.addAttribute(NSBackgroundColorAttributeName, value: UIColor.green,
                                         range: NSMakeRange(3,3))
            revenueLabel.attributedText = attributeString
        
           
            
                 }
        
        }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
     
        
        
        createCellUI()
        
        
    }
    
    func createCellUI() {
        
        if iphone6_4_7||iphone6Plus_5_5 {
            
            nameFont = 15
            increaseFont = 10
            imagePadding = 21
            imageWidth = (186/2)
            imageHeight =  (138/2)
            topPad = 67/2
            revenueLeft = 15
            
            closeLeft = 20
            
            if iphone6Plus_5_5 {
                closeLeft = 30
            }
            
            scalePad = 0;
            
        }else{
            
            nameFont = 13;
            increaseFont = 9;
            imagePadding = 7;
            topPad = 67/2;
            revenueLeft = 7;
            closeLeft = 10;
            
            imageWidth = (186/2)*0.9
            imageHeight =  (138/2)*0.9
        }
        
        //风险图片
        riskImageView.backgroundColor = UIColor.lightGray
        self .addSubview(riskImageView)

        riskImageView.snp.makeConstraints { (make) in
            make.left.equalTo(imagePadding!)
            make.top.equalTo(11)
            make.width.equalTo(41/2)
            make.height.equalTo(41/2)
        }
     
        
       //标题
        titleLabel = UILabel ()
        titleLabel?.font = Font(R: nameFont!)
        self .addSubview(titleLabel!)

        titleLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(riskImageView.snp.right).offset(7)
            make.top.equalTo(self.contentView.snp.top).offset(14)
            make.height.equalTo(15)

        })
        

        //thumb
        levelImageView.backgroundColor = UIColor.red
        self .addSubview(levelImageView)
        
        levelImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView.snp.left).offset(imagePadding!);
            make.top.equalTo(riskImageView.snp.bottom).offset(17);
            make.width.equalTo(imageWidth!);
            make.height.equalTo(imageHeight!);
        }
        
        
      //年化收体育
        revenueLabel.font = Font(R: 34/2)
        revenueLabel.textColor = RGB(r: 233, g: 76, b: 61)
        revenueLabel.textAlignment =  NSTextAlignment.left
        self.addSubview(revenueLabel)
        
        revenueLabel.snp.makeConstraints { (make) in
            make.left.equalTo(levelImageView.snp.right).offset(revenueLeft!)
            make.top.equalTo((titleLabel?.snp.bottom)!).offset(topPad!)
            make.height.equalTo(34/2)

        }
        revenueLabel.setContentHuggingPriority(UILayoutPriorityRequired, for: UILayoutConstraintAxis(rawValue: 0)!)
        revenueLabel.setContentCompressionResistancePriority(UILayoutPriorityRequired, for: UILayoutConstraintAxis(rawValue: 0)!)
      
     
        

        
    }
    
// MARK: - 拼接字符串方法调用
    //传入字符串、字体      返回NSMutableAttributedString
    private func appendStrWithString(str:String,font:CGFloat) -> NSMutableAttributedString {
        var attributedString : NSMutableAttributedString
        let attStr = NSMutableAttributedString.init(string: str, attributes: [NSFontAttributeName : UIFont.systemFont(ofSize: font)])
        attributedString = NSMutableAttributedString.init(attributedString: attStr)
        return attributedString
    }
    
    //传入字符串、字体、颜色      返回NSMutableAttributedString
    private func appendColorStrWithString(str:String,font:CGFloat,color:UIColor) -> NSMutableAttributedString {
        var attributedString : NSMutableAttributedString
        let attStr = NSMutableAttributedString.init(string: str, attributes: [NSFontAttributeName : UIFont.systemFont(ofSize: font),NSForegroundColorAttributeName:color])
        attributedString = NSMutableAttributedString.init(attributedString: attStr)
        return attributedString
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
  }
