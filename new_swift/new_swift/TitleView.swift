//
//  TitleView.swift
//  new_swift
//
//  Created by onaga on 2015/12/11.
//  Copyright © 2015年 onaga. All rights reserved.
//

import UIKit


class TitleView: UIViewController, UITextFieldDelegate {
    
    private var window: UIWindow?
    
    // タブバーコントローラの設定
    private var myTabBarController: UITabBarController!
    
    var myNavigationController: UINavigationController?
    
    override func viewDidLoad() {
        // Override point for customization after application launch.
        
        
        // UIWindowを生成する。
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        //　タブに設定するViewControllerのインスタンスを生成する。
        let myFirstTab: UIViewController = Inputmenu()
        let mySecondTab: UIViewController = Outputmenu()
        let myThirdTab: UIViewController = DBViewController()
        
        //　背景色の変更
        self.window?.backgroundColor = UIColor.whiteColor()
        
        //　タブに要素を持つArrayの.を作成
        let myTabs = NSArray(objects: myFirstTab, mySecondTab, myThirdTab)
        
        //　UITabControllerの作成
        myTabBarController = UITabBarController()
        
        // ViewControllerを設定
        myTabBarController?.setViewControllers(myTabs as? [UIViewController], animated: false)
        
        // RootViewControllerに設定する。
        self.window?.rootViewController = myTabBarController
        
        self.window?.makeKeyAndVisible()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}