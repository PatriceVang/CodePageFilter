//
//  AuthorVC.swift
//  ThePartYoutubeApp
//
//  Created by Apple on 5/13/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

private let menuCellId = "menuCell"

class AuthorVC: BaseView {
    @IBOutlet weak var menuCollectionV: UICollectionView!
    @IBOutlet weak var heightMenuBar: NSLayoutConstraint!
    var incrementIndex = 0
    let decrementIndex = 0
    
    let titleNavi: UILabel = {
       let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let pageVC =  UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    let controllers = [HomeAuthorVC(), VideosAuthorVC(), PlaylistsAuthorVC(), CommunityAuthorVC(), ChannelsAuthorVC(), AboutAuthorVC()]
    //MARK: Proberties
    let listItemsMenu = [
          ItemsMenu(items: "HOME"),
          ItemsMenu(items: "VIDEOS"),
          ItemsMenu(items: "PLAYLISTS"),
          ItemsMenu(items: "COMMUNITY"),
          ItemsMenu(items: "CHANGNELS"),
          ItemsMenu(items: "ABOUT"),
      ]
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        customMenuBar()
        addItemsNaviBar()
        addChildView()
   
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.tabBarController?.navigationController?.navigationBar.isHidden = true
    }
    //MARK: Custom MenuBar
    private func customMenuBar() {
        menuCollectionV.backgroundColor = .systemBlue
        menuCollectionV.register(UINib(nibName: "MenuCell", bundle: nil), forCellWithReuseIdentifier: menuCellId)
    }
    
    //MARK: Items Navibar
    private func addItemsNaviBar() {
        self.view.addSubview(titleNavi)
        self.setupLabelFor(lable: titleNavi, text: "Listen to music", textColor: .white, font: .systemFont(ofSize: 25))
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationItem.leftBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .plain, target: self, action: #selector(onTapBackItemNaviBar)),
            UIBarButtonItem(customView: titleNavi)
        ]
    }
    
    //MARK: ChildView
    private func addChildView() {
        pageVC.dataSource = self
        pageVC.delegate = self
        view.addSubview(pageVC.view)
        pageVC.setViewControllers([controllers.first!], direction: .forward, animated: true, completion: nil)
       
        let pageView = pageVC.view!
        pageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageView.topAnchor.constraint(equalTo: self.menuCollectionV.bottomAnchor),
            pageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            pageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            pageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor , constant: -60)
        ])
        self.addChild(pageVC)

    }
    //MARK: Handle on Tap
    @objc private func onTapBackItemNaviBar() {
        self.navigationController?.popViewController(animated: true)
    }
}
//MARK: Menu CollectionView
extension AuthorVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    //MARK: Menu Cell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listItemsMenu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = menuCollectionV.dequeueReusableCell(withReuseIdentifier: menuCellId, for: indexPath) as? MenuCell
        let items = listItemsMenu[indexPath.row]
        cell?.itemsMenu = items
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel(frame: CGRect.zero)
        label.text = listItemsMenu[indexPath.row].items
        label.sizeToFit()
        return CGSize(width: label.frame.width, height: menuCollectionV.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        pageVC.setViewControllers([controllers[indexPath.row]], direction: .forward, animated: true, completion: nil)
    }

}

//MARK: ChildView
extension AuthorVC: UIPageViewControllerDelegate, UIPageViewControllerDataSource, UIGestureRecognizerDelegate {
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return controllers.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if !completed {return}
        let currentIndex = controllers.firstIndex(of: (pageViewController.viewControllers?.first)!)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = controllers.firstIndex(of: viewController) ?? 0
        if index > 0 {
            return controllers[index - 1]
        } else {
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = controllers.firstIndex(of: viewController) ?? 0
        if index < controllers.count - 1 {
            return controllers[index + 1]
        } else {
            return nil
        }
    }
}
