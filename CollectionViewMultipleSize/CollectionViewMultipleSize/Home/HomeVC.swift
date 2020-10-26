//
//  HomeVC.swift
//  CollectionViewMultipleSize
//
//  Created by Apple on 10/16/20.
//

import UIKit

class HomeVC: UIViewController {
    
    
    private let data = [1,23,4,5,6,7,1,1,1,11,4]

    @IBOutlet weak var homeCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()


        
        homeCollectionView.register(UINib(nibName: "HomeCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        
        if let layout = homeCollectionView.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
        
    
    }

}

extension HomeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCell
        cell.backgroundColor = .systemBlue
        return cell
    }
    
    
}

extension HomeVC: UICollectionViewDelegate {
    
}

protocol PinterestLayoutDelegate: AnyObject {
  func collectionView(
    _ collectionView: UICollectionView,
    heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat
}


extension HomeVC: PinterestLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        if indexPath.row % 2 == 1 {
            return 198
        }
        return 218
    }
    
    
}
