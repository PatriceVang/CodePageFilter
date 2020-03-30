//
//  ViewController.swift
//  Perform
//
//  Created by Apple on 3/30/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var names: [[String]] =
        [
            ["Tí", "Tèo", "Hùng", "Lam", "Thuỷ", "Tuấn", "Trung", "Hạnh"],
            ["Bình", "Khánh", "Toàn", "Tâm", "An", "Hương", "Huy", "Quang", "Vân", "Đài", "Tiến"]
    ]
    var headerSection = ["Male", "Female"]
    var onTapCheckBox : Bool = false

    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var myNavigationBar: UINavigationBar!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTableView.delegate = self
        myTableView.dataSource = self
        myNavigationBar.barTintColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        
        
    }
    
    //secstion
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names[section].count
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.black
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        return headerSection[section]
    }
    //cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "Cell") as? MyCellTableViewCell
        cell?.textLabel?.text = names[indexPath.section][indexPath.row]
        cell?.delegate = self
        cell?.indenPath = indexPath
        return cell!
    }
    func onTapChecBox(indexPath : IndexPath) {
        (0..<self.names.count).forEach { index in
            guard let cell = myTableView.cellForRow(at: IndexPath(row: index, section: headerSection.count)) as? MyCellTableViewCell else {
            return
        }
           if indexPath.row == index {
                onTapCheckBox = !onTapCheckBox
                cell.isChecking = onTapCheckBox
            }
        }
        print(indexPath)
    }
}

extension ViewController : MyCellTableViewCellDelegate {
    func onTapBtn(indexPath: IndexPath) {
        onTapChecBox(indexPath: indexPath)
    }
}



