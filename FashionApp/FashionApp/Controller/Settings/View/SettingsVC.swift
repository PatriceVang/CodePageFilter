
//  SettingsVC.swift
//  FashionApp
//
//  Created by Apple on 5/8/20.
//  Copyright © 2020 vinova. All rights reserved.


import UIKit
import LocalAuthentication
private let cellId = "cell"

class SettingsVC: UIViewController {
    let gradient = CAGradientLayer()
    let headerV: UIView = {
       let view = UIView()
        let width = UIScreen.main.bounds.width
        view.frame = .init(x: 0, y: 0, width: width, height: width / 4)
        return view
    }()
    let leftBackBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(Resource.Image.imgChevronLeft, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    let settingsLb: UILabel = {
       let lb = UILabel()
        lb.text = "Settings"
        lb.font = .systemFont(ofSize: 22)
        lb.textColor = .white
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let myTableView: UITableView = {
       let tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        return tb
    }()
    var saveStateOFSwift: Bool!
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        customElement()
        myTableView.register(UINib(nibName: "MySettingsCell", bundle: nil), forCellReuseIdentifier: cellId)
        myTableView.dataSource = self
        myTableView.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    //MARK: Custom element
    private func customElement() {
        //header View
        self.view.addSubview(headerV)
        // Gradient
        let leftColor = Resource.Color.colorTapbar
        let rightColor = Resource.Color.colorHeader
        gradient.colors = [leftColor.cgColor, rightColor.cgColor]
        gradient.locations = [0, 1]
        gradient.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        headerV.layer.addSublayer(gradient)
        gradient.frame = headerV.bounds
        
        // left Btn in header
        self.headerV.addSubview(leftBackBtn)
        leftBackBtn.leadingAnchor.constraint(equalTo: headerV.leadingAnchor, constant: 5).isActive = true
        leftBackBtn.bottomAnchor.constraint(equalTo: headerV.bottomAnchor, constant: -5).isActive = true
        leftBackBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        leftBackBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        leftBackBtn.addTarget(self, action: #selector(onTapBackBtn), for: .touchUpInside)
        //Lb settings
        self.headerV.addSubview(settingsLb)
        settingsLb.leadingAnchor.constraint(equalTo: leftBackBtn.trailingAnchor, constant: 2).isActive = true
        settingsLb.bottomAnchor.constraint(equalTo: headerV.bottomAnchor, constant: -5).isActive = true
        settingsLb.heightAnchor.constraint(equalToConstant: 30).isActive = true
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(onTapBackBtn))
        settingsLb.isUserInteractionEnabled = true
        settingsLb.addGestureRecognizer(tapGes)
        
        //Tabel View
        self.view.addSubview(myTableView)
        myTableView.topAnchor.constraint(equalTo: headerV.bottomAnchor, constant: 0).isActive = true
        myTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        myTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        myTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }
    //MARK: On tap Btn
    @objc func onTapBackBtn() {
         self.navigationController?.popViewController(animated: true)
    }
}

extension SettingsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: cellId) as? MySettingsCell
        cell?.delegate = self
        return cell!
    }
}

extension SettingsVC: MySettingCellDelegate {
    func onSwitchChange(isOn: Bool) {
        var curSetting: SettingInApp!
        if let setting = UserDefaultHelper.shared.setting {
            curSetting = setting
            curSetting.isActiveTouchId = isOn
        } else {
            curSetting = SettingInApp(isActiveTouchId: false)
        }
        UserDefaultHelper.shared.setting = curSetting
    }
}

