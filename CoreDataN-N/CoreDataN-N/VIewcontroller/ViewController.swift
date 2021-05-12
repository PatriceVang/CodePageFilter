//
//  ViewController.swift
//  CoreDataN-N
//
//  Created by Apple on 5/12/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var libs: [Library] {
        return DBHelper.shared.fetch(.Library)
    }
//
    var pics: [Picture] {
        return DBHelper.shared.fetch(.Picture)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(performAddUser))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(performAddDog))
        
        
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(urls[urls.count-1] as URL)
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext =
            appDelegate.persistentContainer.viewContext

        
//        let lib = Library(context: DBHelper.shared.context())
//        lib.name = "Lib4"
//        lib.id = 4
//        
//        DBHelper.shared.save(lib)
        
    }
    
    @objc func performAddUser() {
        
        libs.forEach {
            print("Lib: \($0.name)")
            let pic = $0.pic?.allObjects as? [Picture]

            pic?.forEach {
                print("Pic: \($0.name) - \($0.id)")
            }

        }
        pics.forEach {
            print($0.name)
        }
        
        
    }
    
    @objc func performAddDog() {
        
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
//        let managedContext =
//            appDelegate.persistentContainer.viewContext
//
//        let lib2 = libs[1]
        
//        let pic1 = pics.first
        
//        pic1?.addToLib(lib2)
        
//        do {
//            try! managedContext.save()
//        } catch {
//            print("Count not save")
//        }
        
        
        DBHelper.shared.delete(4, object: .Library)
    }
    
    
}
