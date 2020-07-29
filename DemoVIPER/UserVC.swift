//
//  UserVC.swift
//  DemoVIPER
//
//  Created by Apple on 7/27/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class UserVC: UIViewController {
    @IBOutlet weak var myTableV: UITableView!
    
    var presenter: UserPresenterProtocol?
    
    var listUser = [User]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        myTableV.register(UINib(nibName: "UserInfoCell", bundle: nil), forCellReuseIdentifier: "cell")
        presenter?.getUser()

    }
    @IBAction func onTapMoveToDetailBtn(_ sender: UIButton) {
        presenter?.moveToDetail()
    }
}

extension UserVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableV.dequeueReusableCell(withIdentifier: "cell") as! UserInfoCell
        cell.setupValue(user: listUser[indexPath.row])
        return cell
    }
}

extension UserVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alert = UIAlertController(title: "Update User", message: nil, preferredStyle: .alert)
        let actionOK = UIAlertAction(title: "OK", style: .default, handler: { [weak self](action) in
            guard let self = self else {return}
            if let text = alert.textFields?.first?.text?.trimmingCharacters(in: .whitespacesAndNewlines) {
               
            }
        })
        
        let cancle = UIAlertAction(title: "Cancle", style: .default, handler: nil)
        
        alert.addTextField { (tf) in
            tf.placeholder = "New name"
        }
        
        alert.addAction(actionOK)
        alert.addAction(cancle)
        
        self.present(alert, animated: true, completion: nil)
    }
}

extension UserVC: UserViewProtocol {
    func showUser(user: [User]) {
        listUser = user
        self.myTableV.reloadData()
    }
}

