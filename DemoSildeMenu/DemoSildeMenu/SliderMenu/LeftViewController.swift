//
//  LeftViewController.swift
//  DemoSildeMenu
//
//  Created by Apple on 10/8/20.
//

import UIKit

class LeftViewController: UIViewController {
    
    private let titlesArray = ["Home", "Event", "Profile"]
    weak var delegate: LeftViewControllerDelegate?

    @IBOutlet weak var leftTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        leftTableView.register(UINib(nibName: "LeftViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    
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
        print(indexPath.row)
    }
}

protocol LeftViewControllerDelegate: class {
    func moveToScreen(at index: Int)
}
