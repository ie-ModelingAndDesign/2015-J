//
//  RealmDB.swift
//  realm
//
//  Created by rate on 1/3/16.
//  Copyright © 2016 rate. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    dynamic var file = ""
    
    dynamic var name = ""

    dynamic var amount = 0
    // Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
}
