//
//  UserViewController.swift
//  DemoTodoWithCloudFirestore
//
//  Created by Apple on 10/5/20.
//

import UIKit

class UserViewController: UIViewController {
    
    let userTableView = UITableView()
    var id = 0
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        UserDB.shared.getAll { [weak self] (user) in
            DispatchQueue.main.async {
                let userId = user.map {$0.id}
                let arrId = userId.map {Int($0 ?? "0")}
                let maxId = arrId.max { (a, b) -> Bool in
                    return a! < b!
                }
                self?.id = (maxId ?? 0)!
                self?.users = user
                self?.userTableView.reloadData()
            }
        }
    }
    
    private func setupUI() {
        
        userTableView.delegate = self
        userTableView.dataSource = self
        userTableView.register(TodoCell.self, forCellReuseIdentifier: "cell")
        userTableView.tableFooterView = UIView()
        
        self.view.addSubview(userTableView)
        userTableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view)
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
            make.bottom.equalTo(self.view)
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(onTapAddButton(_:)))
    }
    
    @objc func onTapAddButton(_ sender: UIButton) {
        
        let dialog = UIAlertController(title: "Todo", message: "Add todo", preferredStyle: .alert)
        let cancleAction = UIAlertAction(title: "Cancle", style: .cancel, handler: nil)
        dialog.addTextField { (textfiled) in
            textfiled.placeholder = "Melody marks"
        }
        
        let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] (action) in
            if let text = dialog.textFields?.first?.text {
                self?.id += 1
                let user = User(id: "\(self?.id ?? 0)", name: text, age: "", major: "", idDoc: "")
                UserDB.shared.add(entity: user)
                UserDB.shared.getAll { [weak self] (users) in
                    DispatchQueue.main.async {
                        self?.users = users
                        self?.userTableView.reloadData()
                    }
                }
            }
        }
        
        dialog.addAction(okAction)
        dialog.addAction(cancleAction)
        present(dialog, animated: true, completion: nil)
        
    }
    

}
extension UserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userTableView.dequeueReusableCell(withIdentifier: "cell") as! TodoCell
        cell.textLabel?.text = users[indexPath.row].name
        return cell
    }
}

extension UserViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            UserDB.shared.delete(entity: self.users[indexPath.row])
            UserDB.shared.getAll { [weak self] (users) in
                DispatchQueue.main.async {
                    self?.users = users
                    self?.userTableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC = DetailViewController()
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
}
