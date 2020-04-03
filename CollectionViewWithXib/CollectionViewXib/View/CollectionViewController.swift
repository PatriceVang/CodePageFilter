//
//  CollectionViewController.swift
//  CollectionViewXib
//
//  Created by Apple on 4/2/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

private let cellID = "Cell"
private let headerID = "Header"
let dataHeader = ["Monday", "Sat, Mar 28", "Wed, Mar 25"]

class CollectionViewController: UIViewController {
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    //MARK: Navi items
    let leftBtn : UIBarButtonItem = {
        let btn = UIBarButtonItem()
        btn.image = UIImage(named: "ic_Line")
        btn.tintColor = .black
        return btn
    }()
    let tfBar : UIBarButtonItem = {
        let tf = UITextField()
        tf.placeholder = "Search 'Vung Tau'"
        let bar = UIBarButtonItem()
        bar.customView = tf
        return bar
    }()
    let imgBar : UIBarButtonItem = {
        let img = UIImageView()
        img.widthAnchor.constraint(equalToConstant: 30).isActive = true
        img.heightAnchor.constraint(equalToConstant: 30).isActive = true
        img.layer.cornerRadius = 15
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.masksToBounds = true
        img.image = UIImage(named: "maco")
        let bar = UIBarButtonItem()
        bar.customView = img
        return bar
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        setupNavigationBar()
    }
    
    //MARK: Navigation Bar
    func setupNavigationBar() {
        navigationItem.leftBarButtonItems = [leftBtn, tfBar]
        navigationItem.rightBarButtonItem = imgBar
    }
    
    //MARK: Register
    private func register() {
        let nibCell = UINib(nibName: "MyCell", bundle: .main)
        myCollectionView.register(nibCell, forCellWithReuseIdentifier: cellID)
        let nibHeader = UINib(nibName: "HeaderView", bundle: nil)
        myCollectionView.register(nibHeader, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
    }
}

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: Header
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: myCollectionView.bounds.width, height: 40)
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = myCollectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath) as? HeaderView
        header?.lbName.text = dataHeader[indexPath.section]
        return header!
    }
    //MARK: Section
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataHeader.count
    }
    
    //MARK: Cell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 2
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? MyCell
        cell?.imgPresent.image = UIImage(named: "imgHeader")
        cell?.backgroundColor = .blue
        return cell!
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let x = 4
        let y = x - 1
        let width = (collectionView.bounds.width - (CGFloat(y) * 10))/CGFloat(x)

        return CGSize(width: width , height: collectionView.bounds.width / 3)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

