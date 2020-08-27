//
//  HomeViewController.swift
//  DemoDragItemsTableView
//
//  Created by Apple on 8/26/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
import MobileCoreServices

class Task {
    var title: String?
    var content: [String]
    
    init(title: String?, content: [String]) {
        self.title = title
        self.content = content
    }
}

class HomeViewController: UIViewController {

    @IBOutlet weak var statusCollectionView: UICollectionView!

    let data = [
        Task(title: "Ready", content: ["An trom xe", "Cuop tiem vang", "Bat coc"]),
        Task(title: "Accept", content: []),
        Task(title: "Finish", content: [])
    ]
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        
        statusCollectionView.register(UINib(nibName: "OptionCell", bundle: nil), forCellWithReuseIdentifier: "cell")

    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = statusCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! OptionCell
        cell.backgroundColor = .white
        cell.setupValue(task: data[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: statusCollectionView.frame.width - 100, height: statusCollectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 30, bottom: 0, right: 30)
    }

}

