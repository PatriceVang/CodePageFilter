//
//  CoreData.swift
//  CoreDataCRUD
//
//  Created by Apple on 6/24/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
import CoreData




extension NSManagedObject {
    
//    static let shared = Entity()
//    
//    let appDelegate = UIApplication.shared.delegate as? AppDelegate
//    lazy var managedContext = appDelegate?.persistentContainer.viewContext
    
//    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
//           return NSFetchRequest<User>(entityName: "User")
//       }


//
//    static func fetchRequest() -> NSFetchRequest<self> {
//        return NSFetchRequest<self>(entityName: "\(self)")
//    }
//
    static func saveObject(entity: NSManagedObject,completion: @escaping (NSManagedObject) -> Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        let userUtity = NSEntityDescription.entity(forEntityName: "\(self)", in: managedContext)!
        
        let entityNew = NSManagedObject(entity: userUtity, insertInto: managedContext)
        
        completion(entityNew)
        
        do {
            try managedContext.save()
        } catch let err as NSError {
            print("count not save \(err.userInfo)")
        }
    }
    
//    static func fetchObject(entity: NSManagedObject) -> [NSManagedObject] {
//        var result = [entity]
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return []}
//        let managedContext = appDelegate.persistentContainer.viewContext
//        
//        do {
//            result = try managedContext.fetch(self.fetchObject(entity: entity))
//        } catch let err as NSError {
//            print("could not retive data \(err)")
//        }
//        return result
//    }
}

//@nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
//       return NSFetchRequest<User>(entityName: "User")
//   }

class RepositoryLocal<T> {
    
//    func fetRequest<T: NSFetchRequestResult>() -> NSFetchRequest<T> {
//        return NSFetchRequest<T>(entityName: "\(T.self)")
//    }
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    lazy var context = appDelegate.persistentContainer.viewContext
//    let userUtity = NSEntityDescription.entity(forEntityName: "\(self)", in: managedContext)!
//          let user = NSManagedObject(entity: userUtity, insertInto: managedContext)
//          user.setValue(name, forKey: "name")
//          user.setValue(address, forKey: "address")
    
    func saveObject(completion: (T) -> Void) {
        guard let newEntity = NSEntityDescription.entity(forEntityName: "\(T.self)", in: context) else {return}
        let saveEntity = NSManagedObject(entity: newEntity, insertInto: context)
        
        completion(saveEntity as! T)
    }
    func get<T: NSManagedObject>() -> [T] {
        var result = [T]()
        do {
            result = try (context.fetch(T.fetchRequest()) as? [T])!
        } catch let err {
            print("could not: \(err.localizedDescription)")
        }
        return result
    }
    func update(entity: T) {
        
    }
    func delete(entity: T) {
        
    }
    
}

//protocol UserRepository {
//    associatedtype T
//    func create(user: T)
//    func getAll() -> [T]?
//    func update(user: T)
//    func delete(user: T)
//}





