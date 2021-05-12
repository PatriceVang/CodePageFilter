//
//  Library+CoreDataProperties.swift
//  CoreDataN-N
//
//  Created by Apple on 5/12/21.
//  Copyright © 2021 Apple. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit


extension Library {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Library> {
        return NSFetchRequest<Library>(entityName: "Library")
    }
    
    @NSManaged public var id: Int16
    @NSManaged public var name: String?
    @NSManaged public var pic: NSSet?
    
}

// MARK: Generated accessors for pic
extension Library {
    
    @objc(addPicObject:)
    @NSManaged public func addToPic(_ value: Picture)
    
    @objc(removePicObject:)
    @NSManaged public func removeFromPic(_ value: Picture)
    
    @objc(addPic:)
    @NSManaged public func addToPic(_ values: NSSet)
    
    @objc(removePic:)
    @NSManaged public func removeFromPic(_ values: NSSet)
    
    
    
    func saveLib(name: String, id: Int16, pic: Picture) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext =
            appDelegate.persistentContainer.viewContext
        let lib = Library(context: managedContext)
        lib.id = id
        lib.name = name
        lib.addToPic(pic)
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func getLib() -> [Library] {
        var users = [Library]()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return[]}
        let managedContext =
            appDelegate.persistentContainer.viewContext
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Library")
    
        do {
            users = try managedContext.fetch(fetchRequest) as? [Library] ?? []
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return users
    }
}
