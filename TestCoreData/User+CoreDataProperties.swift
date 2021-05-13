//
//  User+CoreDataProperties.swift
//  TestCoreData
//
//  Created by Apple on 5/12/21.
//  Copyright © 2021 Apple. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit


extension User {
    

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var id: Int16
    @NSManaged public var name: String?
    @NSManaged public var dog: NSSet?

}

// MARK: Generated accessors for dog
extension User {

    @objc(addDogObject:)
    @NSManaged public func addToDog(_ value: Dog)

    @objc(removeDogObject:)
    @NSManaged public func removeFromDog(_ value: Dog)

    @objc(addDog:)
    @NSManaged public func addToDog(_ values: NSSet)

    @objc(removeDog:)
    @NSManaged public func removeFromDog(_ values: NSSet)
    
    func saveUser(name: String, id: Int16) {
    
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext =
            appDelegate.persistentContainer.viewContext
        let user = User(context: managedContext)
  
        user.id = id
        user.name = name

        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func getUser() -> [User] {
        var users = [User]()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return[]}
        let managedContext =
            appDelegate.persistentContainer.viewContext
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "User")
    
        do {
            users = try managedContext.fetch(fetchRequest) as? [User] ?? []
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return users
    }

}
