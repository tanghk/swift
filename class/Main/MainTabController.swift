//
//  MainTabController.swift
//  hk
//
//  Created by otouzi on 2016/11/3.
//  Copyright © 2016年 otouzi. All rights reserved.
//

import UIKit

class MainTabController: UITabBarController {

    
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
    return .portrait
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        self.tabBar.isTranslucent = false  //避免受默认的半透明色影响，关闭
        self.tabBar.backgroundColor = UIColor (colorLiteralRed: 244/255.0, green: 244/255.0, blue: 244/255.0, alpha: 1)
 
        //一共包含了两个视图
        let viewMain = MainViewController()
        let mainImage = UIImage(named: "main_btn")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        let mainSelectedImage = UIImage(named: "main_click")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        let item1 : UITabBarItem = UITabBarItem (title: nil, image: mainImage, selectedImage: mainSelectedImage)
        
        viewMain.tabBarItem = item1
        viewMain.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);

    
        
        
        let product = ProductViewController()
        let productImage = UIImage(named: "money_btn")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        let productSelectedImage = UIImage(named: "money_click")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        let item2 : UITabBarItem = UITabBarItem (title:nil, image: productImage, selectedImage: productSelectedImage)
        product.tabBarItem = item2
        product.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);

        
        
        let discover = DiscoverViewController()
        
        let discoverImage = UIImage(named: "finder_btn")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        let discoverSelectedImage = UIImage(named: "finder_click")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        let item3 : UITabBarItem = UITabBarItem (title: nil, image: discoverImage, selectedImage:discoverSelectedImage)
        discover.tabBarItem = item3
        discover .tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
        

        
        let my = MyViewController()
        let myImage = UIImage(named: "my_btn")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        let mySelectedImage = UIImage(named: "my_click")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        let item4 : UITabBarItem = UITabBarItem (title: nil, image: myImage, selectedImage: mySelectedImage)
        my.tabBarItem = item4
        my .tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
        

        
        //分别声明两个视图控制器
        let main = UINavigationController(rootViewController:viewMain)
      
        let products = UINavigationController(rootViewController:product)

        let discovers = UINavigationController(rootViewController:discover)
      
        let mine = UINavigationController(rootViewController:my)

        self.viewControllers = [main,products,discovers,mine]
        //默认选中的是游戏主界面视图
        self.selectedIndex = 0
        
        
    }
    
    
    
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
