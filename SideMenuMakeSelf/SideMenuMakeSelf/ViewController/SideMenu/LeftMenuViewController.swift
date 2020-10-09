//
//  LeftMenuViewController.swift
//  SideMenuMakeSelf
//
//  Created by Apple on 10/8/20.
//

import UIKit


enum MenuType: String {
    case home
    case event
    case profile
}
class LeftMenuViewController: UIViewController {
    
    var didTapMenuType: ((MenuType) -> Void)?
    
    private let data: [MenuType] = [.home, .event, .profile]

    @IBOutlet weak var leftTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        leftTableView.register(UINib(nibName: "LeftCell", bundle: nil), forCellReuseIdentifier: "cell")

    }
}

extension LeftMenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = leftTableView.dequeueReusableCell(withIdentifier: "cell") as! LeftCell
        cell.textLabel?.text = data[indexPath.row].rawValue
        return cell
    }
    
}

extension LeftMenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true, completion: nil)
        self.didTapMenuType?(data[indexPath.row])
    }
}
