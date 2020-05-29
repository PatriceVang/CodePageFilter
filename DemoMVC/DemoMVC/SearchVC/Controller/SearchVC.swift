//
//  SearchVC.swift
//  DemoMVC
//
//  Created by Apple on 5/28/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
import ObjectMapper


class SearchVC: UIViewController {
    
    let searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.searchTextField.backgroundColor = .white
        return sb
    }()
    
    let myTableV: UITableView = {
       let tbV = UITableView()
        tbV.translatesAutoresizingMaskIntoConstraints = false
        return tbV
    }()
    
    var listUser = [User]()
    var searchResultUser = [User]()
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.titleView = searchBar
        searchBar.delegate = self
        self.navigationController?.navigationBar.barTintColor = Resource.Color.colorHeader
        self.view.addSubview(myTableV)
        NSLayoutConstraint.activate([
            myTableV.topAnchor.constraint(equalTo: self.view.topAnchor),
            myTableV.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            myTableV.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            myTableV.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        myTableV.register(ResultCell.self, forCellReuseIdentifier: "cell")
        myTableV.dataSource = self
        myTableV.delegate = self
        myTableV.estimatedRowHeight = 100
        myTableV.rowHeight = UITableView.automaticDimension
        
        fetchData()
    }
    
    func fetchData() {
        let url = "https://jsonplaceholder.typicode.com/users"
        ApiCaller.getMethod(url: url, header: nil, params: nil) { (data, error) in
            guard let data = data else {return}
            if error != nil {
                print(error?.message as Any)
            } else {
                guard let data = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) else {return}
                let user = Mapper<User>().mapArray(JSONArray: data as! [[String : Any]])
                DispatchQueue.main.async {
                    self.listUser = user
                    self.searchResultUser = self.listUser
                    self.myTableV.reloadData()
                }
            }
        }
    }
}

extension SearchVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {

            self.searchResultUser = self.listUser.filter { ($0.name?.contains(searchText))!}
            self.myTableV.reloadData()
        } else {
            self.searchResultUser = self.listUser
            self.myTableV.reloadData()
        }
    }
    
}


extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResultUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableV.dequeueReusableCell(withIdentifier: "cell") as? ResultCell
        let user = searchResultUser[indexPath.row]
        cell?.user = user
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailVC()
        detailVC.user = searchResultUser[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}



