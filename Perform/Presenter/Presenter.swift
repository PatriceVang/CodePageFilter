//
//  Presenter.swift
//  Perform
//
//  Created by Apple on 3/30/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class Presenter {
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 30))
        let label = UILabel(frame: CGRect(x: 10, y: 5, width: tableView.frame.size.width, height: 30))
        label.text = self.headerSection[section]
        label.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(label)
        view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? MyCellTableViewCell
        cell?.textLabel?.text = self.data[indexPath.section][indexPath.row].name
        let isChecked = data[indexPath.section][indexPath.row].isChecked
        if isChecked == false {
            cell?.btnChecking.setImage(UIImage(named: "ic_unchecked"), for: .normal)
        } else {
            cell?.btnChecking.setImage(UIImage(named: "ic_checked"), for: .normal)
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var isChecking = data[indexPath.section][indexPath.row].isChecked
        if let cell = tableView.cellForRow(at: indexPath) as? MyCellTableViewCell {
            isChecking = !isChecking
            self.data[indexPath.section][indexPath.row].update(isChecked: isChecking)
            print(isChecking)
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
    }
}
