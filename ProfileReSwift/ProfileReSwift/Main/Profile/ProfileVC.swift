//
//  ProfileVC.swift
//  ProfileReSwift
//
//  Created by Apple on 7/14/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit



struct SessionProfile {
    var type: SessionType
    var items: [RowType]
    
    enum SessionType {
        case infomation
        case terms
        case logout
    }
    enum RowType: String {
        case changePassword = "Change password"
        case termsOfUser = "Terms of User"
        case privacy = "Privacy Policy"
        case logout = "Log out"
    }
}



class ProfileVC: UIViewController {
    
    lazy var profileTableV = UITableView(frame: .zero)
    
    var sessionProfile = [SessionProfile]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        title = "Profile"
        self.view.backgroundColor = .white
        
        //-- TableView
        self.view.addSubview(profileTableV)
        profileTableV.delegate = self
        profileTableV.dataSource = self
        profileTableV.tableFooterView = UIView()
        profileTableV.backgroundColor = #colorLiteral(red: 0.9488552213, green: 0.9487094283, blue: 0.9693081975, alpha: 1)
        profileTableV.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileTableV.topAnchor.constraint(equalTo: self.view.topAnchor),
            profileTableV.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            profileTableV.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            profileTableV.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        profileTableV.register(ProfileCell.self, forCellReuseIdentifier: "cell")
        
        sessionProfile = [
            SessionProfile(type: .infomation, items: [.changePassword]),
            SessionProfile(type: .terms, items: [.termsOfUser,.privacy]),
            SessionProfile(type: .logout, items: [.logout])
        ]
        
        NetworkProvider.shared.userApi.getUser()
            .done { (arrUser) in
                print(arrUser.map {$0.name})
        }
        .catch { (err) in
            print(err.localizedDescription)
        }
        

    }

}
extension ProfileVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch sessionProfile[section].type {
        case .infomation:
            return 100
        default:
            return 12
        }
    }


    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        switch sessionProfile[section].type {
        case .infomation:
            let infoHeader = InfomationHeader(frame: .init(x: 0, y: 0, width: profileTableV.frame.width, height: 100))
            infoHeader.nameLable.text = "VNMobile"
            infoHeader.emailLable.text = "vnmobile@gmail.com"
            return infoHeader
        default:
            let aView = UIView(frame: .init(x: 0, y: 0, width: profileTableV.frame.width, height: 12))
            aView.backgroundColor = #colorLiteral(red: 0.9488552213, green: 0.9487094283, blue: 0.9693081975, alpha: 1)
           return aView
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sessionProfile.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rowCount = sessionProfile[section].items.count
        switch sessionProfile[section].type {
        case .infomation:
            return rowCount
        case .terms:
             return rowCount
        case .logout:
             return rowCount
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rows = sessionProfile[indexPath.section].items[indexPath.row]
        let cell = profileTableV.dequeueReusableCell(withIdentifier: "cell") as! ProfileCell
        
        cell.textLabel?.text = rows.rawValue
        switch sessionProfile[indexPath.section].type {
        case .logout:
            cell.textLabel?.textColor = .systemRed
        default:
            cell.textLabel?.textColor = .black
        }
        return cell
    }
}

extension ProfileVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rows = sessionProfile[indexPath.section].items[indexPath.row]
        switch rows {
        case .changePassword:
            self.navigationController?.pushViewController(ChangPaswordVC(), animated: true)
        case .termsOfUser:
            let web = WebVC(str: "https://www.apple.com")
            web.title = rows.rawValue
            self.navigationController?.pushViewController(web, animated: true)
        case .privacy:
            let web = WebVC(str: "https://www.google.com/")
            web.title = rows.rawValue
            self.navigationController?.pushViewController(web, animated: true)
        case .logout:
            let listUserVC = ListUserVC()
            self.navigationController?.pushViewController(listUserVC, animated: true)
        }
    }
    
}
