//
//  HomeVC.swift
//  DemoTableViewWithEnum
//
//  Created by Apple on 7/1/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

private enum SectionType {
    case Other
    case Account

}

private enum Item {
  case ManageAccounts
  case ActiveAccount
  case DefaultCountry
  case AboutMe
  case Donate
  case RateApp
  case ShareApp
}

private struct Section {
  var type: SectionType
  var items: [Item]
}



class HomeVC: UIViewController {
    
    private var mySection = [Section]()

    @IBOutlet weak var myTableV: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableV.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "cell")
        mySection = [
            Section(type: .Account, items: [.ActiveAccount, .DefaultCountry, .ActiveAccount]),
            Section(type: .Other, items: [.AboutMe, .Donate, .RateApp, .ShareApp])
        ]
    }

}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        mySection.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySection[section].items.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let sections = mySection[section].type
        switch sections {
        case .Account:
            return "Account"
        case .Other:
            return "Other"
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rows = mySection[indexPath.section].items[indexPath.row]
        let cell = myTableV.dequeueReusableCell(withIdentifier: "cell") as! MyCell
        switch rows {
        case .DefaultCountry, .ActiveAccount, .ManageAccounts:
            cell.textLabel?.text = "Cell1"
        case .AboutMe, .Donate, .RateApp, .ShareApp:
            cell.textLabel?.text = "Cell2"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rows = mySection[indexPath.section].items[indexPath.row]
        
        switch rows {
        case .AboutMe:
            print("about me")
        default:
            print("other")
        }
    }
    
    
}
