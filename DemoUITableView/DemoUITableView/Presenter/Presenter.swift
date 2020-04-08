//
//  Presenter.swift
//  DemoUITableView
//
//  Created by Apple on 3/27/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class Presenter {
    var resource = Resource()
    
    var data = [
        Food(name: "Wine Sochu", img: "img_sochu", rating: 4, descrition: "Coming from Kore"),
        Food(name: "Susi", img: "img_susi", rating: 5, descrition: "Coming from Japan"),
        Food(name: "Caloc", img: "img_caloc", rating: 4, descrition: "Coming from VN"),
        Food(name: "Cari", img: "img_cari", rating: 3, descrition: "Coming from AD")
    ]
    
    func numberRow() -> Int {
        return data.count
    }
    
    func contentCell(tableView: UITableView, indexPath: IndexPath ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? CardTableViewCell
        let index = data[indexPath.row]
        cell?.imageView?.image = UIImage(named: index.img)
        cell?.lbName.text = index.name
        cell?.lbRating.text = ""
        let rating : Food = data[indexPath.row]
        for i in 1...rating.rating {
                cell?.lbRating.text = ( cell?.lbRating.text ?? "") + "⭐️"
            
        }
        cell?.lbDescrition.text = index.descrition
        return cell!
    }
}
