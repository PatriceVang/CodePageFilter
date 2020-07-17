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
    lazy var searchTextField: MyTextField = MyTextField(style: .confirmPassword)
    lazy var deleteView = UIView()
    
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
        title = "List User"
        setupUI()
        
        
        NetworkProvider.shared.userApi.createUser(params: ["title": "Patrice", "body": "HCM"]).done { (post) in
            print(post)
        }.catch { (err) in
            print(err)
        }
        
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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "More", style: .done, target: self, action: #selector(onTapMoreBtn(_:)))
        
        self.view.addSubview(listUserTableView)
        listUserTableView.tableFooterView = UITableView()
        listUserTableView.register(ListUserCell.self, forCellReuseIdentifier: "cell")
        listUserTableView.register(MoreCell.self, forCellReuseIdentifier: "more")
        listUserTableView.delegate = self
        listUserTableView.dataSource = self
        NSLayoutConstraint.activate([
            listUserTableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            listUserTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            listUserTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            listUserTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            searchTextField.heightAnchor.constraint(equalToConstant: 30),
            searchTextField.widthAnchor.constraint(equalToConstant: self.view.frame.width - 200)
        ])
        navigationItem.titleView = searchTextField
        searchTextField.addTarget(self, action: #selector(onchangeTextOfTextField(_:)), for: .editingChanged)
        
        
        self.view.addSubview(deleteView)
        deleteView.translatesAutoresizingMaskIntoConstraints = false
        deleteView.backgroundColor = .systemRed
        deleteView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTapDeleteView(_:))))
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Delete Item"
        title.textColor = .black
        deleteView.addSubview(title)
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: deleteView.centerXAnchor),
            title.centerYAnchor.constraint(equalTo: deleteView.centerYAnchor),
            title.heightAnchor.constraint(equalToConstant: 30)
        ])
        NSLayoutConstraint.activate([
            deleteView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            deleteView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            deleteView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            deleteView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        listUserSubciber = StoreListener(handler: { [weak self](_) in
            guard let self = self else {return}
            self.listUserTableView.reloadData()
            
            if self.listUserStateVC.listSelectedUser.isEmpty {
                self.deleteView.isHidden = true
            } else {
                self.deleteView.isHidden = false
            }
        })
        reloadData()

    }
    
    private func reloadData() {
        NetworkProvider.shared.userApi.getUser().done { [weak self] (arrUser) in
            self?.listUserStateVC.read(user: arrUser)
        }.catch { (err) in
            print(err)
        }
    }
    
    //MARK:-- Handle Event
    
    @objc func onTapDeleteView(_ sender: UITapGestureRecognizer) {
        listUserStateVC.isDeletedItems()
    }
    
    @objc func onTapMoreBtn(_ sender: UIBarButtonItem) {
        listUserStateVC.isShowSelectItems()
    }
    
    @objc func onchangeTextOfTextField(_ sender: UITextField) {
        if sender.text == "" {
          reloadData()
        }
        
        if sender.text?.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
            listUserStateVC.filter(name: (sender.text?.trimmingCharacters(in: .whitespacesAndNewlines))!)
        }
    }
}

extension ListUserVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listUserStateVC.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rows = listUserStateVC.list[indexPath.row]
        switch listUserStateVC.isShowedSelectItems {
        case false:
            let cell = listUserTableView.dequeueReusableCell(withIdentifier: "cell") as! ListUserCell
            cell.setValue(user: rows)
            return cell
        case true:
            let cell = listUserTableView.dequeueReusableCell(withIdentifier: "more") as! MoreCell
            self.listUserTableView.separatorStyle = .none
            cell.setValue(user: rows)
            return cell
        }
    }

}

extension ListUserVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if listUserStateVC.isShowedSelectItems {
            listUserStateVC.isSeletedItems(userIndex: indexPath.row)
        }
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { [weak self] (action, indexPath) in
            self?.listUserStateVC.delete(at: indexPath.row)
        }
        
        let insertAction = UITableViewRowAction(style: .default, title: "Insert") { (action, indexPath) in
            action.backgroundColor = .systemBlue
            action.title = "asdf"

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

