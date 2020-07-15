//
//  TitleAndInput.swift
//  ProfileReSwift
//
//  Created by Apple on 7/14/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

protocol TitleAndInputDelegate: class {
    func onTapTitleAndInput(text: String, textField: UITextField)
}

class TitleAndInput: UIView {

    weak var delegate: TitleAndInputDelegate?
    
    var titleLable: UILabel!
    var inputTextField: UITextField!
    
    lazy var stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(textStyle: TextFiledStyle, title: String) {
        self.init(frame: .zero)
      
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        switch textStyle {
        case .confirmPassword:
            titleLable = UILabel(frame: .init(x: 0, y: 0, width: stackView.frame.width, height: 20))
            titleLable.text = title
            inputTextField = MyTextField(style: textStyle)
        case .changePassword:
            titleLable = UILabel(frame: .init(x: 0, y: 0, width: stackView.frame.width, height: 20))
            titleLable.text = title
            inputTextField = MyTextField(style: textStyle)
        }
        stackView.addArrangedSubview(titleLable)
        stackView.addArrangedSubview(inputTextField)
        inputTextField.delegate = self
    }
}
extension TitleAndInput: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        delegate?.onTapTitleAndInput(text: textField.text!, textField: textField)

        return true
    }
}
