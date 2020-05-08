//
//  AddController.swift
//  FashionApp
//
//  Created by Apple on 4/29/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
import DropDown

class UtilityController: BaseView {
    @IBOutlet weak var viewCounting: UIView!
    @IBOutlet weak var countingLB: UILabel!
    @IBOutlet weak var resetBtn: UIButton!
    @IBOutlet weak var viewBackgroud: UIView!
    let viewBottomNV: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let menu: DropDown = {
       let mn = DropDown()
        mn.dataSource = ["Machine Learning", "Push Up"]
        let img = [
            "ic_ml",
            "ic_pushup"
        ]
        mn.cellNib = UINib(nibName: "OptionDropdownCell", bundle: nil)
        mn.customCellConfiguration = { index, title, cell in
            guard let cell = cell as? OptionDropdownCell else {return}
            cell.presentImg.image = UIImage(named: img[index])
            if index == img.count - 1 {
                cell.lineView.backgroundColor = .clear
            }
        }
        return mn
    }()
    var count:Int = 0 {
       didSet {
           countingLB!.text = String(count)
       }
    }
    let titleNV: UILabel = {
       let lb = UILabel()
        lb.text = "PushUp"
        lb.font = UIFont.boldSystemFont(ofSize: 30)
        lb.textColor = .systemBlue
        return lb
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewBackgroud.backgroundColor = UIColor(patternImage: Resource.Image.imgBgUtitily!)
        resetBtn.layer.cornerRadius = 7
        resetBtn.clipsToBounds = true
        resetBtn.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        resetBtn.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        resetBtn.layer.shadowOpacity = 1
        resetBtn.layer.shadowRadius = 0
        resetBtn.layer.masksToBounds = false
        self.setupUIView(color: Resource.Color.colorTapbar, radius: viewCounting.frame.height / 2, view: viewCounting)
        
        // register for proximity state changes
        NotificationCenter.default.addObserver(self, selector: #selector(proximityChanged(notification:)), name: NSNotification.Name(rawValue: "UIDeviceProximityStateDidChangeNotification"), object: nil)
        // enable proximity monitoring
        UIDevice.current.isProximityMonitoringEnabled = true
        
        // view to define position of dropdown
        self.view.addSubview(viewBottomNV)
        viewBottomNV.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        viewBottomNV.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        viewBottomNV.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        viewBottomNV.heightAnchor.constraint(equalToConstant: 1).isActive = true
            
       
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.tabBarController?.navigationItem.titleView = titleNV
        self.tabBarController?.navigationItem.hidesBackButton = true
        self.tabBarController?.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: #selector(onTapLineBtn))
        //dropdown
        menu.anchorView = self.viewBottomNV
        menu.selectionAction = { index, title in
            print(index)
        }
        DropDown.appearance().textColor = UIColor.black
        DropDown.appearance().textFont = UIFont.systemFont(ofSize: 20)
        DropDown.appearance().cornerRadius = 10
    }
    @objc func onTapLineBtn() {
        menu.show()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func onTapResetBtn(_ sender: Any) {
        count = 0
    }
    @objc func proximityChanged(notification: NSNotification) {
           // if proximity is currently down, increment count
        if (UIDevice.current.proximityState) {
               count += 1
        }
    }
}
