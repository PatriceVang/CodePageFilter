//
//  DBHelper.swift
//  CoreDataN-N
//
//  Created by Apple on 5/12/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import Foundation
import UIKit
import CoreData


enum CoreDataObject: String {
    
    case Library = "Library"
    case Picture = "Picture"

}

class DBHelper {
    
    static let shared = DBHelper()
    private init(){}
    
    func context() -> NSManagedObjectContext {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {fatalError()}
        return appDelegate.persistentContainer.viewContext
    }

    func save<T: NSManagedObject>(_ object: T) {
        do {
            try context().save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func fetch<T: NSManagedObject>(_ object: CoreDataObject) -> [T] {
        var result = [T]()
        do {
            let fetchRequest =
                NSFetchRequest<NSManagedObject>(entityName: "\(object.rawValue)")
        
            result = try context().fetch(fetchRequest) as? [T] ?? []
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return result
    }
    
    func delete(_ id: Int, object: CoreDataObject) {
      
        let predicate = NSPredicate(format: "id = %@", "\(id)")
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "\(object.rawValue)")
        fetchRequest.predicate = predicate
        
        do {
            if let model = try! context().fetch(fetchRequest).first {
                context().delete(model)
                try! context().save()
            }
        } catch let err as NSError {
            print("Count not delete obect \(err.localizedDescription)")
        }
        
        
        
        
//        if let result = try? context.fetch(fetchRequest) {
//            for object in result {
//                context.delete(object)
//            }
//        }
        
        do {
            try context().save()
        } catch {
            print ("There was an error")
        }
    }
    
    
    
    
}

//func getLib() -> [Library] {
//    var users = [Library]()
//    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return[]}
//    let managedContext =
//        appDelegate.persistentContainer.viewContext
//    let fetchRequest =
//        NSFetchRequest<NSManagedObject>(entityName: "Library")
//
//    do {
//        users = try managedContext.fetch(fetchRequest) as? [Library] ?? []
//    } catch let error as NSError {
//        print("Could not fetch. \(error), \(error.userInfo)")
//    }
//    return users
//}


//func savePic(name: String, id: Int16, lib: Library) {
//
//      guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
//      let managedContext =
//          appDelegate.persistentContainer.viewContext
//      let pic = Picture(context: managedContext)
//      pic.id = id
//      pic.name = name
//      pic.addToLib(lib)
//
//      do {
//          try managedContext.save()
//      } catch let error as NSError {
//          print("Could not save. \(error), \(error.userInfo)")
//      }
//  }
