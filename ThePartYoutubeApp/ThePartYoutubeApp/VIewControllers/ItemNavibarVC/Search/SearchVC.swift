//
//  SearchVC.swift
//  ThePartYoutubeApp
//
//  Created by Apple on 5/13/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class SearchVC: BaseVC, UITextFieldDelegate {
    @IBOutlet weak var searchTf: UITextField!
    @IBOutlet weak var naviBar: UIView!
    @IBOutlet weak var backItemNv: UIImageView!
    @IBOutlet weak var micBtn: UIImageView!
    var textOfTf: String?
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
    }

    @IBAction func searchTf(_ sender: Any) {
        guard let textfield = sender as? UITextField else {return}
        textOfTf = textfield.text
    }
 
    //MARK: Handle tap
    @objc func onTapBackItemNv(_ ges: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.dismiss(animated: true, completion: nil)
        self.delegate?.passText(str: self.textOfTf ?? "")
        return true
    }
    
    
}

protocol SearchVCDelegate: class {
    func passText(str: String)
}
