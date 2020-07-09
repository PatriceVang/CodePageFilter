//
//  HomeVC.swift
//  DemoTableViewWithEnum
//
//  Created by Apple on 7/1/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
import Alamofire

private enum SectionType {
    case Admin
    case User
    case Todo

}


private struct Section {
  var type: SectionType
  var items: [Any]
}



class HomeVC: UIViewController {
    
    private var mySection = [Section]()

    @IBOutlet weak var myTableV: UITableView!
    private var openSection: Int = 0
    
//    var isExpanded: Bool = false {
//        didSet {
//            if isExpanded {
//                expandedTableView()
//            } else {
//                myTableV.reloadData()
//            }
//        }
//    }
    
    var index = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        #if DEV
            print("Server dev")
        #elseif STAG
            print("Server STAG")
        #else
            print("Server prod")
        #endif
        
        myTableV.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "cell")

        self.mySection = [
            Section(type: .User, items: []),
            Section(type: .Todo, items: []),
            Section(type: .Admin, items: [])
        ]
        
        
        NetworkingProvider.shared.user.getUser()
            .done { (listUser) in
                self.mySection[0].items = listUser
        }
        .catch { (err) in
            print(err.localizedDescription)
        }
        .finally {
            self.myTableV.reloadData()
        }
        
        NetworkingProvider.shared.todo.getTodo()
            .done { (listTodo) in
                self.mySection[1].items = listTodo
        }
        .catch { (err) in
            print(err.localizedDescription)
        }
        .finally {
            self.myTableV.reloadData()
        }

        
//        NetworkingProvider.shared.user.login(params: User.Parameters.Login(name: "name", city: "city"))
    }
    
    @objc func onTapHeader(sender: UIButton) {
        print(sender.tag)
        
        let newSection = sender.tag
        
        if newSection != openSection {
            var arrSection = [openSection]
            arrSection.append(newSection)
            openSection = newSection
            
            
            let index = IndexSet(integer: newSection)
            self.myTableV.reloadSections(index, with: .automatic)
        }
        
        
        self.myTableV.reloadSections([sender.tag], with: .automatic)
        
    }

}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return mySection.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section != openSection {
            return mySection[section].items.count
        } else {
            return 0
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerV = UIView(frame: .init(x: 0, y: 0, width: self.myTableV.frame.width, height: 50))
        headerV.backgroundColor = .systemBlue
//        let titleLb = UILabel(frame: .init(x: 0, y: 0, width: 100, height: 30))
//        titleLb.textAlignment = .center
//        titleLb.center = headerV.center
//        titleLb.textColor = .black
        
        let btn = UIButton(frame: .init(x: 0, y: 0, width: 100, height: 30))
        btn.center = headerV.center
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.textAlignment = .center
        btn.addTarget(self, action: #selector(onTapHeader(sender:)), for: .touchUpInside)
        btn.isUserInteractionEnabled = true
        btn.tag = section
        
        
 
        let title = mySection[section].type
        switch title {
        case .Admin:
            btn.setTitle("Admin", for: .normal)
        case .User:
          btn.setTitle("User", for: .normal)
        case .Todo:
            btn.setTitle("Todo", for: .normal)
        }
        headerV.addSubview(btn)
        
        return headerV
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rows = mySection[indexPath.section].items[indexPath.row]
        
        let cell = myTableV.dequeueReusableCell(withIdentifier: "cell") as! MyCell

        cell.setupData(item: rows)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let rows = mySection[indexPath.section].type
        
        switch rows {
        case .User:
            if let user = mySection[indexPath.section].items as? [User] {
                print(user[indexPath.row].name as Any)
            }
        case .Todo:
            if let todo = mySection[indexPath.section].items as? [Todo] {
                print(todo[indexPath.row].title as Any)
            }
        case .Admin:
            break
        }
    }
    
    
}
