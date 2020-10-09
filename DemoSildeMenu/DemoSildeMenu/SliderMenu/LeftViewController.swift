//
//  LeftViewController.swift
//  DemoSildeMenu
//
//  Created by Apple on 10/8/20.
//

import UIKit

class LeftViewController: UIViewController {
    
    private let titlesArray = ["Open Right View",
                                "",
                                "Change Root VC",
                                "",
                                "Profile",
                                "News",
                                "Articles",
                                "Video",
                                "Music"]

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
//        cell.separatorView.isHidden = (indexPath.row <= 3 || indexPath.row == self.titlesArray.count-1)
//               cell.isUserInteractionEnabled = (indexPath.row != 1 && indexPath.row != 3)
    }
}

extension LeftViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC = DetailViewController()
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
}
