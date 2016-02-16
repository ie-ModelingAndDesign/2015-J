//
//  ListCustom.swift
//  new_swift
//
//  Created by rate on 2/3/16.
//  Copyright © 2016 onaga. All rights reserved.
//

import UIKit


class CustomCell: UITableViewCell {
    
    var titleLabel = UILabel();
    var contentLabel = UILabel();
    var gameLabel = UILabel();
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!)
    {
        //First Call Super
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        titleLabel = UILabel(frame: CGRectMake(200, 2, 300, 15));
        titleLabel.text = "";
        titleLabel.font = UIFont.systemFontOfSize(12)
        self.addSubview(titleLabel);
        
        contentLabel = UILabel(frame: CGRectMake(10, 22, 300, 15));
        contentLabel.text = "";
        contentLabel.font = UIFont.systemFontOfSize(22)
        self.addSubview(contentLabel);
        
        gameLabel = UILabel(frame: CGRectMake(200, 22, 300, 15));
        gameLabel.text = "";
        gameLabel.font = UIFont.systemFontOfSize(20)
        self.addSubview(contentLabel);
        
    }
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)!
    }

}
