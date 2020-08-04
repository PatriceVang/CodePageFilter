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
    
    
    var isAllowedMultiple: Bool = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        myTableV.register(UINib(nibName: "UserInfoCell", bundle: nil), forCellReuseIdentifier: "cell")
        myTableV.register(UINib(nibName: "MultipleCell", bundle: nil), forCellReuseIdentifier: "cell1")
        
        setupUI()
        presenter?.getUser()

    }
    
    private func setupUI() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(onTapAddBtn))
        
    }
    
    @objc func onTapAddBtn() {
        print(12)
        presenter?.allowMultiple()
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

        if isAllowedMultiple {
            let cell = myTableV.dequeueReusableCell(withIdentifier: "cell1") as! MultipleCell
            cell.setValue(user: listUser[indexPath.row])
            cell.delelgate = self
            return cell
        } else {
            let cell = myTableV.dequeueReusableCell(withIdentifier: "cell") as! UserInfoCell
            cell.setupValue(user: listUser[indexPath.row])
            return cell
        }
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
    func showMultiple(isAllowed: Bool) {
        isAllowedMultiple = isAllowed
        myTableV.reloadData()
    }
    
    func showUser(user: [User]) {
        listUser = user
        print(listUser)
        self.myTableV.reloadData()
    }
    
}

extension UserVC: MultipleCelldelegate {
    func onSelectPerson(didSelected: Bool, at cell: UITableViewCell) {
        guard let indexPath = myTableV.indexPath(for: cell) else {return}
        presenter?.handleSelectedUser(index: indexPath.row, isSelected: didSelected)
    }
}

