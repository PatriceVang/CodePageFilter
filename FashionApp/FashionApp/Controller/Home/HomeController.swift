//
//  HomeController.swift
//  FashionApp
//
//  Created by Apple on 4/12/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
private let cellID = "cell"

class HomeController: UIViewController {
    @IBOutlet weak var myCollectionView: UICollectionView!
    let searchBar : UISearchBar = {
        let sb = UISearchBar()
        sb.tintColor = .gray
        sb.searchTextField.backgroundColor = .white
        return sb
    }()
    var presenter: PresenterHomeProtocol
    var listModel = [ModelCell]()
    var countNew = 0
    var listSearch = [ModelCell]()
    init() {
        presenter = PresenterHome()
        super.init(nibName: "HomeController", bundle: nil)
        presenter.view = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //Colletion View
        self.myCollectionView.register(UINib(nibName: "MyCollectionCell", bundle: nil), forCellWithReuseIdentifier: cellID)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        myCollectionView.collectionViewLayout = layout
        self.navigationItem.titleView = searchBar
        self.navigationController?.navigationBar.barTintColor = Resource.Color.colorHeader
        searchBar.delegate = self
        getData()
        
    }
    //MARK: API
    func getData() {
//        guard let url = URL(string: "https://api.themoviedb.org/3/person/popular?api_key=58d10a67ba0f9232e2f1b88e7e13cb1d&language=en-US&page=1") else {return}
//        self.presenter.fetchData(url: url)
        let url = "https://api.themoviedb.org/3/person/popular"
        
        self.presenter.fetchData(url: url, param: ["api_key": "58d10a67ba0f9232e2f1b88e7e13cb1d", "language": "en-US", "page": "1"], header: nil)
    }
}
    //MARK: Search Bar
extension HomeController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        self.presenter.onChangeSearchBar(searchText: searchText, collectionView: self.myCollectionView, listData: self.listModel, listSreach: self.listSearch)
        
        if searchText.isEmpty {
            self.listSearch = listModel
            self.myCollectionView.reloadData()
            return
        } else {
            self.listSearch = self.listModel.filter({ (modelCell) -> Bool in
                return (modelCell.actor?.name?.contains(searchText))!
            })
            self.myCollectionView.reloadData()
        }
    }
}
//MARK: Collection
extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    //Cell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listSearch.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? MyCollectionCell
        let text = self.listSearch[indexPath.row]
        cell?.model = text
        return cell!
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let x = 3
        let y = x - 1
        let width = (collectionView.bounds.width - (CGFloat(y) * 10))/CGFloat(x)
        return CGSize(width: width , height: (collectionView.bounds.height - 40)/3)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 10, left: 10, bottom: 10, right: 10)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nib = DetailController(nibName: "DetailController", bundle: nil)
        nib.actor = self.listSearch[indexPath.row].actor
        nib.delegate = self
        self.tabBarController?.navigationController?.pushViewController(nib, animated: true)
    }
}

extension HomeController: DetailControllerDelegate {
    func goToCart() {
        let vc = self.tabBarController?.viewControllers
        self.tabBarController?.selectedViewController = vc?[2]
    }
    func passData(dataCart: ModelCart) {
        let vc = self.tabBarController?.viewControllers
        if let cartVC = vc?[2] as? CartController {
            cartVC.listData.append(dataCart)
        }
    }
}

extension HomeController: PresenterHomeDelegate {
    func passData(data: [Actor]) {
        for item in data {
            self.listModel.append(.init(actor: item))
        }
        self.listSearch = self.listModel
        self.myCollectionView.reloadData()
    }
}


