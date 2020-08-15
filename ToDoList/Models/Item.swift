//
//  Item.swift
//  ToDoList
//
//  Created by Edgar on 8/15/20.
//  Copyright © 2020 Edgar. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title = ""
    @objc dynamic var done = false
    @objc dynamic var dateCreated: Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
