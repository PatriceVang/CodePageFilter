//
//  ViewController.swift
//  TestCoreData
//
//  Created by Apple on 5/12/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var users: [User] {
        return User.shared.getUser()
    }

    @IBOutlet weak var tbvUser: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbvUser.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(performAddUser))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(performAddDog))
        
        
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(urls[urls.count-1] as URL)
        

        
        
//        User.shared.saveUser(name: "Rio", id: 1)
        
        
        
        
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tbvUser.reloadData()
    }
    
    @objc func performAddUser() {

        users.forEach {
            print($0.dog)
        }
    }
    
    @objc func performAddDog() {

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext =
            appDelegate.persistentContainer.viewContext
        let dog = Dog(context: managedContext)
        dog.id = 2
        dog.name = "Dog2"
        let user = users.first
        user?.addToDog(dog)
        do {
            try! managedContext.save()
        } catch {
            print("Not save")
        }
        
    }
    

    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return users.count
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tbvUser.dequeueReusableCell(withIdentifier: "cell") as? UserCell else { fatalError()}
//        cell.textLabel?.text = users[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        User.share.updateUser(name: "New", index: indexPath.row)
        tbvUser.reloadData()
        
    }
}


//

//func updateUser(name: String, index: Int) {
//
//    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
//
//    let managedContext =
//        appDelegate.persistentContainer.viewContext
//    let fetchRequest =
//        NSFetchRequest<NSManagedObject>(entityName: "User")
//    let users = try? managedContext.fetch(fetchRequest) as? [User] ?? []
//    users?[index].setValue(name, forKey: "name")
//
//    do {
//        try! managedContext.save()
//    } catch let error as NSError {
//        print("Could not save. \(error), \(error.userInfo)")
//    }
