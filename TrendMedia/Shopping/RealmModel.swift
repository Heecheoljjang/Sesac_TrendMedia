//
//  RealmModel.swift
//  TrendMedia
//
//  Created by HeecheolYoon on 2022/08/22.
//

import Foundation

import RealmSwift

class ShoppingList: Object {
    @Persisted var isChecked: Bool = false
    @Persisted var isLiked: Bool = false
    @Persisted var content: String
    
    @Persisted(primaryKey: true) var objectID: ObjectId
    
    convenience init(content: String) {
        self.init()
        self.content = content
    }
}
