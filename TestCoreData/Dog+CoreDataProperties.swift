//
//  Dog+CoreDataProperties.swift
//  TestCoreData
//
//  Created by Apple on 5/12/21.
//  Copyright © 2021 Apple. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit


extension Dog {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dog> {
        return NSFetchRequest<Dog>(entityName: "Dog")
    }

    @NSManaged public var id: Int16
    @NSManaged public var name: String?
    @NSManaged public var userId: Int16
    @NSManaged public var user: User?
    
    func saveDog(name: String, id: Int) {
    
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext =
            appDelegate.persistentContainer.viewContext
        let entity =
            NSEntityDescription.entity(forEntityName: "Dog",
                                       in: managedContext)!
    
        let dog = NSManagedObject(entity: entity,
                                   insertInto: managedContext)
    
    
        dog.setValue(name, forKeyPath: "name")
        dog.setValue(id, forKeyPath: "id")
    
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }

}
