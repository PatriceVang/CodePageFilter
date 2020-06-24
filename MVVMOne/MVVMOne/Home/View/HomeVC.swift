//
//  HomeVC.swift
//  MVVMOne
//
//  Created by Apple on 5/29/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit


struct DataModel {
    var isExpand: Bool
    var data: [User]
    var headerTitle: String?
}


class HomeVC: UIViewController {
    let expandBtn: UIButton = {
       let btn = UIButton()
        btn.frame = .init(x: 0, y: 0, width: 40, height: 40)
        btn.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        return btn
    }()
    
    let myTableV: UITableView = {
        let tbV = UITableView()
        tbV.frame = .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 0)
        return tbV
    }()
    
    
    var isExpand: Bool = false {
        didSet {
            if isExpand {
                UIView.animate(withDuration: 0.7, delay: 0, options: .curveEaseOut, animations: {
                    self.myTableV.frame = .init(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
                }) { (Bool) in
                }
        
                UIView.animate(withDuration: 0.7) {
                    self.expandBtn.transform = CGAffineTransform(rotationAngle: .pi)
                }
                
            } else {
                UIView.animate(withDuration: 0.7, delay: 0, options: .curveEaseOut, animations: {
                    self.myTableV.frame = .init(x: 0, y: 0, width: self.view.frame.width, height: 0)
                }) { (Bool) in
                }
                UIView.animate(withDuration: 0.7) {
                    self.expandBtn.transform = CGAffineTransform(rotationAngle: .zero)
                }
            }
        }
    }
    
    var listData = [
        ["1.1", "1.2","1.3"],
        ["2.1", "2.2"],
        ["3,1", "3,2", "3,3", "3.4"]
    ]
    
    var titleHeader =  ["1", "2", "3"]
    
    
//
//    var viewModel: HomeViewModel = HomeViewModel(user: User())
//
//    init(viewModel: HomeViewModel) {
//        self.viewModel = viewModel
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.viewModel.delegate = self
        
        //        NSLayoutConstraint.activate([
        //                   myTableV.topAnchor.constraint(equalTo: self.view.topAnchor),
        //                   myTableV.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
        //                   myTableV.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        //                   myTableV.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        //               ])
        

        
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: expandBtn)

        
        self.view.backgroundColor = .white
        self.view.addSubview(myTableV)
        
       
        myTableV.dataSource = self
        myTableV.delegate = self
        myTableV.register(AppCell.self, forCellReuseIdentifier: "cell")

        
        
        expandBtn.addTarget(self, action: #selector(onTapExpandBtn(_:)), for: .touchUpInside)
        
        
    }
    
    @objc func onTapExpandBtn(_ sender: UIButton) {
        
        isExpand.toggle()

    }
    
    
    @objc func onTapHeaderView() {
        print(123)
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerV = HeaderView(frame: .init(x: 0, y: 0, width: self.myTableV.frame.width, height: 100))
        headerV.backgroundColor = .clear
        headerV.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTapHeaderView)))
        return headerV
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return listData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData[section].count
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titleHeader[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableV.dequeueReusableCell(withIdentifier: "cell") as! AppCell
        cell.textLabel?.text = listData[indexPath.section][indexPath.row]
        return cell
    }
}

extension HomeVC: HomeViewModelDelegate {
    func didSuccess() {
        DispatchQueue.main.async {
            self.myTableV.reloadData()
        }
    }
}
