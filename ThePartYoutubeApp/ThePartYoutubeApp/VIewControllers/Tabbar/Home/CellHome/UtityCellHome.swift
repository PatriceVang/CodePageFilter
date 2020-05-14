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
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionUtity.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? DetailUtityCell
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: (self.frame.width - 20) / 2 , height: myCollectionUtity.frame.height)
    }
    
    
}
