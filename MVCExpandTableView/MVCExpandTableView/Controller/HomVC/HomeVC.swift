//
//  HomeVC.swift
//  MVCExpandTableView
//
//  Created by Apple on 6/2/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    @IBOutlet weak var myTableV: UITableView!
    
    var isTappedCell: Bool = false

    var newIndexpath: IndexPath?
    
    var listUser = [
        User(name: "David", subtitle: "HCM"),
        User(name: "Randle", subtitle: "HN"),
        User(name: "NSLayaout", subtitle: "DN"),
        User(name: "Contrain", subtitle: "LA"),
        User(name: "Frame", subtitle: "AG"),
        User(name: "Work", subtitle: "DT"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableV.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableV.dequeueReusableCell(withIdentifier: "cell") as! MyCell
        let user = listUser[indexPath.row]
        
        //delegate
        cell.delegate = self
        cell.isTapped = isTappedCell
        cell.indexPath = newIndexpath
        
        cell.setupData(user: user)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        newIndexpath = indexPath
        isTappedCell.toggle()
    }
}

extension HomeVC: MycellDeleegate {
    func showDetailText(isTapped: Bool, indexPath: IndexPath) {
        guard let cell = myTableV.cellForRow(at: indexPath) as? MyCell else {return}
        cell.subTitleLb.isHidden = isTapped ? true : false
        myTableV.reloadData()
    }
}


