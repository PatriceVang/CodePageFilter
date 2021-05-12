//
//  Picture+CoreDataProperties.swift
//  CoreDataN-N
//
//  Created by Apple on 5/12/21.
//  Copyright © 2021 Apple. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit


extension Picture {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Picture> {
        return NSFetchRequest<Picture>(entityName: "Picture")
    }
    
    @NSManaged public var id: Int16
    @NSManaged public var name: String?
    @NSManaged public var lib: NSSet?
    
}

// MARK: Generated accessors for lib
extension Picture {
    
    @objc(addLibObject:)
    @NSManaged public func addToLib(_ value: Library)
    
    @objc(removeLibObject:)
    @NSManaged public func removeFromLib(_ value: Library)
    
    @objc(addLib:)
    @NSManaged public func addToLib(_ values: NSSet)
    
    @objc(removeLib:)
    @NSManaged public func removeFromLib(_ values: NSSet)
    
    func savePic(name: String, id: Int16, lib: Library) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext =
            appDelegate.persistentContainer.viewContext
        let pic = Picture(context: managedContext)
        pic.id = id
        pic.name = name
        pic.addToLib(lib)
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func getPic() -> [Picture] {
        var users = [Picture]()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return[]}
        let managedContext =
            appDelegate.persistentContainer.viewContext
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Picture")
    
        do {
            users = try managedContext.fetch(fetchRequest) as? [Picture] ?? []
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return users
    }
}
