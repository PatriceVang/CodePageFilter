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
    var listModel = [ModelCell]()
    var countNew = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        register()
        //Colletion View
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        myCollectionView.collectionViewLayout = layout
        self.navigationItem.titleView = searchBar
        self.navigationController?.navigationBar.barTintColor = Resource.Color.colorHeader
    }

    //MARK: API
    func getData() {
        guard let url = URL(string: "https://api.themoviedb.org/3/person/popular?api_key=58d10a67ba0f9232e2f1b88e7e13cb1d&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, _, err) in
            let q = DispatchQueue(label: "request url")
            q.async {
                guard let data = data else {return}
                    do {
                        let json = try? JSONDecoder().decode(JsonTotal.self, from: data)
                        guard let arr = json?.results else {return}
                        for item in arr {
                            self.listModel.append(.init(actor: item))
                        }
                        DispatchQueue.main.async {
                            self.myCollectionView.reloadData()
                        }
                    } catch {
                        if let error = err {
                            print(error)
                        }
                    }
                }
            }
        task.resume()
    }
    //Regiser
    private func register() {
        let nibCell = UINib(nibName: "MyCollectionCell", bundle: nil)
        myCollectionView.register(nibCell, forCellWithReuseIdentifier: cellID)
    }
}
//MARK: Search Bar
extension HomeController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}
//MARK: Collection
extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //Cell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? MyCollectionCell
        let text = listModel[indexPath.row]
        cell?.model = text
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let x = 3
        let y = x - 1
        let width = (collectionView.bounds.width - (CGFloat(y) * 10))/CGFloat(x)
        return CGSize(width: width , height: collectionView.bounds.width / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 10, left: 10, bottom: 10, right: 10)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nib = DetailController(nibName: "DetailController", bundle: nil)
        nib.actor = listModel[indexPath.row].actor
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

