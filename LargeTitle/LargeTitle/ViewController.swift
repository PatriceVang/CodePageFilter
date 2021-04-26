//
//  ViewController.swift
//  LargeTitle
//
//  Created by Apple on 4/23/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let searchVC = UISearchController(searchResultsController: nil)

    @IBOutlet weak var tbv: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Home"
        navigationController?.navigationBar.prefersLargeTitles = true

        navigationItem.searchController = searchVC
                
        tbv.delegate = self
        tbv.dataSource = self
        tbv.translatesAutoresizingMaskIntoConstraints = false

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tbv.contentOffset = .init(x: 0, y: searchVC.searchBar.frame.size.height)
        tbv.scrollToRow(at: .init(row: 0, section: 0), at: .top, animated: false)
        
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Thu tien di tre"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
