//
//  ViewController.swift
//  SegmentWithTableview
//
//  Created by Apple on 5/10/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    let segmentControl: UISegmentedControl = {
        let sm = UISegmentedControl(items: ["Games", "TV shows", "Device"])
        sm.selectedSegmentIndex = 0
        sm.addTarget(self, action: #selector(onTapChangeSegment(sender:)), for: .valueChanged)
        sm.tintColor = .gray
        sm.selectedSegmentTintColor = .red
        return sm
    }()
    let stackV: UIStackView = {
        let stV = UIStackView()
        stV.translatesAutoresizingMaskIntoConstraints = false
        stV.axis = .vertical
        return stV
    }()
    let myTableV: UITableView = {
       let tb = UITableView()
        return tb
    }()
    lazy var rowToDisplay = games
    let games = ["Tree kingdoms", "PUPG", "LQ"]
    let tvShows = ["Westher", "News", "Talk show"]
    let device = ["Android", "IOS"]

    override func viewDidLoad() {
        super.viewDidLoad()
        myTableV.dataSource = self
        myTableV.delegate = self
        self.view.backgroundColor = .white
        self.navigationItem.title = "Segment"
        view.addSubview(stackV)
        stackV.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        stackV.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        stackV.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        stackV.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        stackV.addArrangedSubview(segmentControl)
        stackV.addArrangedSubview(myTableV)
    }
    @objc func onTapChangeSegment(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            rowToDisplay = games
            self.myTableV.reloadData()
        case 1:
            rowToDisplay = tvShows
            self.myTableV.reloadData()
        case 2:
            rowToDisplay = device
            self.myTableV.reloadData()
        default:
            break
        }
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = rowToDisplay[indexPath.row]
        return cell
    }
    
    
}

