//
//  ListUserVC.swift
//  ProfileReSwift
//
//  Created by Apple on 7/15/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit



class ListUserVC: UIViewController {
    
    let listUserTableView: UITableView = {
       let tbV = UITableView()
        tbV.translatesAutoresizingMaskIntoConstraints = false
        return tbV
    }()
    
    var listUserStateVC: ListUserStateVC
    var listUserSubciber: StoreListener = StoreListener<ListUserState>(handler: nil)
    
    init() {
        listUserStateVC = ListUserStateVC()
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        NetworkProvider.shared.userApi.getUser().done { [weak self] (arrUser) in
            self?.listUserStateVC.read(user: arrUser)
        }.catch { (err) in
            print(err)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        store.subscribe(self.listUserSubciber) {
            $0.select {
                $0.listUserState
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        store.unsubscribe(self.listUserSubciber)
    }

    private func setupUI() {
        self.view.addSubview(listUserTableView)
        listUserTableView.tableFooterView = UITableView()
        listUserTableView.register(ListUserCell.self, forCellReuseIdentifier: "cell")
        listUserTableView.delegate = self
        listUserTableView.dataSource = self
        NSLayoutConstraint.activate([
            listUserTableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            listUserTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            listUserTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            listUserTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])

        listUserSubciber = StoreListener(handler: { (_) in
            self.listUserTableView.reloadData()
        })
    }
}

extension ListUserVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listUserStateVC.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listUserTableView.dequeueReusableCell(withIdentifier: "cell") as! ListUserCell
        let rows = listUserStateVC.list[indexPath.row]
        cell.setValue(user: rows)
        return cell
    }

}

extension ListUserVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let updateVC = UpdateUserVC()
        updateVC.user = listUserStateVC.list[indexPath.row]
        self.navigationController?.pushViewController(updateVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { [weak self] (action, indexPath) in
            self?.listUserStateVC.delete(at: indexPath.row)
        }
        
        let insertAction = UITableViewRowAction(style: .default, title: "Insert") { (action, indexPath) in
            action.backgroundColor = .systemBlue

            AlertDialog.showUpdateNameDialog(on: self, title: "Add new User", msg: nil, textfield: { (tf) in
                tf.placeholder = "input Text"
            }) { [weak self] (action, str) in
                let id = self?.listUserStateVC.list.compactMap {$0.id}.max {$0 < $1}
                let user = User(id: id! + 1, name: str)
                self?.listUserStateVC.add(user: user)
            }
        }
        
        return [deleteAction, insertAction]
    }
    
    
    
}
