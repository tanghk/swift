//
//  ProductViewController.swift
//  hk
//
//  Created by otouzi on 2016/11/3.
//  Copyright © 2016年 otouzi. All rights reserved.
//

import UIKit
import SVProgressHUD
let SCREENW = UIScreen.main.bounds.size.width


class ProductViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
    
      // var dataArray = [ProductModel]()
    
    var data = [ProductModel]()
   
		  
    var  collectionView :UICollectionView!
    var segmentView : UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        createUI()
        loadData()
        
    }
// MARK: - 加载数据
    func loadData()  {
        let otouziNet = OtouziNetwork()
        
        let dic: [String : AnyObject] = [
            
            "p"     : "1" as AnyObject, // 分页，可选
            "limit" : "10" as AnyObject,
            "code"  : "000" as AnyObject,
            "category" : "2" as AnyObject,
            "rule"  :"0" as AnyObject      // 筛选条件选择。 2.2.1=>0（以ios为例）
            
        ]
        
        
        otouziNet.request(type: RequestType.requestTypePost,
                          URLString: "/product/list",
                          Parameter: dic)
        { (Success) -> Void in
            
            let reponseDic = Success.0 as! NSDictionary
            let dataDic = reponseDic.value(forKey: "data")
            
            if dataDic is NSDictionary{
                let dataArry = (dataDic as! NSDictionary).value(forKey: "list")

                print(dataArry as! NSArray)
                
                var model = [ProductModel]()
                
                for dataDic in dataArry as! NSArray{
                    let modelDic = ProductModel(dict: dataDic as! [String: AnyObject])
                    
                    model.append(modelDic)
                    
                }
                
                self.data = model
                print("数据%@",self.data)
                self.collectionView .reloadData()
                
            }else{
                
                
                
            }
 
        }
 
        
        
    }
// MARK: - 创建视图
    func createUI() {
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = UIColor.white
        let appsArray: [String] = ["优选散标", "转让专区"]
        segmentView = UISegmentedControl.init(items: appsArray)
        segmentView.tintColor = UIColor.red
        segmentView.frame = CGRect(x:15, y:20, width:SCREEN_WIDTH-30, height:30)
        segmentView.setTitle("优选散标", forSegmentAt: 0)
        segmentView.setTitle("转让专区", forSegmentAt: 1)
        segmentView.addTarget(self, action: #selector(segment(seg:)), for: UIControlEvents.valueChanged)
        self.view.addSubview(segmentView)
        
        
        
        
        //创建collectionView的Flowlayout
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.minimumInteritemSpacing = 0
        flowlayout.minimumLineSpacing = 0
        flowlayout.itemSize =  CGSize(width: SCREENW, height: 358/2)
        

        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowlayout)
        collectionView.register(ProductCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "item")
        collectionView.backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.dataSource = self
        self.view.addSubview(collectionView)
        collectionView.frame = CGRect(x:0, y:64, width:SCREEN_WIDTH, height:SCREEN_HEIGHT-64-49)
        

    }
    
    func segment(seg:UISegmentedControl){
        print("%d",seg.selectedSegmentIndex)
    }
    
    // MARK: - 代理方法
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as! ProductCollectionViewCell;

        cell.productModel = self.data[indexPath.row];

        return cell;
    
    
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
