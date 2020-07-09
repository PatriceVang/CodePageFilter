//
//  DetailVC.swift
//  DemoTableViewWithEnum
//
//  Created by Apple on 7/9/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit


enum People {
    case Actor
    case Author
}

struct SessionType {
    var type: People
    var items: [Any]
    var isCollapsed: Bool
    
}

struct Actor {
    var name: String?
}

struct Author {
    var name: String?
}

class DetailVC: UIViewController {
    var listActor = [
        Actor(name: "David"),
        Actor(name: "David 1"),
        Actor(name: "David 2"),
        Actor(name: "David 3"),
        Actor(name: "David 4"),
        Actor(name: "David 5"),
    ]
    
    var listAuthor = [
        Author(name: "Lionking"),
        Author(name: "Lionking 1"),
        Author(name: "Lionking 2"),
        Author(name: "Lionking 3")
    ]
    
    var mySession = [SessionType]()

    var isExpandedSession: Bool = false
    



    @IBOutlet weak var myTableV: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableV.register(UINib(nibName: "ExpandedCell", bundle: nil), forCellReuseIdentifier: "cellId")
        
        mySession = [
            SessionType(type: .Actor, items: [], isCollapsed: false),
            SessionType(type: .Author, items: [], isCollapsed: false)
        ]
        

    }
    
    @objc func onTapHeader(_ sender: UITapGestureRecognizer) {
        print(sender.view?.tag as Any)
        guard let indexPath = sender.view?.tag else {return}
        mySession[indexPath].isCollapsed.toggle()
        
        reloadTableView(index: indexPath, isExpanded: mySession[indexPath].isCollapsed)
    }
    
    func reloadTableView(index: Int, isExpanded: Bool) {
        if mySession[index].isCollapsed {
            mySession[index].items = index == 0 ? listActor : listAuthor
        } else {
            mySession[index].items = []
        }
        self.myTableV.reloadSections([index], with: .automatic)
        
    }

}

extension DetailVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerV = UIView(frame: .init(x: 0, y: 0, width: myTableV.frame.width, height: 50))
        headerV.backgroundColor = .systemBlue
        headerV.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTapHeader(_:))))
        headerV.isUserInteractionEnabled = true
        headerV.tag = section
        
        let titleLb = UILabel(frame: .init(x: 0, y: 0, width: 100, height: 30))
        titleLb.center = headerV.center
        titleLb.textColor = .black
        titleLb.textAlignment = .center
        
        switch mySession[section].type {
        case .Actor:
            titleLb.text = "Actor"
        case .Author:
            titleLb.text = "Author"
        }
        headerV.addSubview(titleLb)
        return headerV
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return mySession.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if mySession[section].isCollapsed {
            return mySession[section].items.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableV.dequeueReusableCell(withIdentifier: "cellId") as! ExpandedCell
        cell.delegate = self
        return cell
    }
    
}

extension DetailVC: ExpandCellDelegate {
    func expanded(cell: ExpandedCell?, isExpanded: Bool) {
//        guard let tableView = cell, let indexPath = myTableV.indexPath(for: tableView) else {return}
        
        switch isExpanded {
        case true:
            NetworkingProvider.shared.user.getUser()
            .done { (arrUser) in
                cell?.listUser = arrUser
            }
            .catch { (err) in
                print(err.localizedDescription)
            }
            .finally {
                cell?.reload(isExpended: isExpanded)
                self.myTableV.reloadData()
            }
        case false:
            cell?.listUser = []
            cell?.reload(isExpended: isExpanded)
            myTableV.reloadData()
        }
        
    }

}
