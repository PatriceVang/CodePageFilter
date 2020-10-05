//
//  HomeViewController.swift
//  DemoTodoWithCloudFirestore
//
//  Created by Apple on 10/5/20.
//

import UIKit
import SnapKit


class HomeViewController: UIViewController {
    
    let todoTableView = UITableView()
    var todos = [String]()
    var id = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        TodoDB.shared.getData { (data) in
            if let todo = data as? [String: String] {
                DispatchQueue.main.async {
                    for item in todo {
                        self.todos.append(item.value)
                    }
                    if let maxId = todo.keys.sorted().last {
                        self.id = Int(maxId) ?? 0
                    }
                    self.todoTableView.reloadData()
                }
            }
        }
    }
    
    private func setupUI() {
        // TableView
        todoTableView.delegate = self
        todoTableView.dataSource = self
        todoTableView.register(TodoCell.self, forCellReuseIdentifier: "cell")
        todoTableView.tableFooterView = UIView()
        
        self.view.addSubview(todoTableView)
        todoTableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view)
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
            make.bottom.equalTo(self.view)
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(onTapAddButton(_:)))
        
        
    }
    
    //MARK:-- Handle Event
    @objc func onTapAddButton(_ sender: UIButton) {
        
        let dialog = UIAlertController(title: "Todo", message: "Add todo", preferredStyle: .alert)
        let cancleAction = UIAlertAction(title: "Cancle", style: .cancel, handler: nil)
        dialog.addTextField { (textfiled) in
            textfiled.placeholder = "homework"
        }
        
        
        let okAction = UIAlertAction(title: "OK", style: .default) { [self] (action) in
            if let text = dialog.textFields?.first?.text {
                print(text)
                id = id + 1
                TodoDB.shared.addTodo(id: "\(id)", todo: text)
                self.todos.append(text)
                self.todoTableView.reloadData()
 
            }
            
        }
        
        dialog.addAction(okAction)
        dialog.addAction(cancleAction)
        present(dialog, animated: true, completion: nil)
        
    }

}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = todoTableView.dequeueReusableCell(withIdentifier: "cell") as! TodoCell
        cell.textLabel?.text = todos[indexPath.row]
        return cell
    }
    
    
}

extension HomeViewController: UITableViewDelegate {

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("")
    }
}
