//
//  HomeVC.swift
//  CoreDataCRUD
//
//  Created by Apple on 6/23/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
import CoreData

class HomeVC: UIViewController {
    @IBOutlet weak var myTableV: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableV.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "cell")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(onTapTitleAdd))
    }
    
    let userCoreData = RepositoryLocal<User>()
    
    @objc func onTapTitleAdd() {
        
        
        let popUp = UIAlertController(title: "ADD USER", message: "let's fill in below", preferredStyle: .alert)
        
        popUp.addTextField { (tf) in
            tf.placeholder = "Name"
        }
        popUp.addTextField { (tf) in
            tf.placeholder = "Address"
        }
        
        let cancleAction = UIAlertAction(title: "Cancle", style: .cancel, handler: nil)
        
        let confirmAction = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
            let name_Tf = popUp.textFields?.first
            let address_Tf = popUp.textFields![1]
            
//            --- insert Data
//            User.insertNewUser(name: (name_Tf?.text!)!, address: address_Tf.text!)
//            User.saveObject(entity: User()) { (user) in
//                user.setValue(name_Tf?.text, forKey: "name")
//                user.setValue(address_Tf.text, forKey: "address")
//            }
            // Test generic coredata
            self.userCoreData.saveObject { (user) in
                user.setValue(name_Tf?.text, forKey: "name")
                user.setValue(address_Tf.text, forKey: "address")
            }
            self.myTableV.reloadData()
        }
        popUp.addAction(cancleAction)
        popUp.addAction(confirmAction)
        present(popUp, animated: true, completion: nil)
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userCoreData.get().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableV.dequeueReusableCell(withIdentifier: "cell") as! MyCell
//        cell.name_Lb.text = User.getUser()[indexPath.row].name
//        cell.address_Lb.text = User.getUser()[indexPath.row].address
//        cell.name_Lb.text = userCoreData.get()[indexPath.row].name
//        cell.address_Lb.text = userCoreData.get()[indexPath.row].address
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete  {
            User.deleteUser(index: indexPath.row)
            self.myTableV.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = DetailVC()
        detail.delegate = self
        detail.indexpath = indexPath
        detail.user = User.getUser()[indexPath.row]
        self.navigationController?.pushViewController(detail, animated: true)
    }
}

extension HomeVC: DetailVCDelegate {
    func didUpdateUser(name: String, address: String, indexPath: IndexPath) {
        User.update(name: name, address: address, index: indexPath.row)
        self.myTableV.reloadData()
    }
}

