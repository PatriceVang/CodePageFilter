//
//  Dog+CoreDataClass.swift
//  TestCoreData
//
//  Created by Apple on 5/12/21.
//  Copyright © 2021 Apple. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Dog)
public class Dog: NSManagedObject {
    static let shared = Dog()
}
