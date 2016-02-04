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
        self.view.backgroundColor = UIColor.whiteColor()
        
        //グラフの設定(8通り用意,扇型の内角で%を表現する)
        _ = CGPointMake(self.view.frame.width/2, self.view.frame.height/2)
        
        let pi = CGFloat(M_PI)
        let start:CGFloat = 0.0 * pi / 2.0 - (pi / 2.0)
        let end:CGFloat = 1/8 * pi * 2.0 - (pi / 2.0)
        let path: UIBezierPath = UIBezierPath();
        path.moveToPoint(CGPointMake(self.view.frame.width/2, self.view.frame.height/2))
        path.addArcWithCenter(CGPointMake(self.view.frame.width/2, self.view.frame.height/2), radius: 100, startAngle: start, endAngle: end, clockwise: true)
        
        let layer = CAShapeLayer()
        layer.fillColor = UIColor.orangeColor().CGColor
        layer.path = path.CGPath
        
        self.view.layer.addSublayer(layer)
        
        _ = CGFloat(M_PI)
        let start2:CGFloat = 1/8 * pi * 2.0 - (pi / 2.0)
        let end2:CGFloat = 2/8 * pi * 2.0 - (pi / 2.0)
        let path2: UIBezierPath = UIBezierPath();
        path2.moveToPoint(CGPointMake(self.view.frame.width/2, self.view.frame.height/2))
        path2.addArcWithCenter(CGPointMake(self.view.frame.width/2, self.view.frame.height/2), radius: 100, startAngle: start2, endAngle: end2, clockwise: true)
        
        let layer2 = CAShapeLayer()
        layer2.fillColor = UIColor.redColor().CGColor
        layer2.path = path2.CGPath
        
        self.view.layer.addSublayer(layer2)
        
        _ = CGFloat(M_PI)
        let start3:CGFloat = 2/8 * pi * 2.0 - (pi / 2.0)
        let end3:CGFloat = 3/8 * pi * 2.0 - (pi / 2.0)
        let path3: UIBezierPath = UIBezierPath();
        path3.moveToPoint(CGPointMake(self.view.frame.width/2, self.view.frame.height/2))
        path3.addArcWithCenter(CGPointMake(self.view.frame.width/2, self.view.frame.height/2), radius: 100, startAngle: start3, endAngle: end3, clockwise: true)
        
        let layer3 = CAShapeLayer()
        layer3.fillColor = UIColor.blueColor().CGColor
        layer3.path = path3.CGPath
        
        self.view.layer.addSublayer(layer3)
        
        _ = CGFloat(M_PI)
        let start4:CGFloat = 3/8 * pi * 2.0 - (pi / 2.0)
        let end4:CGFloat = 4/8 * pi * 2.0 - (pi / 2.0)
        let path4: UIBezierPath = UIBezierPath();
        path4.moveToPoint(CGPointMake(self.view.frame.width/2, self.view.frame.height/2))
        path4.addArcWithCenter(CGPointMake(self.view.frame.width/2, self.view.frame.height/2), radius: 100, startAngle: start4, endAngle: end4, clockwise: true)
        
        let layer4 = CAShapeLayer()
        layer4.fillColor = UIColor.greenColor().CGColor
        layer4.path = path4.CGPath
        
        self.view.layer.addSublayer(layer4)
        
        _ = CGFloat(M_PI)
        let start5:CGFloat = 4/8 * pi * 2.0 - (pi / 2.0)
        let end5:CGFloat = 5/8 * pi * 2.0 - (pi / 2.0)
        let path5: UIBezierPath = UIBezierPath();
        path5.moveToPoint(CGPointMake(self.view.frame.width/2, self.view.frame.height/2))
        path5.addArcWithCenter(CGPointMake(self.view.frame.width/2, self.view.frame.height/2), radius: 100, startAngle: start5, endAngle: end5, clockwise: true)
        
        let layer5 = CAShapeLayer()
        layer5.fillColor = UIColor.yellowColor().CGColor
        layer5.path = path5.CGPath
        
        self.view.layer.addSublayer(layer5)
        
        _ = CGFloat(M_PI)
        let start6:CGFloat = 5/8 * pi * 2.0 - (pi / 2.0)
        let end6:CGFloat = 6/8 * pi * 2.0 - (pi / 2.0)
        let path6: UIBezierPath = UIBezierPath();
        path6.moveToPoint(CGPointMake(self.view.frame.width/2, self.view.frame.height/2))
        path6.addArcWithCenter(CGPointMake(self.view.frame.width/2, self.view.frame.height/2), radius: 100, startAngle: start6, endAngle: end6, clockwise: true)
        
        let layer6 = CAShapeLayer()
        layer6.fillColor = UIColor.purpleColor().CGColor
        layer6.path = path6.CGPath
        
        self.view.layer.addSublayer(layer6)
        
        _ = CGFloat(M_PI)
        let start7:CGFloat = 6/8 * pi * 2.0 - (pi / 2.0)
        let end7:CGFloat = 7/8 * pi * 2.0 - (pi / 2.0)
        let path7: UIBezierPath = UIBezierPath();
        path7.moveToPoint(CGPointMake(self.view.frame.width/2, self.view.frame.height/2))
        path7.addArcWithCenter(CGPointMake(self.view.frame.width/2, self.view.frame.height/2), radius: 100, startAngle: start7, endAngle: end7, clockwise: true)
        
        let layer7 = CAShapeLayer()
        layer7.fillColor = UIColor.blackColor().CGColor
        layer7.path = path7.CGPath
        
        self.view.layer.addSublayer(layer7)
        
        _ = CGFloat(M_PI)
        let start8:CGFloat = 7/8 * pi * 2.0 - (pi / 2.0)
        let end8:CGFloat = 0.0 * pi * 2.0 - (pi / 2.0)
        let path8: UIBezierPath = UIBezierPath();
        path8.moveToPoint(CGPointMake(self.view.frame.width/2, self.view.frame.height/2))
        path8.addArcWithCenter(CGPointMake(self.view.frame.width/2, self.view.frame.height/2), radius: 100, startAngle: start8, endAngle: end8, clockwise: true)
        
        let layer8 = CAShapeLayer()
        layer8.fillColor = UIColor.grayColor().CGColor
        layer8.path = path8.CGPath
        
        self.view.layer.addSublayer(layer8)
        

        
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
