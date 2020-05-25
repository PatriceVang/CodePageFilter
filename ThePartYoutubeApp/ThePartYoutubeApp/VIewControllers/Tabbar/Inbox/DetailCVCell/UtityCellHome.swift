//
//  UtityCellHome.swift
//  ThePartYoutubeApp
//
//  Created by Apple on 5/14/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

private let cellId = "cell"

class UtityCellHome: UITableViewCell {
    @IBOutlet weak var myCollectionUtity: UICollectionView!    
    var listArticle = [Articles]() {
        didSet {
            if listArticle.count > 0 {
                self.myCollectionUtity.reloadData()
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        myCollectionUtity.register(UINib(nibName: "DetailUtityCell", bundle: nil), forCellWithReuseIdentifier: cellId)
        myCollectionUtity.delegate = self
        myCollectionUtity.dataSource = self
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
extension UtityCellHome: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listArticle.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionUtity.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? DetailUtityCell
        let articles = listArticle[indexPath.row]
        cell?.articles = articles
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: (self.frame.width - 20) / 2 , height: myCollectionUtity.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let keyWindow = UIApplication.shared.keyWindow {
            let videoPlayerView = VideosLaucher()
            keyWindow.addSubview(videoPlayerView.view)
            videoPlayerView.view.frame = .init(x: keyWindow.frame.minX, y: keyWindow.frame.maxY, width: keyWindow.frame.width, height: 0 )
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                videoPlayerView.view.frame = keyWindow.frame
            }) { (completed) in
                UIApplication.shared.setStatusBarHidden(true, with: .fade)
            }
        }
    }
}





