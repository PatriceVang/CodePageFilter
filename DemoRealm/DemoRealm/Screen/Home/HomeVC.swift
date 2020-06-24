//
//  HomeVC.swift
//  DemoRealm
//
//  Created by Apple on 6/20/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
import RealmSwift




class HomeVC: UIViewController {
    @IBOutlet weak var myTableV: UITableView!
    
    //MARK: RealmDb
    let realm = try! Realm()
    
    lazy var user: Results<User> = {
            return realm.objects(User.self)
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableV.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    @IBAction func onTapAddNew_Btn(_ sender: UIButton) {
        let alert = UIAlertController(title: "My List", message: "what do you plan to do?", preferredStyle: .alert)
        alert.addTextField { (tf) in
            
        }
        let action_Cancle = UIAlertAction(title: "Cancle", style: .cancel) { (UIAlertAction) in
            return
        }
        
        let action_Add = UIAlertAction(title: "Add", style: .default) { (UIAlertAction) in
            guard let textField = alert.textFields?.first else {return}
            do {
                try self.realm.write({
                    let user = User()
                    user.name = textField.text!
                    self.realm.add(user)
                    self.myTableV.reloadData()
                })
            } catch let err {
                print(err.localizedDescription)
            }
        }
        
        
        
        alert.addAction(action_Add)
        alert.addAction(action_Cancle)
        present(alert, animated: true, completion: nil)
    }
    
//    func loadObject() {
//        user = realm.objects(User.self)
//        self.myTableV.reloadData()
//    }
}
extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableV.dequeueReusableCell(withIdentifier: "cell") as! MyCell
        cell.textLabel?.text = user[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let popUp = UIAlertController(title: "Notification", message: "let's fill in below to update name", preferredStyle: .alert)
        
        popUp.addTextField { (tf) in
            tf.placeholder = "My name"
        }
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
            guard let textField = popUp.textFields?.first as? UITextField else {return}
            do {
                try self.realm.write({
                    let userUpdate = self.user[indexPath.row]
                    userUpdate.name = textField.text!
                    self.realm.add(userUpdate)
                    self.myTableV.reloadData()
                })
            } catch let err {
                print(err.localizedDescription)
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancle", style: .cancel, handler: nil)
        
        popUp.addAction(cancelAction)
        popUp.addAction(okAction)
        
        present(popUp, animated: true, completion: nil)
    }

    
//    //--- delete to items
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let items = user[indexPath.row]
            try! self.realm.write({ () in
                self.realm.delete(items)
            })
            myTableV.deleteRows(at: [indexPath], with: .automatic)
        }
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
}
