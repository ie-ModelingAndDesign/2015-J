//
//  Listview.swift
//  new_swift
//
//  Created by rate on 1/5/16.
//  Copyright © 2016 onaga. All rights reserved.
//

import UIKit

class Listview: UIViewController, UITableViewDelegate, UITableViewDataSource{
    

// Tabelで使用する配列.
var myItems: [String] = ["TEST1", "TEST2", "TEST3"]
var myTableView: UITableView = UITableView()
override func viewDidLoad() {
    super.viewDidLoad()
    
    // Status Barの高さを取得.
    let barHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.size.height
    
    // Viewの高さと幅を取得.
    let displayWidth: CGFloat = self.view.frame.width
    let displayHeight: CGFloat = self.view.frame.height
    
    // TableViewの生成( status barの高さ分ずらして表示 ).
    myTableView.frame = CGRect(x: 0, y: barHeight+60, width: displayWidth, height: displayHeight - barHeight)
    
    // Cellの登録.
    myTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
    
    // DataSourceの設定.
    myTableView.dataSource = self
    
    // Delegateを設定.
    myTableView.delegate = self
    
    // Viewに追加する.
    self.view.addSubview(myTableView)
    
    let myButton = UIButton(frame: CGRectMake(0,0,100,50))
    myButton.backgroundColor = UIColor.orangeColor()
    myButton.layer.masksToBounds = true
    myButton.setTitle("もどる", forState: .Normal)
    myButton.layer.cornerRadius = 20.0
    myButton.layer.position = CGPoint(x: self.view.bounds.width/7, y:50)
    myButton.addTarget(self, action: "onClickGoBack:", forControlEvents: .TouchUpInside)
    
    // ボタンをViewに追加する.
    self.view.addSubview(myButton);
    
    
}

override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
}

/*
Cellが選択された際に呼び出される.
*/
func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    print("Num: \(indexPath.row)")
    print("Value: \(myItems[indexPath.row])")
}

/*
Cellの総数を返す.
*/
func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    print("numberOfRowsInSection")
    return myItems.count
}

/*
Editableの状態にする.
*/
func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    print("canEditRowAtIndexPath")
    
    return true
}

/*
特定の行のボタン操作を有効にする.
*/
func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    print("commitEdittingStyle:\(editingStyle)")
}

/*
Cellに値を設定する.
*/
func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
    
    cell.textLabel?.text = "\(myItems[indexPath.row])"
    
    return cell
}

/*
ボタンイベント
*/
internal func onClickGoBack(sender: UIButton){
    
    // SecondViewに移動する.
    self.dismissViewControllerAnimated(true, completion: nil)
}


}