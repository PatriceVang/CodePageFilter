//
//  SearchVC.swift
//  MVVMOne
//
//  Created by Apple on 6/3/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    let searchBar: UITextField = {
        let sb = UITextField()
        sb.frame = .init(x: 0, y: 0, width: UIScreen.main.bounds.width - 40, height: 30)
        sb.layer.cornerRadius = 10
        sb.layer.masksToBounds = true
        sb.layer.borderWidth = .zero
        sb.backgroundColor = .lightGray
        return sb
    }()
    @IBOutlet weak var myTableV: UITableView!
//    let refreshControl: UIRefreshControl = {
//        let rf = UIRefreshControl()
//        rf.addTarget(self, action: #selector(onPullToRefresh(_:)), for: .valueChanged)
//        rf.tintColor = .black
//        return rf
//    }()
    
    
        


    var viewModel: SearchViewModel? {
       didSet {
           viewModel?.result?.bindAndFire(observable: { (listUser) in
               if listUser.count > 0 {
                   self.myTableV.reloadData()
               }
           })
       }
    }
    
    
    //DI
    init(factory: Factory) {
        super.init(nibName: nil, bundle: nil)
        setViewModel(factory: factory)

    }

    func setViewModel(factory: Factory) {
        self.viewModel = factory.makeSearchViewModel()
    }
    

//    init(viewModel: SearchViewModel) {
//        super.init(nibName: "SearchVC", bundle: nil)
//        setViewModel(viewModel: viewModel)
//    }
    
    
//    func setViewModel(viewModel: SearchViewModel) {
//        self.viewModel = viewModel
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableV.register(UINib(nibName: "ResultCell", bundle: nil), forCellReuseIdentifier: "cell")
        self.navigationItem.titleView = searchBar
        
        searchBar.delegate = self
        searchBar.returnKeyType = .done
        
        
//        myTableV.addSubview(refreshControl)
        
    }
    
    //MARK: Ontap
    
//    @objc func onPullToRefresh(_ control: UIRefreshControl) {
//        self.viewModel?.fetchData()
//        self.myTableV.reloadData()
//        refreshControl.endRefreshing()
//    }
}

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        viewModel!.inputText?.value = textField.text!
        viewModel?.fetchData()
        return true
    }
}


extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (viewModel?.result?.value.count) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableV.dequeueReusableCell(withIdentifier: "cell") as! ResultCell
        let user = viewModel?.result?.value[indexPath.row]
        cell.setupData(user: user!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.myTableV.frame.width / 2
    }
}
