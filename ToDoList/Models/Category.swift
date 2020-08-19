//
//  Category.swift
//  ToDoList
//
//  Created by Edgar on 8/15/20.
//  Copyright © 2020 Edgar. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name = ""
    @objc dynamic var color = ""
    let items = List<Item>()
}
