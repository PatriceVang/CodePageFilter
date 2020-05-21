//
//  SearchResultVC.swift
//  ThePartYoutubeApp
//
//  Created by Apple on 5/20/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

private let cellId = "cell"

class SearchResultVC: UIViewController {
    @IBOutlet weak var myResultTableV: UITableView!
    let searchBar: UISearchBar = {
       let sb = UISearchBar()
        return sb
    }()
    var listArticles = [Articles]()
    var listNewArticle = [Articles]()
    var presenter: PresenterSearchResultProtocol!
    var textFromSeachVC = ""
    var textSearchBar = ""
    //MARK: Life cycle
    init() {
        presenter = Presenter()
        super.init(nibName: "SearchResultVC", bundle: nil)
        presenter.view = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myResultTableV.register(UINib(nibName: "ResultCell", bundle: nil), forCellReuseIdentifier: cellId)
        //call api
        if textFromSeachVC == "" {
            return
        }
       
        self.presenter.fetchDataSearchResult(text: textFromSeachVC)
        
        //searchbar
        searchBar.delegate = self
        searchBar.text = textFromSeachVC
        searchBar.returnKeyType = .done
        customNaviBar()
    }
    private func customNaviBar() {
        self.navigationItem.leftBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .plain, target: self, action: #selector(onTapBackBtnNV)),
        ]
        self.navigationItem.titleView = searchBar
        self.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: Resource.Image.connectImg, style: .plain, target: self, action: #selector(onTapConnectBtnNv))
        ]
    }
    @objc func onTapBackBtnNV() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func onTapConnectBtnNv() {
        print("connect")
    }
}

extension SearchResultVC: UISearchBarDelegate {
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        self.textSearchBar = searchText
//        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(callApi), object: nil)
//        self.perform(#selector(callApi), with: nil, afterDelay: 1)
//    }
//    @objc func callApi() {
//        self.presenter.fetchDataSearchResult(text: textSearchBar == "" ? textFromSeachVC : textSearchBar)
//    }
    
//    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
//        self.presenter.fetchDataSearchResult(text: textSearchBar == "" ? textFromSeachVC : textSearchBar)
//        return true
//    }
}

extension SearchResultVC: UITableViewDataSource, UITableViewDelegate {
    //cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArticles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myResultTableV.dequeueReusableCell(withIdentifier: cellId) as? ResultCell
        let articles = listArticles[indexPath.row]
        cell?.articles = articles
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return myResultTableV.frame.width / 3.5
    }
}


extension SearchResultVC: PresenterSearchResultDelegate {
    func passDataSearchResult(data: [Articles]) {
        self.listArticles = data
        self.myResultTableV.reloadData()
    }
}

