//
//  SideMenuTableViewController.swift
//  DemoSildeMenu
//
//  Created by Apple on 10/12/20.
//

import UIKit

class SideMenuTableViewController: UITableViewController {
    
    private let data = ["Home", "Screen 2", "Screen 3"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "LeftViewCell", bundle: nil), forCellReuseIdentifier: "cell")

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! LeftViewCell
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        

        if indexPath.row == 0 {
            let navigation = UINavigationController(rootViewController: AwesomeViewController())
            self.changeViewController(navigation)

        } else if indexPath.row == 1 {
            let navigation2 = UINavigationController(rootViewController: Screen2ViewController())
            self.changeViewController(navigation2)
            
        } else {
            let navigation3 = UINavigationController(rootViewController: Screen3ViewController())
            self.changeViewController(navigation3)
        }
    }

    
}
