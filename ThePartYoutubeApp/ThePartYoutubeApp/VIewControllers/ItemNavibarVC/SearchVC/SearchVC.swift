//
//  SearchVC.swift
//  ThePartYoutubeApp
//
//  Created by Apple on 5/13/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class SearchVC: BaseVC {
    @IBOutlet weak var searchTf: UITextField!
    @IBOutlet weak var naviBar: UIView!
    @IBOutlet weak var backItemNv: UIImageView!
    @IBOutlet weak var micBtn: UIImageView!
    weak var delegate: SearchVCDelegate?
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        customElement()
    }
    
    private func customElement() {
        //navibar
        backItemNv.setupTapGesture(view: backItemNv, selector: #selector(onTapBackItemNv(_:)), target: self)
        //textfield
        searchTf.delegate = self
        searchTf.becomeFirstResponder()
        searchTf.returnKeyType = .done
        searchTf.enablesReturnKeyAutomatically = true
    }
 
    //MARK: Handle tap
    @objc func onTapBackItemNv(_ ges: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.dismiss(animated: true, completion: nil)
        self.delegate?.passText(str: textField.text!)
        return true
    }
}

protocol SearchVCDelegate: class {
    func passText(str: String)
}
