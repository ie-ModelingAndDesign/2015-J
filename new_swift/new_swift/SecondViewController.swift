
//
//  SecondViewController.swift
//  new_swift
//
//  Created by onaga on 2015/12/10.
//  Copyright © 2015年 onaga. All rights reserved.
//

import UIKit
import RealmSwift

class SecondViewController: UIViewController {
    
    /* 仮記入額 */
    var amount: Int = 1000
    /* 物の情報を設定 */
    private let orange : [(file: String, name: String, amount: Int)] = [("image/mikan.png", "みかん", 100)]
    private var ItemView: UIImageView!
    private var itemcommit : UILabel!
    
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
        
/*         let config = Realm.Configuration(
            // アプリケーションバンドルのパスを設定します
            path: NSBundle.mainBundle().pathForResource("Item", ofType:"realm"),
            // アプリケーションバンドルは書き込み不可なので、読み込み専用に設定します。
            readOnly: true)
        
    
        // RealmをConfigurationオブジェクト使って作成します
        let realm = try! Realm(configuration: config)
        
        let ITEM = realm.objects(Item).filter("name = orange")
        
        print("name : \(ITEM)") 
*/
        
        
        // 背景色を設定
        self.view.backgroundColor = UIColor(red: 0.6667, green: 0.7451, blue: 0.6667, alpha: 1.0)
        
        //　UIImageViewを作成する。
        ItemView = UIImageView(frame: CGRectMake(0, 0, 100, 120))
        
        // 画像(物の画像，今回はみかん)を設定する
        ItemView.image = UIImage(named: orange[0].file)
        
        // 画像の表示する座標を指定する
        ItemView.layer.position = CGPoint(x: self.view.bounds.width/2, y: 300.0)
    
        // UIImageをViewに追加する
        self.view.addSubview(ItemView)
        
        /* いくら買えるのかコメント表示 */
        ItemCommit(orange[0].name, itemamount: orange[0].amount)
        
        
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
    
    /* 物がいくら買えるのかコメントする関数(あとから引数でいろいろ変えれるようにします...) */
    func ItemCommit(itemname: String, itemamount: Int) {
        itemcommit = UILabel()
        itemcommit.frame = CGRect(x: 25, y: 0, width: 300, height: 150)
 
        /* 何個買えるのか計算 */
        let count = amount / itemamount
        
        /* 表示する文字を設定 */
        itemcommit.text = "\(itemname)が\(count)個買えるよ(´･ω･`)"
        itemcommit.textAlignment = NSTextAlignment.Center
        itemcommit.textColor = UIColor.blackColor()
        itemcommit.layer.position = CGPoint(x: self.view.bounds.width/2, y: 400.0)
        self.view.addSubview(itemcommit)
    }
    
    
    
}