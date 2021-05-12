//
//  Picture+CoreDataClass.swift
//  CoreDataN-N
//
//  Created by Apple on 5/12/21.
//  Copyright © 2021 Apple. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Picture)
public class Picture: NSManagedObject {
    static let shared = Picture()
}
