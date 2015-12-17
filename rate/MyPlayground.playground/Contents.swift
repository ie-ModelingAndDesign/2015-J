//: Playground - noun: a place where people can play

// ハローワールド
var str = "Hello, playground"

//var:変数 , let:定数
var variable : Int = 1
let constant : String = "Swift"

variable = 0

//配列
var array : [Int] = [1, 2, 3, 4, 5]
var dict  : [String:String] = [
    "apple" : "りんご",
    "orange" : "みかん"
]

var emptyArray : [Int] = []
var emptyDict  : [String:String] = [:]

//タプル(複数の型を合わせた物)
let lang : (name:String, age:Int) = (name:"Swift", age:0)

lang.name

lang.age

//if文
let length = 6

if length < 2 {
    print("短い")
} else if length < 5 {
    print("普通")
} else {
    print("長い")
}

//while文
var n = 10
while n > 0 {
    print(n)
    n--
}

for(var i : Int = 0; i<10; i++){
    print(i)
}

for i in 0...9 {
    print(i)
}

import UIKit

class SecondViewController: UIViewController {
    
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
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

