//
//  CartController.swift
//  FashionApp
//
//  Created by Apple on 4/14/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
import Extensions

private let cellId = "cell"



//header mau do
//header ten

class BaseVC: UIViewController { }


////
class BaseChatVC: BaseVC {
    
}

///
class CharCOntoller : BaseChatVC {
    //
}

class Another: BaseVC {
    
}


class CartController: UIViewController {
    @IBOutlet weak var lbMycart: UILabel!
    @IBOutlet weak var viewNavigation: UIView!
    @IBOutlet weak var myTableView: UITableView!
    var listData = [ModelCart]()
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        customElement()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.myTableView.reloadData()
    }
    
    //MARK: Register
    private func register() {
//        let nibCell = UINib(nibName: "MyTableViewCell", bundle: nil)
//        myTableView.register(nibCell, forCellReuseIdentifier: cellId)
        
        myTableView.registerXibFile(MyTableViewCell.self)
        
    }
    
    //MARK: Custom Element
    private func customElement() {
        viewNavigation.backgroundColor = Resource.Color.colorHeader
        viewNavigation.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3).isActive = true
        //Lb my cart
        lbMycart.text = Resource.Text.myCart
    }
}
extension CartController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = myTableView.dequeueReusableCell(withIdentifier: cellId) as? MyTableViewCell
        let cell = myTableView.dequeue(MyTableViewCell.self, for: indexPath)
        let text = listData[indexPath.row]
        cell.modelCart = text
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
