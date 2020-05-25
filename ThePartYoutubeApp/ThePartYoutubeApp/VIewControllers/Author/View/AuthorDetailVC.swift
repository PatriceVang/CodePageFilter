//
//  AuthorDetailVC.swift
//  ThePartYoutubeApp
//
//  Created by Apple on 5/18/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class AuthorDetailVC: ButtonBarPagerTabStripViewController {
    var titleBackNv = ""
    //MARK: Life cycle
    override func viewDidLoad() {
        customMenuBar()
        super.viewDidLoad()
        customNaviBar()
    }
    private func customNaviBar() {
        self.tabBarController?.navigationController?.navigationBar.isHidden = true
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.leftBarButtonItems = [
           UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .plain, target: self, action: #selector(onTapTitleBackButtonNv)),
           UIBarButtonItem(title: titleBackNv, style: .plain, target: self, action: #selector(onTapTitleBackButtonNv))
            
        ]
        self.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: Resource.Image.menuVerticalImg, style: .plain, target: self, action: nil),
            UIBarButtonItem(image: Resource.Image.searchImg, style: .plain, target: self, action: nil),
            UIBarButtonItem(image: Resource.Image.connectImg, style: .plain, target: self, action: nil)
        ]
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.barTintColor = Resource.Color.itemTabbarColor
        
    }
    
    private func customMenuBar() {
        // change selected bar color
        // cell
        settings.style.buttonBarBackgroundColor = Resource.Color.itemTabbarColor
        settings.style.buttonBarItemTitleColor = .black
        // backgroud collection
        settings.style.buttonBarItemBackgroundColor = Resource.Color.itemTabbarColor
        settings.style.buttonBarLeftContentInset = 30
        settings.style.buttonBarRightContentInset = 30
        //lineMark
        settings.style.selectedBarBackgroundColor = .white
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 17)
        settings.style.selectedBarHeight = 2.5
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
        guard changeCurrentIndex == true else { return }
        oldCell?.label.textColor = .white
            newCell?.label.textColor = .white
        }
    }
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let childHome = HomeAuthorVC()
        let childVideos = VideosAuthorVC()
        let childPlaylist = PlaylistsAuthorVC()
        let childCom = CommunityAuthorVC()
        let childChannels = ChannelsAuthorVC()
        let childAbout = AboutAuthorVC()
        return [childHome, childVideos, childPlaylist, childCom, childChannels, childAbout]
    }
    
    //MARK: Handle Tap
   
    @objc func onTapTitleBackButtonNv() {
       navigationController?.popViewController(animated: true)
    }
}
