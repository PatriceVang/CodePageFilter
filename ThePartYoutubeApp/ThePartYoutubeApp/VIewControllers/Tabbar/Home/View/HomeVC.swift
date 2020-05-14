//
//  HomeVC.swift
//  ThePartYoutubeApp
//
//  Created by Apple on 5/12/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
private let cellItemID = "cell"
private let cellUtityID = "cellTable"

class HomeVC: UIViewController {
    @IBOutlet weak var myTableItemsVideo: UITableView!
  

    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // REGISTER
        myTableItemsVideo.register(UINib(nibName: "ItemsVideoCellHome", bundle: nil), forCellReuseIdentifier: cellItemID)
        myTableItemsVideo.register(UINib(nibName: "UtityCellHome", bundle: nil), forCellReuseIdentifier: cellUtityID)

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.isHidden = true
    }

}

//MARK: Table View
extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 1
        } else {
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 1 {
            let cell = myTableItemsVideo.dequeueReusableCell(withIdentifier: cellUtityID) as? UtityCellHome
            return cell!
        }
        let cell = myTableItemsVideo.dequeueReusableCell(withIdentifier: cellItemID) as? ItemsVideoCellHome
        cell?.delegate = self
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.width / 1.5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let video = VideosLaucher()
        video.showVideo()
    }
}

extension HomeVC: ItemsVideoCellHomeDelegate {
    func goToAuthor() {
        self.navigationController?.pushViewController(AuthorVC(), animated: true)
    }
    
    
}


