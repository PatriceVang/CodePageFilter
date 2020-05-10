//
//  HomeController.swift
//  FashionApp
//
//  Created by Apple on 4/12/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
import TTGTagCollectionView

private let cellID = "cell"
private let footerID = "footer"

class HomeController: BaseView {
    @IBOutlet weak var myCollectionView: UICollectionView!
    let tag = TTGTextTagCollectionView()
    var loadingView: LoadingView?
    let searchBar : UISearchBar = {
        let sb = UISearchBar()
        sb.tintColor = .systemBlue
        sb.searchTextField.backgroundColor = .white
        return sb
    }()
    var presenter: PresenterHomeProtocol
    var listActor = [Actor]()
    var listSearch = [Actor]()
    var isHidenFooter: Bool = false
    var currentPage = 1
    var maxPage: Int = 3
    init() {
        presenter = PresenterHome()
        super.init(nibName: "HomeController", bundle: nil)
        presenter.view = self
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //Colletion View
        self.myCollectionView.register(UINib(nibName: "MyCollectionCell", bundle: nil), forCellWithReuseIdentifier: cellID)
        self.myCollectionView.register(UINib(nibName: "LoadingView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerID)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        myCollectionView.collectionViewLayout = layout
        self.navigationItem.titleView = searchBar
        self.navigationController?.navigationBar.barTintColor = Resource.Color.colorHeader
        searchBar.delegate = self
        // fetch data
        self.presenter.fetchData(page: currentPage)
        //Tag
        view.addSubview(tag)
        tag.alignment = .left
        tag.delegate = self
        tag.translatesAutoresizingMaskIntoConstraints = false
        tag.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tag.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        tag.heightAnchor.constraint(equalToConstant: 40).isActive = true
        tag.scrollDirection = .horizontal
        tag.horizontalSpacing = 10
        // Hide scrollbar
        tag.showsHorizontalScrollIndicator = false
        //Config tag
        let configRefresh = TTGTextTagConfig()
        configRefresh.shadowOpacity = 0.5
        configRefresh.selectedCornerRadius = 5
        configRefresh.selectedBackgroundColor = #colorLiteral(red: 0.09407735616, green: 0.5303904414, blue: 0.157042712, alpha: 1)
        configRefresh.backgroundColor = #colorLiteral(red: 0.09407735616, green: 0.5303904414, blue: 0.157042712, alpha: 1)
        configRefresh.textColor = .white
        configRefresh.borderColor = .white
        configRefresh.borderWidth = 2
        configRefresh.cornerRadius = 5
        tag.addTags(["Refresh"], with: configRefresh)
        
        let config = TTGTextTagConfig()
        config.shadowOpacity = 0.5
        config.selectedCornerRadius = 15
        config.selectedBackgroundColor = Resource.Color.colorTapbar
        config.backgroundColor = Resource.Color.colorTapbar
        config.textColor = .white
        config.borderColor = .white
        config.borderWidth = 1
        config.cornerRadius = 15
        tag.addTags(["en", "zh", "ko","Favourite"], with: config)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationController?.navigationBar.isHidden = true
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
        self.listSearch = listActor
        self.myCollectionView.reloadData()
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
        switch indexPath.row % 3 {
        case 0:
            return CGSize(width: myCollectionView.frame.width / 2 , height: (myCollectionView.frame.height - 20) / 2)
        case 1:
            return CGSize(width: myCollectionView.frame.width / 1.8, height: (myCollectionView.frame.height - 60) / 2)
        case 2:
            return CGSize(width: myCollectionView.frame.width / 2 , height: myCollectionView.frame.width  / 1.2 )
        default:
            return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 10, left: 10, bottom: 20, right: 10)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nib = DetailController()
        nib.actor = self.listSearch[indexPath.row]
        nib.delegate = self
        self.tabBarController?.navigationController?.pushViewController(nib, animated: true)
    }
    //loadmore
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let indexFinal = listActor.count - 1
        if indexPath.row == indexFinal, currentPage + 1 <= maxPage {
            currentPage += 1
            self.isHidenFooter = false
            self.loadingView?.indicator.isHidden = false
            self.loadingView?.indicator.startAnimating()
            self.presenter.fetchData(page: currentPage)
        }
    }
    //footer
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if self.isHidenFooter {
            return .zero
        } else {
            return CGSize(width: myCollectionView.frame.width / 3, height: 100)
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
            //convert  to Data
            var data = cartVC.listData
            UserDefaultHelper.shared.cart = data
        }
    }
}

extension HomeController: PresenterHomeDelegate {
//    func passDataActorLoadMore(data: [Actor]) {
//        for item in data {
//            listActor.append(item)
//        }
//        self.listSearch = self.listActor
//        self.myCollectionView.reloadData()
//        self.isLoading = false
//        if currentPage == maxPage {
//            self.loadingView?.indicator.isHidden = true
//            self.isHidenFooter = true
//        }
//    }
    func passDataActor(data: [Actor], totalPage: Int) {
        for item in data {
            self.listActor.append(item)
        }
        self.listSearch = self.listActor
        self.myCollectionView.reloadData()
//        self.maxPage = 3
        if currentPage == maxPage {
            self.loadingView?.indicator.isHidden = true
            self.isHidenFooter = true
        }
    }
}

//MARK: Tag
extension HomeController: TTGTextTagCollectionViewDelegate  {
    func textTagCollectionView(_ textTagCollectionView: TTGTextTagCollectionView!, didTapTag tagText: String!, at index: UInt, selected: Bool, tagConfig config: TTGTextTagConfig!) {
//        switch tagText {
//        case Languge.en.rawValue:
//            self.listSearch = self.listActor.filter {
//                ($0.known_for?.contains { $0.original_language == Languge.en.rawValue })!
//            }
//            self.myCollectionView.reloadData()
//        case Languge.zh.rawValue:
//            self.listSearch = self.listActor.filter {
//                ($0.known_for?.contains { $0.original_language == Languge.zh.rawValue })!
//            }
//            self.myCollectionView.reloadData()
//        case Languge.ko.rawValue:
//            self.listSearch = self.listActor.filter {
//                ($0.known_for?.contains {$0.original_language == Languge.ko.rawValue})!
//            }
//            self.myCollectionView.reloadData()
//        case Languge.refresh.rawValue:
//            self.listSearch = self.listActor
//            self.myCollectionView.reloadData()
//        default:
//            break
//        }
        guard let languageCode =  HomeController.Language(rawValue: tagText) else {
            //refresh
            if tagText == "Refresh" {
                self.listSearch = self.listActor
                self.myCollectionView.reloadData()
            }
            return
        }
        self.listSearch = self.listActor.filter { $0.isContain(language: languageCode) }
        self.isHidenFooter = true
        self.myCollectionView.reloadData()
    }
    enum Language: String {
        case en = "en"
        case zh = "zh"
        case ko = "ko"
    }
}


