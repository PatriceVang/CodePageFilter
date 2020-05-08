//
//  MySettingsCell.swift
//  FashionApp
//
//  Created by Apple on 5/8/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
import LocalAuthentication

class MySettingsCell: UITableViewCell {
    @IBOutlet weak var onTouchId: UISwitch!
    weak var delegate: MySettingCellDelegate?
    var stateOfSwith: SettingInApp?
    override func awakeFromNib() {
        super.awakeFromNib()
        onTouchId.addTarget(self, action: #selector(onSwitchChanged(_:)), for: .valueChanged)
        guard let state = UserDefaultHelper.shared.setting?.isActiveTouchId else {return}
        onTouchId.isOn = state
    }
    @objc func onSwitchChanged(_ sender: UISwitch) {
        delegate?.onSwitchChange(isOn: sender.isOn)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
protocol MySettingCellDelegate: class {
    func onSwitchChange(isOn: Bool)
}
