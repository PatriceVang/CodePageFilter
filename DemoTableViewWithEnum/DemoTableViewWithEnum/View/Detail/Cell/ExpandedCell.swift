//
//  ExpandedCell.swift
//  DemoTableViewWithEnum
//
//  Created by Apple on 7/9/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class ExpandedCell: UITableViewCell {
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var heightTableView: NSLayoutConstraint!
    weak var delegate: ExpandCellDelegate?
    var currentPeople: People?
    var isExpanded = false
    var listUser = [User]()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SubCell", bundle: nil), forCellReuseIdentifier: "subcell")

    }

    @IBAction func onTapExpandBtn(_ sender: UIButton) {
        isExpanded.toggle()
        self.delegate?.expanded(cell: self)
    }

    func reload(people: People) {
        self.currentPeople = people
        heightTableView.constant = CGFloat( 44 * (people.isCollapsed ? listUser.count : 0))
        tableView.reloadData()
    }
 
}

extension ExpandedCell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return isExpanded ? listUser.count : 0
        guard let people = currentPeople else {return 0}
        return people.isCollapsed ? people.items.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subcell") as! SubCell
        guard let people = currentPeople else {return UITableViewCell()}
        cell.setValue(item: (people.items[indexPath.row] as? User)!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }

}

protocol ExpandCellDelegate: class {
    func expanded(cell: ExpandedCell?)
}


