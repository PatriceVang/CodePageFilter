//
//  ExpandVC.swift
//  MVCExpandTableView
//
//  Created by Apple on 6/2/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class ExpandVC: UIViewController {
    @IBOutlet weak var myTableV: UITableView!
    
    var listDataExpand = [
        DataExpand(isExpand: false, club: "MU", player: ["The god Lingar", "Lukaku"]),
        DataExpand(isExpand: false, club: "MC", player: ["Kompany", "David Silva", "Walker"]),
        DataExpand(isExpand: false, club: "Chelsea", player: ["Kante"]),
        DataExpand(isExpand: false, club: "Real Madric", player: ["Ramos", "Trooks", "Isco", "Maceclo"])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myTableV.register(UINib(nibName: "DetailCell", bundle: nil), forCellReuseIdentifier: "cell")
    }


}

extension ExpandVC: UITableViewDelegate, UITableViewDataSource {
    
  
    func numberOfSections(in tableView: UITableView) -> Int {
        return listDataExpand.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if listDataExpand[section].isExpand == true {
            return listDataExpand[section].player.count + 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableV.dequeueReusableCell(withIdentifier: "cell") as! DetailCell
        if indexPath.row == 0 {
            cell.titleLb.text = listDataExpand[indexPath.section].club
        } else {
            cell.titleLb.text = listDataExpand[indexPath.section].player[indexPath.row - 1]
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if listDataExpand[indexPath.section].isExpand == true {
            listDataExpand[indexPath.section].isExpand = false
            
            let section = IndexSet.init(integer: indexPath.section)
            myTableV.reloadSections(section, with: .none)
        } else {
            listDataExpand[indexPath.section].isExpand = true
            let section = IndexSet.init(integer: indexPath.section)
            myTableV.reloadSections(section, with: .none)
        }
    }

}
