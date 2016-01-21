//
//  GraphView.swift
//  new_swift
//
//  Created by rate on 1/7/16.
//  Copyright © 2016 onaga. All rights reserved.
//

import UIKit

class Graphview: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
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
        self.view.backgroundColor = UIColor.blueColor()
        
        
        // ボタンの定義をおこなう.
        let myButton = UIButton(frame: CGRectMake(0,0,100,50))
        myButton.backgroundColor = UIColor.orangeColor()
        myButton.layer.masksToBounds = true
        myButton.setTitle("もどる", forState: .Normal)
        myButton.layer.cornerRadius = 20.0
        myButton.layer.position = CGPoint(x: self.view.bounds.width/7, y:100)
        myButton.addTarget(self, action: "onClickGoBack:", forControlEvents: .TouchUpInside)
        
        // ボタンをViewに追加する.
        self.view.addSubview(myButton);

    }
    
    /*
    ボタンイベント
    */
    internal func onClickGoBack(sender: UIButton){
        
        // SecondViewに移動する.
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
