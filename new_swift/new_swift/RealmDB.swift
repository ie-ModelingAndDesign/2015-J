//
//  RealmDB.swift
//  new_swift
//
//  Created by rate on 12/24/15.
//  Copyright © 2015 onaga. All rights reserved.
//

import RealmSwift

class Input: Object {

    dynamic var day = 0
    dynamic var month = 0
    dynamic var year = 0
}

class Item: Object {
    dynamic var file = ""
    dynamic var name = ""
    dynamic var amount = 0
    
    override static func primaryKey() -> String? {
        return "name"
    }
}