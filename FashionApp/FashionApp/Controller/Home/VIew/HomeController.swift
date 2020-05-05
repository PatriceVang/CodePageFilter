//
//  HomeController.swift
//  FashionApp
//
//  Created by Apple on 4/12/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
private let cellID = "cell"
private let footerID = "footer"


class HomeController: UIViewController {
    @IBOutlet weak var myCollectionView: UICollectionView!
    var isLoading = false
    var loadingView: LoadingView?
    let searchBar : UISearchBar = {
        let sb = UISearchBar()
        sb.tintColor = .systemBlue
        sb.searchTextField.backgroundColor = .white
        return sb
    }()
    var presenter: PresenterHomeProtocol
    var listActor = [Actor]()
    var countNew = 0
    var listSearch = [Actor]()
    var isHidenFooter: Bool = false
    var currentPage = 1
    var maxPage: Int = 6
    
    
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
//        self.navigationController?.navigationBar.isHidden = true
        self.myCollectionView.register(UINib(nibName: "MyCollectionCell", bundle: nil), forCellWithReuseIdentifier: cellID)
        
        self.myCollectionView.register(UINib(nibName: "LoadingView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerID)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        myCollectionView.collectionViewLayout = layout
        self.navigationItem.titleView = searchBar
        self.navigationController?.navigationBar.barTintColor = Resource.Color.colorHeader
        searchBar.delegate = self
        getData()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationController?.navigationBar.isHidden = true
    }
    //MARK: API
    func getData() {
        DispatchQueue.global(qos: .utility).async {
            self.presenter.fetchData()
        }
    }
}
    //MARK: Search Bar
extension HomeController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            self.listSearch = listActor
            self.myCollectionView.reloadData()
            return
        } else {
            self.listSearch = self.listActor.filter({ (modelCell) -> Bool in
                return (modelCell.name?.contains(searchText))!
            })
            self.myCollectionView.reloadData()
            searchBar.showsCancelButton = true
        }
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        // When user input text
         searchBar.showsCancelButton = true
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        // when text == nil
        searchBar.text = ""
        searchBar.showsCancelButton = false
        searchBar.endEditing(true)
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
        let nib = DetailController()
        nib.actor = self.listSearch[indexPath.row]
        nib.delegate = self
        self.tabBarController?.navigationController?.pushViewController(nib, animated: true)
    }
    //loadmore
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let indexFinal = listActor.count - 10
        if indexPath.row == indexFinal && !self.isLoading, currentPage + 1 <= maxPage {
            //allow load more
            self.isHidenFooter = false
            self.loadingView?.indicator.isHidden = false
            self.loadingView?.indicator.startAnimating()
            currentPage += 1
            let url = "https://api.themoviedb.org/3/person/popular"
            let param: [String : Any] = ["api_key": "58d10a67ba0f9232e2f1b88e7e13cb1d", "language": "en-US", "page": currentPage ]
            if !self.isLoading {
                self.isLoading = true
                DispatchQueue.global(qos: .utility).async {
                    sleep(2)
                    APICaller.getMethod(url: url, param: param, header: nil, T: JsonTotal.self) { (json, err) in
                        guard let actor = json?.results else {return}
//                        guard let totalPage = json?.total_pages else {return}
                        DispatchQueue.main.async {
//                            self.maxPage = totalPage
                            for item in actor {
                                self.listActor.append(item)
                            }
                            self.listSearch = self.listActor
                            self.myCollectionView.reloadData()
                            self.isLoading = false
                            self.loadingView?.indicator.isHidden = true
                            if self.currentPage == self.maxPage {
                                self.loadingView?.indicator.isHidden = true
                                self.isHidenFooter = true
                            }
                        }
                    }
                }
            }
        }
    }
    //footer
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if self.isHidenFooter {
            return .zero
        } else {
            let x = 3
            let y = x - 1
            let width = (collectionView.bounds.width - (CGFloat(y) * 10))/CGFloat(x)
            return CGSize(width: width, height: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let footer = myCollectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerID, for: indexPath) as? LoadingView
        loadingView = footer
        loadingView?.backgroundColor = .clear
        return footer!
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
    func passDataActorLoadMore(data: [Actor]) {
//        for item in data {
//            listActor.append(item)
//        }
//        self.listSearch = self.listActor
//        self.myCollectionView.reloadData()
//        self.isLoading = false
    }
    func passDataActor(data: [Actor]) {
        for item in data {
            self.listActor.append(item)
        }
        self.listSearch = self.listActor
        self.myCollectionView.reloadData()
    }
}


