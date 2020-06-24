//
//  TodoItem.swift
//  DemoRealm
//
//  Created by Apple on 6/20/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import RealmSwift


class TodoItem: Object {
    dynamic var detail = ""
    dynamic var status = 0
}
