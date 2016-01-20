//
//  FirstViewController.swift
//  new_swift
//
//  Created by onaga on 2015/12/10.
//  Copyright © 2015年 onaga. All rights reserved.
//

import UIKit
import RealmSwift

class Inputmenu: UIViewController, UITextFieldDelegate, UIToolbarDelegate{
    
    private var button: UIButton!
    //　テキストの定義（縦と横の長さ）
    private let text1: UITextField = UITextField(frame: CGRectMake(0,0,200,30))
    private var label = UILabel(frame: CGRectMake(0, 50, 200, 20));
    private var label2 = UILabel(frame: CGRectMake(0, 100, 100, 20));
    
    weak var myTextField: UITextField!
    private var myToolBar: UIToolbar!
    private var myDatePicker: UIDatePicker!
    
    private var pButton = UIButton(frame: CGRectMake(10, 150, 70, 70));
    private var pButtonImage:UIImage = UIImage(named: "image/pazdra.png")!;
    private var mButton = UIButton(frame: CGRectMake(90, 150, 70, 70));
    private var mButtonImage:UIImage = UIImage(named: "image/monst.png")!;
    private let game: UITextField = UITextField(frame: CGRectMake(0, 0, 200, 30));
    
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        // tabBarItemのアイコンを設定する
        self.tabBarItem = UITabBarItem(title: "帳簿", image: UIImage(named: "image/chobo.png"), selectedImage: UIImage(named: "image/chobo.png"))
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    required override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!){
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //　表示する文字の設定
        label.text = "課金の帳簿";
        label.font = UIFont.systemFontOfSize(30)
        label2.text = "日付";
        label2.font = UIFont.systemFontOfSize(20)
        
        
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
        
        // 入力欄の設定（日付設定用の枠組の設定）
        myTextField = UITextField()
        myTextField.placeholder = dateToString(NSDate())
        myTextField.text = dateToString(NSDate())
        myTextField.layer.borderColor = UIColor.blueColor().CGColor
        myTextField.layer.borderWidth = 2.0
        myTextField.frame = CGRectMake(100, 100, 130, 30) //(x座標,　y座標, width, height)
        myTextField.layer.position = CGPoint(x: self.view.frame.width/2, y: 110)
        self.view.addSubview(myTextField)
        
        // UIDatePickerの設定（日付を取得するためのもの）
        myDatePicker = UIDatePicker()
        myDatePicker.addTarget(self, action: "changedDateEvent:", forControlEvents: UIControlEvents.ValueChanged)
        myDatePicker.datePickerMode = UIDatePickerMode.Date
        myTextField.inputView = myDatePicker
        
        // UIToolBarの設定(日付設定用)
        myToolBar = UIToolbar(frame: CGRectMake(0, self.view.frame.size.height/6, self.view.frame.size.width, 40.0))
        myToolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height - 20.0)
        myToolBar.barStyle = .BlackTranslucent
        myToolBar.tintColor = UIColor.whiteColor()
        myToolBar.backgroundColor = UIColor.blackColor()
        
        let myToolBarBtn = UIBarButtonItem(title: "完了", style: .Plain, target: self, action: "tappedToolBarBtn:")
        let myToolBarBtnToday = UIBarButtonItem(title: "今日", style: .Plain, target: self, action: "tappedToolBarBtnToday:")
        myToolBarBtn.tag = 1
        myToolBar.items = [myToolBarBtn, myToolBarBtnToday]
        
        myTextField.inputAccessoryView = myToolBar
        
        // ゲーム選択ボタン用
        pButton.setBackgroundImage(pButtonImage, forState: UIControlState.Normal)
        pButton.addTarget(self, action: "pBtn_click", forControlEvents: .TouchUpInside);
        
        mButton.setBackgroundImage(mButtonImage, forState: UIControlState.Normal)
        mButton.addTarget(self, action: "mBtn_click", forControlEvents: .TouchUpInside);
        
        
        //　viewに追加
        self.view.addSubview(text1)
        self.view.addSubview(label)
        self.view.addSubview(label2)
        
        self.view.addSubview(button)
        self.view.addSubview(pButton)
        self.view.addSubview(mButton)
    }
    
    
    // pButtonが選択されたとき
    func pBtn_click(){
        game.text = "パズドラ"
    }
    
    // mButtonが選択されたとき
    func mBtn_click(){
        game.text = "モンスト"
    }
    
    
    // キーボードを閉じるために必要な関数（おまじない）
    func DismissKeyboard(){
        view.endEditing(true)
    }
    
    // 「次へ」ボタンが押されたときの処理
    func tapped() {
        // textFieldの値を数値として取得
        if isValidateInputContents() == false {
            return
        }
        
        let intamount: Int? = Int(text1.text!)
        
        let inputDB = Input()
        inputDB.amount = intamount!
        inputDB.day = 7
        inputDB.month = 1
        inputDB.year = 2016

        // textFieldの値を取得
        let inputText = text1.text
        let inputdate = myTextField.text
        let inputgame = game.text
        print("ボタンが押されたよ！")
        // キーボードを閉じる
        view.endEditing(true)
        
        do {
            let realm = try! Realm()
            
            try! realm.write{
                realm.add(inputDB)
            }
        }
        
        text1.text = ""
        
        // 入力された値を表示する
        print(inputText)
        print(inputdate)
        print(inputgame)
    }
    
    // 「完了」を押すと閉じる
    func tappedToolBarBtn(sender: UIBarButtonItem){
        myTextField.resignFirstResponder()
    }
    
    // 「今日」を押すと今日の日付をリセットする
    func tappedToolBarBtnToday(sender: UIBarButtonItem){
        myDatePicker.date = NSDate()
        changeLabelDate(NSDate())
    }
    
    //
    func changedDateEvent(sender:AnyObject?){
        //var dateSelecter: UIDatePicker = UIDatePicker()
        self.changeLabelDate(myDatePicker.date)
    }
    
    func changeLabelDate(date:NSDate){
        myTextField.text = self.dateToString(date)
    }
    
    func dateToString(date:NSDate) -> String{
        let calender = NSCalendar.currentCalendar()
        let comps: NSDateComponents = calender.components([.Year, .Month, .Day], fromDate: date)
        
        let date_formatter: NSDateFormatter = NSDateFormatter()
        //var weekdays: Array = ["日","月","火","水","木","金","土"]
        
        date_formatter.locale = NSLocale(localeIdentifier: "ja")
        date_formatter.dateFormat = "yyyy年MM月dd日"
        
        return date_formatter.stringFromDate(date)
    }
    
    private func isValidateInputContents() -> Bool{
        // 名前の入力
        if let name = text1.text{
            if name.characters.count == 0{
                return false
            }
        }else{
            return false
        }
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


