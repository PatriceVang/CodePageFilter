//
//  User+CoreDataProperties.swift
//  CoreDataCRUD
//
//  Created by Apple on 6/23/20.
//  Copyright © 2020 vinova. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit


extension User {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var address: String?
    @NSManaged public var name: String?
    
    
    //--- save Data
    static func insertNewUser(name: String, address: String) {
    
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        let userUtity = NSEntityDescription.entity(forEntityName: "User", in: managedContext)!
        let user = NSManagedObject(entity: userUtity, insertInto: managedContext)
        user.setValue(name, forKey: "name")
        user.setValue(address, forKey: "address")
        
        do {
            try managedContext.save()
        } catch let err as NSError {
            print("count not save \(err.userInfo)")
        }
    }
    
    //--- Get data
    static func getUser() -> [User] {
        var result = [User]()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return []}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        do {
            result = try managedContext.fetch(User.fetchRequest())
        } catch let err as NSError {
            print("could not retive data \(err)")
        }
        return result
    }
    
    //--- Update
    static func update(name: String, address: String, index: Int) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        
        do {
            
            let test = try managedContext.fetch(fetchRequest())
            let objectUpdate = test[index] as! NSManagedObject
            objectUpdate.setValue(name, forKey: "name")
            objectUpdate.setValue(address, forKey: "address")
            do {
                try managedContext.save()
            } catch let err {
                print("count not save after update \(err.localizedDescription)")
            }
        }catch let err {
            print(err)
        }
        
    }
    
    //--- Delete
    static func deleteUser(index: Int) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        do {
            let test = try managedContext.fetch(fetchRequest())
            let objectToDelete = test[index] as! NSManagedObject
            managedContext.delete(objectToDelete)
            
            do {
                try managedContext.save()
            } catch let err {
                print("save after delete fail \(err.localizedDescription)")
            }
        } catch let err {
            print("delete object fail \(err.localizedDescription)")
        }
    }
}
