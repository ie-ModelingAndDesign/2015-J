//
//  Title.swift
//  new_swift
//
//  Created by onaga on 2015/12/11.
//  Copyright © 2015年 onaga. All rights reserved.
//

import UIKit


class Title: UIViewController, UITextFieldDelegate {
    
    private let text1: UITextField = UITextField(frame: CGRectMake(0,0,300,30))
    
    override func viewDidLoad() {
        text1.text = "画面をタップしてください"
        
        // 枠を表示する
        text1.borderStyle = UITextBorderStyle.RoundedRect
        
        // 表示する位置を調整
        text1.layer.position = CGPoint(x: self.view.bounds.width/2, y: 200)
        
        //　viewに追加
        self.view.addSubview(text1)
        
        // タップされたときの処理を関数に投げる
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "MovetoTitleView")
        view.addGestureRecognizer(tap)
    }
    
    // タップされたときの処理
    func MovetoTitleView (){
        let myTitleView: UIViewController = TitleView()
        
        // Viewの移動
        self.presentViewController(myTitleView, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}