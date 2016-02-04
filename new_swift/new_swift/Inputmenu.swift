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
    private var buttonImage:UIImage = UIImage(named: "image/next_k_12.png")!;
    //　テキストの定義（縦と横の長さ）
    private let text1: UITextField = UITextField(frame: CGRectMake(0,0,120,50))
    private var label = UILabel(frame: CGRectMake(0, 0, 150, 20));
    
    weak var myTextField: UITextField!
    private var myToolBar: UIToolbar!
    private var myDatePicker: UIDatePicker!
    
    private var Button1 = UIButton(frame: CGRectMake(10, 150, 70, 70));
    private var Button1Image:UIImage = UIImage(named: "image/pazdra.png")!;
    private var Button2 = UIButton(frame: CGRectMake(90, 150, 70, 70));
    private var Button2Image:UIImage = UIImage(named: "image/monst.png")!;
    private var Button3 = UIButton(frame: CGRectMake(170, 150, 70, 70));
    private var Button3Image:UIImage = UIImage(named: "image/tumutumu.jpg")!;
    private var Button4 = UIButton(frame: CGRectMake(250, 150, 70, 70));
    private var Button4Image:UIImage = UIImage(named: "image/sironeko.png")!;
    private let game: UITextField = UITextField(frame: CGRectMake(0, 0, 200, 30));
    
    
    
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
        
        
        let BackGround = UIView()
        BackGround.backgroundColor = UIColor(red: 0.6667, green: 0.7451, blue: 0.6667, alpha: 1.0)
        
        //　表示する文字の設定
        label.text = "課金の帳簿";
        label.font = UIFont.systemFontOfSize(30)
        label.layer.position = CGPoint(x: self.view.bounds.width/2, y: 50)
        
        
        //　入力前に薄い文字を表示する
        text1.placeholder = "金額を入力"
        
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
        button.frame = CGRectMake(100, 100, 100, 40)
        button.setBackgroundImage(buttonImage, forState: UIControlState.Normal)
        button.layer.masksToBounds = true
        button.layer.position = CGPoint(x: self.view.frame.width/2, y: 400)
        button.addTarget(self, action: "tapped", forControlEvents: .TouchUpInside)
        
        // 入力欄の設定（日付設定用の枠組の設定）
        myTextField = UITextField()
        myTextField.placeholder = dateToString(NSDate())
        myTextField.text = dateToString(NSDate())
        myTextField.layer.borderColor = UIColor(red: 0.2745, green: 0.3137, blue: 0.2745, alpha: 1.0).CGColor
        myTextField.layer.borderWidth = 2.0
        myTextField.frame = CGRectMake(0, 0, 150, 50) //(x座標,　y座標, width, height)
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
        Button1.setBackgroundImage(Button1Image, forState: UIControlState.Normal)
        Button1.addTarget(self, action: "pBtn_click", forControlEvents: .TouchUpInside);
        Button1.layer.position = CGPoint(x: self.view.frame.width / 5, y: 200)
        
        Button2.setBackgroundImage(Button2Image, forState: UIControlState.Normal)
        Button2.addTarget(self, action: "mBtn_click", forControlEvents: .TouchUpInside);
        Button2.layer.position = CGPoint(x: self.view.frame.width * 2 / 5, y: 200)
        
        Button3.setBackgroundImage(Button3Image, forState: UIControlState.Normal)
        Button3.addTarget(self, action: "tBtn_click", forControlEvents: .TouchUpInside);
        Button3.layer.position = CGPoint(x: self.view.frame.width * 3 / 5, y: 200)
        
        Button4.setBackgroundImage(Button4Image, forState: UIControlState.Normal)
        Button4.addTarget(self, action: "sBtn_click", forControlEvents: .TouchUpInside);
        Button4.layer.position = CGPoint(x: self.view.frame.width * 4 / 5, y: 200)
        
        
        //　viewに追加
        self.view.addSubview(text1)
        self.view.addSubview(label)
        
        self.view.addSubview(button)
        self.view.addSubview(Button1)
        self.view.addSubview(Button2)
        self.view.addSubview(Button3)
        self.view.addSubview(Button4)
        
        self.view.backgroundColor = BackGround.backgroundColor
    }
    
    
    // Button1が選択されたとき
    func pBtn_click(){
        Button1.alpha = 1.0;
        game.text = "パズドラ"
        Button2.alpha = 0.1;
        Button3.alpha = 0.1;
        Button4.alpha = 0.1;
        self.view.addSubview(Button1)
        self.view.addSubview(Button2)
        self.view.addSubview(Button3)
        self.view.addSubview(Button4)
    }
    
    // mButtonが選択されたとき
    func mBtn_click(){
        Button2.alpha = 1.0;
        game.text = "モンスト"
        Button1.alpha = 0.1;
        Button3.alpha = 0.1;
        Button4.alpha = 0.1;
        self.view.addSubview(Button1)
        self.view.addSubview(Button2)
        self.view.addSubview(Button3)
        self.view.addSubview(Button4)
    }
    
    // tButtonが選択されたとき
    func tBtn_click(){
        Button3.alpha = 1.0;
        game.text = "ツムツム"
        Button1.alpha = 0.1;
        Button2.alpha = 0.1;
        Button4.alpha = 0.1;
        self.view.addSubview(Button1)
        self.view.addSubview(Button2)
        self.view.addSubview(Button3)
        self.view.addSubview(Button4)
    }
    
    // sButtonが選択されたとき
    func sBtn_click(){
        Button4.alpha = 1.0;
        game.text = "白猫"
        Button1.alpha = 0.1;
        Button2.alpha = 0.1;
        Button3.alpha = 0.1;
        self.view.addSubview(Button1)
        self.view.addSubview(Button2)
        self.view.addSubview(Button3)
        self.view.addSubview(Button4)
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
        let day: String? = String(myTextField.text)
        let gamename: String? = String(game.text)
        
        let inputDB = Input()
        inputDB.amount = intamount!
        inputDB.day = day!
        inputDB.game = gamename!
        
        // textFieldの値を取得
        let inputText = text1.text
        let inputdate = myTextField.text
        let inputgame = game.text
        let myAlert: UIAlertController = UIAlertController(title: "入力されてないよ", message: "ゲーム or 価格の情報がありません", preferredStyle: .Alert)
        let myAlertOk: UIAlertController = UIAlertController(title: "入力できました!", message: "帳簿に記録します", preferredStyle: .Alert)
        
        // ゲームが選択されていない時か、金額が入力されていない時にアラートを表示
        if ((inputText == "") || (inputgame == "")){
            let myNgAction = UIAlertAction(title: "OK", style: .Default) { action in
                print("Action OK!!")
            }
            
            myAlert.addAction(myNgAction)
            
            // UIAlertを発動する
            presentViewController(myAlert, animated: true, completion: nil)
            
            // 金額が入力されないと金額入力欄に文字を薄く表示
            if (inputText == ""){
                self.view.addSubview(text1)
            }
        }
            
            // 正しく入力されている時にアラート表示（各要素のデータを表示する）
        else {
            let myOkAction = UIAlertAction(title: "OK", style: .Default) { action in
                print("Action OK!!")
            }
            
            myAlertOk.addAction(myOkAction)
            
            // UIAlertを発動する
            presentViewController(myAlertOk, animated: true, completion: nil)
            
            // 入力された値を表示する
            print(inputText)
            print(inputdate)
            print(inputgame)
        }
        
        // キーボードを閉じる
        view.endEditing(true)
        
        let config = Realm.Configuration(
            schemaVersion: 1,
            migrationBlock: { migration, oldSchemaVersion in
                if (oldSchemaVersion < 1) {
                }
        })
        Realm.Configuration.defaultConfiguration = config
        
        do {
            let realm = try! Realm()
            
            try! realm.write{
                realm.add(inputDB)
            }
        }
        
        // 入力された値を表示する
        print(inputDB.amount)
        print(inputDB.day)
        print(inputDB.game)
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


