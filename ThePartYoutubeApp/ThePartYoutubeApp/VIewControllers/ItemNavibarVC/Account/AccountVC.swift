//
//  AccountVC.swift
//  ThePartYoutubeApp
//
//  Created by Apple on 5/13/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class AccountVC: UIViewController {
    let accountNv: UIBarButtonItem = {
        let account = UIBarButtonItem()
        let lb = UILabel()
        lb.text = Resource.Text.account
        lb.font = .systemFont(ofSize: 25)
        lb.textColor = .gray
        account.customView = lb
        return account
    }()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        customNaviBar()
       
    }
    
    private func customNaviBar() {
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationItem.leftBarButtonItems = [
            UIBarButtonItem(image: Resource.Image.deleteImg, style: .plain, target: self, action: #selector(onTapDeleteImg)),
            accountNv
        ]
    }
    
    //MARK: onTap
    @objc func onTapDeleteImg() {
        self.navigationController?.popViewController(animated: true)
        
        
    }

}
