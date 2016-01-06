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
        self.tabBarItem = UITabBarItem(title: "統計", image: UIImage(named: "image/toukei.png"), selectedImage: UIImage(named: "toukei.png"))
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
        
        let line = UIView(frame: CGRectMake(0, self.view.bounds.height/1.5,
            self.view.bounds.width, 2))
        line.backgroundColor = UIColor.blackColor()
        view.addSubview(line);
        
    
        // 物換算出力遷移ボタンの設定
        let myButton = UIButton(frame: CGRectMake(0,0,200,80))
        myButton.backgroundColor = UIColor.orangeColor()
        myButton.layer.masksToBounds = true
        myButton.setTitle("物換算", forState: .Normal)
        myButton.layer.cornerRadius = 20.0
        myButton.layer.position = CGPoint(x: self.view.bounds.width/1.34, y:550)
        myButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        
        // ボタンをViewに追加する.
        self.view.addSubview(myButton);
        
        // リスト出力画面遷移ボタンの設定
        let listViewButton = UIButton(frame: CGRectMake(0,0,200,80))
        listViewButton.backgroundColor = UIColor.orangeColor()
        listViewButton.layer.masksToBounds = true
        listViewButton.setTitle("リスト", forState: .Normal)
        listViewButton.layer.cornerRadius = 20.0
        listViewButton.layer.position = CGPoint(x: self.view.bounds.width/4, y:550)
        listViewButton.addTarget(self, action: "onClickGotoListview:", forControlEvents: .TouchUpInside)
        
        // ボタンをViewに追加する.
        self.view.addSubview(listViewButton);
        
        // グラフ出力画面遷移ボタンの設定
        let graphViewButton = UIButton(frame: CGRectMake(0,0,200,80))
        graphViewButton.backgroundColor = UIColor.orangeColor()
        graphViewButton.layer.masksToBounds = true
        graphViewButton.setTitle("グラフ", forState: .Normal)
        graphViewButton.layer.cornerRadius = 20.0
        graphViewButton.layer.position = CGPoint(x: self.view.bounds.width/4, y:640)
        graphViewButton.addTarget(self, action: "onClickGotoGraphview:", forControlEvents: .TouchUpInside)
        
        // ボタンをViewに追加する.
        self.view.addSubview(graphViewButton);
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
    
    internal func onClickGotoListview(sender: UIButton){
        
        // 移動先のViewを定義する.
        let listView = Listview()
        
        // リスト出力画面に移動する.
        self.presentViewController(listView, animated: true, completion: nil)
    }

    internal func onClickGotoGraphview(sender: UIButton){
        
        // 移動先のViewを定義する.
        let graphView = Graphview()
        
        // グラフ出力画面に移動する.
        self.presentViewController(graphView, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
