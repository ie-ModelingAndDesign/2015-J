//
//  ThirdViewController.swift
//  new_swift
//
//  Created by onaga on 2015/12/10.
//  Copyright © 2015年 onaga. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        // tabBarItemのアイコンを設定する
        self.tabBarItem = UITabBarItem(title: "その他", image: UIImage(named: "etc.png"), selectedImage: UIImage(named: "etc.png"))
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
        
        /*　ボタンを作成
        let backButton: UIButton = UIButton(frame: CGRectMake(0, 0, 120, 50))
        backButton.backgroundColor = UIColor.redColor();
        backButton.layer.masksToBounds = true
        backButton.setTitle("Back", forState: .Normal)
        backButton.layer.cornerRadius = 20.0
        backButton.layer.position = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height-50)
        backButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        self.view.addSubview(backButton);*/
    }
    
    /*　ボタンイベント
    internal func onClickMyButton(sender: UIButton){
        
        // 遷移するViewを定義
        let myViewController: UIViewController = ThirdViewController()
        
        //　アニメーションを設定
        myViewController.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        
        // Viewの移動
        self.presentViewController(myViewController, animated: true, completion: nil)
    } */
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
