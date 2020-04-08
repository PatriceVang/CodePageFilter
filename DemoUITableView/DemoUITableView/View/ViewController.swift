//
//  ViewController.swift
//  DemoUITableView
//
//  Created by Apple on 3/27/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var myTableView: UITableView!
    var presenter = Presenter()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAdd(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
            let page2 = sb.instantiateViewController(withIdentifier: "Page2") as? NewFoodViewController
            self.navigationController?.pushViewController(page2!, animated: true)
    }
    
  
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberRow()
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return presenter.contentCell(tableView: tableView, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let food = presenter.data[indexPath.row]
        let editAction = UITableViewRowAction(style: .default, title: "Edit") { (action, indexPath) in
            self.updateAction(food: food , indexPath: indexPath)
        }
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
                   //delete
            self.deleteAction(food: food, indexPath: indexPath)
               }
        editAction.backgroundColor = .blue
        deleteAction.backgroundColor = .red
        return [deleteAction, editAction]
    }
    
    private func updateAction(food: Food, indexPath: IndexPath) {
        //tao hoi thoai alert
        let alert = UIAlertController(title: "Update", message: "Update a food", preferredStyle: .alert)
        
        let actionUpdate = UIAlertAction(title: "Save", style: .default) { (action) in
            guard let textField = alert.textFields?.first else {
                return
            }
            
            if let textEdit = textField.text {
                if textEdit.count == 0 {
                    return
                }
                food.name = textEdit
                self.myTableView.reloadRows(at: [indexPath], with: .automatic)
            } else {
                return
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancle", style: .default, handler: nil)
        alert.addTextField()
        guard let textField = alert.textFields?.first else {
            return
        }
        textField.placeholder = " Change your name"
        
        alert.addAction(actionUpdate)
        alert.addAction(cancelAction)
        present(alert, animated: true)
        
        
        
    }
    
    private func deleteAction(food: Food, indexPath: IndexPath) {
        //tao hoi thoai alert
        let alert = UIAlertController(title: "Delete", message: "Are you sure you want delete food?", preferredStyle: .alert)
        //tao nut delete
        let deletetAction = UIAlertAction(title: "Yes", style: .default) { action in
            self.presenter.data.remove(at: indexPath.row)
            self.myTableView.deleteRows(at: [indexPath], with: .automatic)
        }
        //tao nut cancle
        let cancelAction = UIAlertAction(title: "Cancle", style: .default, handler: nil)
        alert.addAction(deletetAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
           
    }
    
}

