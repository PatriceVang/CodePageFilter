//
//  TabbarVC.swift
//  ThePartYoutubeApp
//
//  Created by Apple on 5/12/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class TabbarVC: UITabBarController {
    var connectDeviceV =  UIView()
    var alphaV = UIView()
    let optionView = ListOptionView(types: [.airlay, .learnmore, .linkTV, .cancel])
    let homeVC : HomeVC = {
        let home = HomeVC()
        home.tabBarItem = .init(title: Resource.Text.home, image: Resource.Image.homeImg, tag: 0)
        return home
    }()
    let exploreVC : ExploreVC = {
        let explore = ExploreVC()
        explore.tabBarItem = .init(title: Resource.Text.explore, image: Resource.Image.exploreImg, tag: 1)
        return explore
    }()
    let subscriptionVC : SubscriptionVC = {
        let subs = SubscriptionVC()
        subs.tabBarItem = .init(title: Resource.Text.subscrip, image: Resource.Image.subscriptionImg, tag: 2)
        return subs
    }()
    let inboxVC : InboxVC = {
        let inbox = InboxVC()
        inbox.tabBarItem = .init(title: Resource.Text.inbox , image: Resource.Image.inboxImg, tag: 3)
        return inbox
    }()
    let libVC : LibararyVC = {
        let lib = LibararyVC()
        lib.tabBarItem = .init(title: Resource.Text.lib, image: Resource.Image.libImg, tag: 4)
        return lib
    }()
    //MARK: Items ConnectView
    let connectLb: UILabel = {
       let lb = UILabel()
        lb.alpha = 0.8
        lb.textColor = .gray
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = Resource.Text.conectToDevice
        return lb
    }()
    let stackViewConnectDeviceV: UIStackView = {
        let stV = UIStackView()
        stV.axis = .vertical
        stV.distribution = .fill
        stV.spacing = 10
        stV.isLayoutMarginsRelativeArrangement = true
        stV.layoutMargins = .init(top: 16, left: 20, bottom: 16, right: 20)
        stV.translatesAutoresizingMaskIntoConstraints = false
        return stV
    }()
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.tintColor = Resource.Color.itemTabbarColor
        self.viewControllers = ([UINavigationController(rootViewController: homeVC), exploreVC, subscriptionVC, inboxVC, libVC])
        
        addItemsNavibar()
        addItemConnectV()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.tintColor = .gray
    }
    
    //MARK: Custom Element
    private func addItemsNavibar() {
        let youtubeImg = UIImageView()
        youtubeImg.image = Resource.Image.youtubeImg
        youtubeImg.frame = .init(x: 0, y: 0, width: 30, height: 30)
        
        let youtubeLb = UILabel()
        youtubeLb.text = Resource.Text.youtube
        youtubeLb.font = .boldSystemFont(ofSize: 25)
        youtubeLb.textColor = .black
        
        let iconYoutubeNV = UIBarButtonItem()
        iconYoutubeNV.customView = youtubeImg
        let titleYoutubeNV = UIBarButtonItem()
        titleYoutubeNV.customView = youtubeLb
    
        self.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: Resource.Image.userImg, style: .plain, target: self, action: #selector(onTapUser)),
            UIBarButtonItem(image: Resource.Image.searchImg, style: .plain, target: self, action: #selector(onTapSearch)),
            UIBarButtonItem(image: Resource.Image.cameraImg, style: .plain, target: self, action: #selector(onTapCamera)),
            UIBarButtonItem(image: Resource.Image.connectImg, style: .plain, target: self, action: #selector(onTapConnect(sender:))),
        ]
        self.navigationItem.leftBarButtonItems = [iconYoutubeNV, titleYoutubeNV]
    }

    private func addItemConnectV() {
        connectDeviceV.addSubview(stackViewConnectDeviceV)
        NSLayoutConstraint.activate([
            stackViewConnectDeviceV.topAnchor.constraint(equalTo: self.connectDeviceV.topAnchor),
            stackViewConnectDeviceV.leadingAnchor.constraint(equalTo: self.connectDeviceV.leadingAnchor, constant: 0),
            stackViewConnectDeviceV.trailingAnchor.constraint(equalTo: self.connectDeviceV.trailingAnchor),
            stackViewConnectDeviceV.bottomAnchor.constraint(equalTo: self.connectDeviceV.bottomAnchor)
        ])
        
        stackViewConnectDeviceV.addArrangedSubview(connectLb)
        stackViewConnectDeviceV.addArrangedSubview(optionView)
        self.optionView.delegate = self
    }
 
    //MARK: Interaction Items Navibar
    @objc func onTapConnect(sender: UIButton) {
        self.view.addSubview(alphaV)
        alphaV.backgroundColor = .black
        alphaV.frame = .init(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - self.view.frame.height / 3)
        alphaV.alpha = 0.4
        alphaV.setupTapGesture(view: alphaV, selector: #selector(onTapDismissConnectView(sender:)), target: self)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.view.addSubview(self.connectDeviceV)
            self.connectDeviceV.backgroundColor = .white
            self.connectDeviceV.translatesAutoresizingMaskIntoConstraints = false
            self.connectDeviceV.center.y -= 50
            NSLayoutConstraint.activate([
                self.connectDeviceV.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                self.connectDeviceV.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                self.connectDeviceV.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                self.connectDeviceV.heightAnchor.constraint(equalToConstant: self.view.frame.height / 3),
                self.connectDeviceV.widthAnchor.constraint(equalToConstant: self.view.frame.width)
            ])
            
        }) { (Bool) in
            
        }
    }
    @objc private func onTapCamera() {
        print("camera")
    }
    @objc private func onTapSearch() {
        let searchVC = SearchVC()
        searchVC.modalPresentationStyle = .fullScreen
        self.present(searchVC, animated: false, completion: nil)
        
    }
    @objc private func onTapUser() {
        self.navigationController?.pushViewController(AccountVC(), animated: true)
    }
    
    //MARK: Interaction with ConnectView
    @objc private func onTapDismissConnectView(sender: UIButton) {
        print("dismiss")
        alphaV.removeFromSuperview()
        connectDeviceV.removeFromSuperview()
    }
}

extension TabbarVC: ListOptionViewDelegate {
    func onTapOptionType(type: OptionType) {
        
    }
    
    
}
