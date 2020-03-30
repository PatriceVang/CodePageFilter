//
//  ViewController.swift
//  Perform
//
//  Created by Apple on 3/30/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var myNavigationBar: UINavigationBar!
    var headerSection = ["Male", "Female"]
    
    var data = [
        [
            User(name: "A", isChecked: false),
            User(name: "B", isChecked: false),
            User(name: "C", isChecked: false),
            User(name: "D", isChecked: false),
            User(name: "E", isChecked: false),
            User(name: "F", isChecked: false),
            User(name: "G", isChecked: false),
            User(name: "H", isChecked: false),
        ],
        [
            User(name: "A1", isChecked: false),
            User(name: "B1", isChecked: false),
            User(name: "C1", isChecked: false),
            User(name: "D1", isChecked: false),
            User(name: "E1", isChecked: false),
            User(name: "F1", isChecked: false),
            User(name: "G1", isChecked: false),
            User(name: "H1", isChecked: false),
        ]
    ]
   

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        ///Trong tableview có sẵn protocol hứng sự kiện gọi là `UITableViewDelegate`, việc ta cần là set cho nó biến bắc cầu về class của mình
        myTableView.delegate = self
        myTableView.dataSource = self
        myNavigationBar.barTintColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        
    }
    
    //secstion
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }

    ///Setup header view ở đây
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //TODO
        let label = UILabel(); label.text = self.headerSection[section]
        return label
    }
    
    //cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "Cell") as? MyCellTableViewCell
        cell?.textLabel?.text = data[indexPath.section][indexPath.row].name
//        cell?.indenPath = indexPath
        return cell!
    }
    
    ///Đây là hàm để hứng sự kiện người dùng tap vào 1 cell, với indexPath cho trước
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ///TODO
        ///Mình sẽ làm gì khi người dùng tap vào 1 cell với `indexPath` cho đã cho
        var isChecking = data[indexPath.section][indexPath.row].isChecked
        guard let cell = myTableView.cellForRow(at: indexPath) as? MyCellTableViewCell else {
            return
        }
        isChecking = !isChecking
//        cell.isChecked = isChecking
        //cap nhat du lieu lai cho data
        data[indexPath.section][indexPath.row].update(isChecked: isChecking)
        print(indexPath)
        print(isChecking)
        self.myTableView.reloadData()
    }
}








