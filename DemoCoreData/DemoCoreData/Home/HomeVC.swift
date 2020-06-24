//
//  HomeVC.swift
//  DemoCoreData
//
//  Created by Apple on 6/23/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
import CoreData


class HomeVC: UIViewController {
    @IBOutlet weak var myTableV: UITableView!
//    var names = [String]()
    
    
    //--- CoreData
    var people: [NSManagedObject] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableV.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(onTapTitleAdd))
        
        
        //--- Core Data
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchData = NSFetchRequest<NSManagedObject>(entityName: "Person")
        
        do {
            people = try managedContext.fetch(fetchData)
        } catch let err as NSError {
            print("Could not fetch. \(err), \(err.userInfo)")
        }
        
    }
    
    @objc func onTapTitleAdd() {
        let alertDialog = UIAlertController(title: "Add Name", message: "let's fill in below", preferredStyle: .alert)
        alertDialog.addTextField { (tf) in
            tf.placeholder = "My name"
        }
        
        let okAction = UIAlertAction(title: "Save", style: .default) { (alert) in
            guard let textField = alertDialog.textFields?.first else {return}
            if let nameToSave = textField.text {
//                self.names.append(nameToSave)
//                self.myTableV.reloadData()
                
                //--- Core Data
                self.save(name: nameToSave)
                self.myTableV.reloadData()
            }
           
            
        }
        let cancleAction = UIAlertAction(title: "Cancle", style: .cancel, handler: nil)
        
        alertDialog.addAction(cancleAction)
        alertDialog.addAction(okAction)
        
        
        present(alertDialog, animated: true, completion: nil)
        
        
    }
    //--- Core data
    func save(name: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Person", in: managedContext)!
       
        let person = NSManagedObject(entity: entity, insertInto: managedContext)
        
        
        person.setValue(name, forKeyPath: "name")
        
        do {
            try managedContext.save()
            people.append(person)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = myTableV.dequeueReusableCell(withIdentifier: "cell") as! MyCell
//        cell.textLabel?.text = names[indexPath.row]
        
        
        //--- Coredata
        let person = people[indexPath.row]
        cell.textLabel?.text = person.value(forKey: "name") as? String
        
        return cell
    }
}
