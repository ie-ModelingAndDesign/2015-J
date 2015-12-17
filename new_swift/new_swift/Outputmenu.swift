//
//  Outputmenu.swift
//  new_swift
//
//  Created by rate on 12/17/15.
//  Copyright © 2015 onaga. All rights reserved.
//

import UIKit

class Outputmenu: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        // tabBarItemのアイコンを設定する
        self.tabBarItem = UITabBarItem(title: "統計", image: UIImage(named: "toukei.png"), selectedImage: UIImage(named: "toukei.png"))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 背景色を設定
        self.view.backgroundColor = UIColor.whiteColor()
    
        // ボタンの定義をおこなう.
        let myButton = UIButton(frame: CGRectMake(0,0,100,50))
        myButton.backgroundColor = UIColor.orangeColor()
        myButton.layer.masksToBounds = true
        myButton.setTitle("物換算", forState: .Normal)
        myButton.layer.cornerRadius = 20.0
        myButton.layer.position = CGPoint(x: self.view.bounds.width/2, y:200)
        myButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        
        // ボタンをViewに追加する.
        self.view.addSubview(myButton);
    }
    
    
    /*
    ボタンイベント
    */
    internal func onClickMyButton(sender: UIButton){
        
        // 移動先のViewを定義する.
        let secondViewController = SecondViewController()
        
        // SecondViewに移動する.
        self.presentViewController(secondViewController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
