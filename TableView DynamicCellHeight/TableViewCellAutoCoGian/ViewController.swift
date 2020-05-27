//
//  ViewController.swift
//  TableViewCellAutoCoGian
//
//  Created by Apple on 3/31/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myTableView: UITableView!
    var data = Data()


    @IBOutlet weak var lbText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.rowHeight = UITableView.automaticDimension
        myTableView.estimatedRowHeight = 100
    }


}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.data().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "Cell")  as? MyCellTableViewCell
        cell?.lbText.text = data.data()[indexPath.row]
        return cell!
    }
    
}

