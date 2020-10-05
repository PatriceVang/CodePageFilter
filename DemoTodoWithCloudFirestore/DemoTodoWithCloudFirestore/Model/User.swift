//
//  User.swift
//  DemoTodoWithCloudFirestore
//
//  Created by Apple on 10/5/20.
//

import Foundation


class User: Codable {
    var id: String?
    var name: String?
    var age: String?
    var major: String?
    var idDoc: String
    
    init(id: String?, name: String?, age: String?, major: String?, idDoc: String) {
        self.id = id
        self.name = name
        self.age = age
        self.major = major
        self.idDoc = idDoc
    }
}
