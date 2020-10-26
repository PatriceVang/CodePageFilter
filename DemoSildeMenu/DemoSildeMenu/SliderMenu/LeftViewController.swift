//
//  LeftViewController.swift
//  DemoSildeMenu
//
//  Created by Apple on 10/8/20.
//

import UIKit
import AKSideMenu

class LeftViewController: UIViewController {
    
    
    
    private let titlesArray = ["Home", "Event", "Profile"]
    weak var delegate: LeftViewControllerDelegate?
    
    var navigation = UINavigationController()

    @IBOutlet weak var leftTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        leftTableView.register(UINib(nibName: "LeftViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        sideMenuViewController?.delegate = self
    
    }
    

}

extension LeftViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titlesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = leftTableView.dequeueReusableCell(withIdentifier: "cell") as! LeftViewCell
        cell.textLabel?.text = titlesArray[indexPath.row]
        return cell
 
    }
}

extension LeftViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(indexPath.row)
        
        switch indexPath.row {
        case 0:
            
            navigation = UINavigationController(rootViewController: FirstVC())
            self.sideMenuViewController?.setContentViewController(navigation, animated: true)
            self.sideMenuViewController?.hideMenuViewController()
        case 1:
            navigation = UINavigationController(rootViewController: SecondVC())
            self.sideMenuViewController?.setContentViewController(navigation, animated: true)
            self.sideMenuViewController?.hideMenuViewController()
        default:
            break
        }
    }
}

protocol LeftViewControllerDelegate: class {
    func moveToScreen(at index: Int)
}

extension LeftViewController: AKSideMenuDelegate {
    func sideMenu(_ sideMenu: AKSideMenu, willShowMenuViewController menuViewController: UIViewController) {
        let height: CGFloat = 50
        let bounds = navigation.navigationBar.bounds
        navigation.navigationBar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height + height)
        navigation.navigationBar.backgroundColor = .yellow
        print("Show")
        
    }
    
    func sideMenu(_ sideMenu: AKSideMenu, willHideMenuViewController menuViewController: UIViewController) {
        print("Hide")
//
       
    }
}
