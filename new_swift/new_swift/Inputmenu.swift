//
//  FirstViewController.swift
//  new_swift
//
//  Created by onaga on 2015/12/10.
//  Copyright © 2015年 onaga. All rights reserved.
//

import UIKit
import RealmSwift

class Inputmenu: UIViewController, UITextFieldDelegate {
    
    private var myImageView: UIImageView!
    private var button: UIButton!
    private var textView: UITextView!
    //　テキストの定義（縦と横の長さ）
    private var text1: UITextField! = UITextField(frame: CGRectMake(0,0,200,30))
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        // tabBarItemのアイコンを設定する
        self.tabBarItem = UITabBarItem(title: "帳簿", image: UIImage(named: "image/chobo.png"), selectedImage: UIImage(named: "chobo.png"))
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    required override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!){
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //　UIImageViewを作成する。
        myImageView = UIImageView(frame: CGRectMake(0, 0, 100, 120))
        
        //　表示する画像を設定する
        let myImage = UIImage(named: "image/pazdra.png")
        
        // 画像をUIImageViewに設定する
        myImageView.image = myImage
        
        // 画像の表示する座標を指定する
        myImageView.layer.position = CGPoint(x: self.view.bounds.width/2, y: 200.0)
        
        // UIImageをViewに追加する
        self.view.addSubview(myImageView)
        
        //　入力前に薄い文字を表示する
        text1.placeholder = "金額を入力してね"
        
        // 枠を表示する
        text1.borderStyle = UITextBorderStyle.RoundedRect
        
        //　キーボードを数字入力で固定化
        text1.keyboardType = UIKeyboardType.NumberPad
        
        //　他のクラスへメッセージを送る目的のデザインパターン
        text1.delegate = self
        
        // UITextFieldの表示する位置を設定する。
        text1.layer.position = CGPoint(x:self.view.bounds.width/2, y:300)
        
        // 外をタップしてキーボードを閉じる
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
        
        // ボタン配置
        let button = UIButton()
        button.setTitle("次へ", forState: .Normal)
        button.frame = CGRectMake(100, 100, 100, 30)
        button.backgroundColor = UIColor.blueColor()
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10.0
        button.layer.position = CGPoint(x: self.view.frame.width/2, y: 400)
        button.addTarget(self, action: "tapped", forControlEvents: .TouchUpInside)
        
        //　viewに追加
        self.view.addSubview(text1)
        self.view.addSubview(button)
    }
    
    // キーボードを閉じるために必要な関数（おまじない）
    func DismissKeyboard(){
        view.endEditing(true)
    }
    
    // ボタンが押されたときの処理
    func tapped() {
        // textFieldの値を数値として取得
        let intamount: Int? = Int(text1.text!)
        
        let inputDB = Input()
        inputDB.amount = intamount!
        print("ボタンが押されたよ！")
        // キーボードを閉じる
        view.endEditing(true)
        
        // 入力された値を表示する
        print(inputDB.amount)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
