//
//  TapbarViewController.swift
//  CollectionViewXib
//
//  Created by Apple on 4/2/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class TapbarViewController: UITabBarController {
    //MARK: Create VC
    let albumsVC : UIViewController = {
        let album = UIViewController()
        album.tabBarItem = .init(title: "Albums", image: UIImage(named: "imgAlbums"), tag: 1)
        album.view.backgroundColor = .cyan
        let label = UILabel()
        label.text = "Album"
        label.frame = .init(x: 50, y: 100, width: 100, height: 50)
        album.view.addSubview(label)
        return album
    }()
    let forYouVC : UIViewController = {
        let fy = UIViewController()
        fy.tabBarItem = .init(title: "For you", image: UIImage(named: "imgForyou"), tag: 2)
        fy.view.backgroundColor = .blue
        let label = UILabel()
        label.text = "For you"
        label.frame = .init(x: 50, y: 100, width: 100, height: 50)
        fy.view.addSubview(label)
        return fy
    }()
    let sharingVC : UIViewController = {
        let sha = UIViewController()
        sha.tabBarItem = .init(title: "Sharing", image: UIImage(named: "imgSharing"), tag: 3)
        sha.view.backgroundColor = .systemPink
        let label = UILabel()
        label.text = "Sharing"
        label.frame = .init(x: 50, y: 100, width: 100, height: 50)
        sha.view.addSubview(label)
        return sha
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //change color icon tapber
//        self.tabBar.tintColor = .cyan
        
        let colectionVC = CollectionViewController()
        colectionVC.tabBarItem = UITabBarItem(title: "Photos", image: UIImage(named: "imgPhoto"), tag: 0)
        
        //Add VC
        self.viewControllers = [UINavigationController(rootViewController: colectionVC), albumsVC, forYouVC, sharingVC]
        
    }
}
