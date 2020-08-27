//
//  VerifyOTP.swift
//  testDelegate
//
//  Created by Apple on 8/20/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation


//
//  VerifyPhoneViewController.swift
//  MkzApp
//
//  Created by Apple on 8/6/20.
//  Copyright © 2020 Vinova. All rights reserved.
//

import UIKit

class VerifyPhoneViewController: UIViewController {
    @IBOutlet weak var errorLable: UILabel!
    @IBOutlet var textFields: [NYPTextField]!
    @IBOutlet var arrView: [UIView]!
    @IBOutlet weak var timerInputTextLabel: UILabel!
    
//    lazy var titleLable = NYPLabel(textColor: .white, font: .addSkillButton(), text: "Verify Phone")
    var countdown = 60
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupEvent()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        timer = nil
    }
    
    private func setupUI() {
        // Setup Navigation bar
        
//        self.navigationItem.titleView = titleLable
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "arrow_back"), style: .done, target: self, action: #selector(onPressArrowBack))
        
        for item in arrView {
            item.layer.borderWidth = 1
            item.layer.borderColor = #colorLiteral(red: 0.7097254395, green: 0.7098491788, blue: 0.7097176313, alpha: 1)
        }
        
        // TextField
        textFields[0].becomeFirstResponder()
        textFields.forEach{
            $0.backspaceTextFieldDelegate = self
            $0.addTarget(self, action: #selector(onChangeTextOfTextField(_:)), for: .editingChanged)
            $0.keyboardType = .decimalPad
            $0.tintColor = .clear
        }
    }
    
    private func setupEvent() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(observableInputOTP), userInfo: nil, repeats: true)
    }
    
    
    //MARK: Handle Event
    
    @objc func observableInputOTP() {
        if countdown == 0 {
            timer!.invalidate()
            timer = nil
        }
        timerInputTextLabel.text = "Didnt recieve? Resend (\(countdown)s)"
        countdown -= 1
        
    }
    
    @objc func onChangeTextOfTextField(_ sender: NYPTextField) {
        guard let text = sender.text else {return}
        guard let index = textFields.firstIndex(of: sender) else {return}
        if text.count >= 1 {
            if index < 4 {
                textFields[index + 1].becomeFirstResponder()
            }
        }
    }
    @objc func onPressArrowBack() {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK:-- UITextFiledDelegate

extension VerifyPhoneViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let index = textFields.firstIndex(of: textField as! NYPTextField) else {return false}
        let maxLenght = 1
        let currentString = textFields[index].text! as NSString
        let newString = currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLenght
    }
}


extension VerifyPhoneViewController: BackspaceTextFieldDelegate {
    func textFieldDidEnterBackspace(_ textField: NYPTextField) {
        guard let index = textFields.firstIndex(of: textField) else {return}
        if index > 0 {
            textFields[index].text = nil
            textFields[index - 1].becomeFirstResponder()
        } else {
            return
        }
    }
}


class NYPTextField: UITextField {
    
    weak var backspaceTextFieldDelegate: BackspaceTextFieldDelegate?

    override func deleteBackward() {
//        if text?.isEmpty ?? false {
//            backspaceTextFieldDelegate?.textFieldDidEnterBackspace(self)
//        }
        backspaceTextFieldDelegate?.textFieldDidEnterBackspace(self)

        super.deleteBackward()
    }
}

protocol BackspaceTextFieldDelegate: class {
    func textFieldDidEnterBackspace(_ textField: NYPTextField)
}
