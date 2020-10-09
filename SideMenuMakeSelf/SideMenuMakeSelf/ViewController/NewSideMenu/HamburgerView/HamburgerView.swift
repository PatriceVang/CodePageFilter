//
//  HamburgerView.swift
//  SideMenuMakeSelf
//
//  Created by Apple on 10/9/20.
//

import Foundation
import UIKit

class ColorWarning {
    static let clear = #colorLiteral(red: 0.6156862745, green: 0.8274509804, blue: 0.1098039216, alpha: 1)
    static let warning = #colorLiteral(red: 0.9960784314, green: 0.5921568627, blue: 0, alpha: 1)
    static let redAlert = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
    static let unknown: UIColor = .white
}

class HamburgerView: BaseViewXib {

    @IBOutlet weak var mainStV: UIStackView!
    weak var delegate: HamburgerViewDelegate?

    override func initView() {

        //Set first element as current selected
        if let firstLabel = mainStV.arrangedSubviews[0] as? UILabel {
            firstLabel.textColor = ColorWarning.clear
        }

        //Set tap gesture for each label
        mainStV.arrangedSubviews.forEach { (view) in
            if let label = view as? UILabel {
                label.isUserInteractionEnabled = true
                let tapGes = UITapGestureRecognizer(target: self, action: #selector(tapLabel(_:)))
                label.addGestureRecognizer(tapGes)
            }
        }
    }
    func setSelected(section: HamburgerSection) {
        mainStV.arrangedSubviews.forEach { (view) in
            if let label = view as? UILabel {
                label.textColor = #colorLiteral(red: 0.4078176022, green: 0.407827884, blue: 0.4078223705, alpha: 1)
            }
        }

        if let label = mainStV.arrangedSubviews[section.rawValue] as? UILabel {
            label.textColor = ColorWarning.clear
        }
    }

    //MARK: Selector function
    @objc func tapLabel(_ sender: UITapGestureRecognizer){
        guard let labelTapped = sender.view as? UILabel else { return }
        if let index = mainStV.arrangedSubviews.firstIndex(of: labelTapped) {
            var aimVC: UIViewController?
            let section = HamburgerSection.indexToSection(index: index)
            switch section {
            case .Home:
                aimVC = HomeViewController()
            case .Event:
                aimVC = EventViewController()
            case .Profile:
                aimVC = ProfileViewController()
            case .unknow:
                break
            }
            if let _vc = aimVC {
                delegate?.navToViewController(vc: _vc)
            }
        }
    }
}

enum HamburgerSection: Int {
    typealias RawValue = Int

    case Home, Event, Profile, unknow

    static func indexToSection(index: Int) -> HamburgerSection {
        switch index {
        case 0:
            return .Home
        case 1:
            return .Event
        case 2:
            return .Profile
        default:
            return .unknow
        }
    }
}

protocol HamburgerViewDelegate: class {
    func navToViewController(vc: UIViewController)
}

