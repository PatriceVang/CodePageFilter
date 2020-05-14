//
//  SearchVC.swift
//  ThePartYoutubeApp
//
//  Created by Apple on 5/13/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {    
    @IBOutlet weak var naviBar: UIView!
    @IBOutlet weak var backItemNv: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        customNaviBar()
        
    }
    
    private func customNaviBar() {
        backItemNv.isUserInteractionEnabled = true
        backItemNv.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTapBackItemNv(_:))))
    }
    @objc func onTapBackItemNv(_ ges: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
}
