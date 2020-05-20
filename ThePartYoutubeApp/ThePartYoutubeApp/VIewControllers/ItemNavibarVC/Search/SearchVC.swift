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
    @IBOutlet weak var micBtn: UIImageView!
    var textOfTf: String?
    weak var delegate: SearchVCDelegate?
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        customNaviBar()
        
    }

  
    
    @IBAction func searchTf(_ sender: Any) {
        guard let textfield = sender as? UITextField else {return}
        textOfTf = textfield.text
    }
    
    private func customNaviBar() {
        backItemNv.isUserInteractionEnabled = true
        backItemNv.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTapBackItemNv(_:))))
        micBtn.setupTapGesture(view: micBtn, selector: #selector(onTapMicBtn), target: self)
        
    }
    
    //MARK: Handle tap
    @objc func onTapBackItemNv(_ ges: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    
  
    @objc func onTapMicBtn() {
        self.delegate?.passText(str: textOfTf!)
        self.dismiss(animated: true, completion: nil)
    }
}

protocol SearchVCDelegate: class {
    func passText(str: String)
}
