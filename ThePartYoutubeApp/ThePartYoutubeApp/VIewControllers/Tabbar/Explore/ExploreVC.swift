//
//  ExploreVC.swift
//  ThePartYoutubeApp
//
//  Created by Apple on 5/12/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

private let cellId = "cellId"
private let headerId = "headerId"
        
class ExploreVC: UIViewController {
    @IBOutlet weak var myTableV: UITableView!
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableV.register(UINib(nibName: "ExploreCell", bundle: nil), forCellReuseIdentifier: cellId)
        myTableV.register(HeaderExplore.self, forHeaderFooterViewReuseIdentifier: headerId)
    }
}

//MARK: TableView
extension ExploreVC: UITableViewDelegate, UITableViewDataSource {
    //header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerV = myTableV.dequeueReusableHeaderFooterView(withIdentifier: headerId) as? HeaderExplore
        
        return headerV!
    }
    //cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableV.dequeueReusableCell(withIdentifier: cellId) as? ExploreCell
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.view.frame.width / 3
    }
}
