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

class CartController: UIViewController {
    @IBOutlet weak var heightNaviView: NSLayoutConstraint!
    @IBOutlet weak var lbMycart: UILabel!
    @IBOutlet weak var viewNavigation: UIView!
    @IBOutlet weak var myTableView: UITableView!
    //MARK: Proberty
    var listData = [ModelCart]()
    var listCart = [ModelCart]()
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        customElement()
    }
    //MARK: ViewdidLoad
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listCart = UserDefaultHelper.shared.cart ?? []
        self.myTableView.reloadData()
    }
    
    //MARK: Register
    private func register() {
        let nibCell = UINib(nibName: "MyTableViewCell", bundle: nil)
        myTableView.register(nibCell, forCellReuseIdentifier: cellId)
    }
    //MARK: Custom Element
    private func customElement() {
        viewNavigation.backgroundColor = Resource.Color.colorHeader
        heightNaviView.constant = view.frame.width * 0.3
        //Lb my cart
        lbMycart.text = Resource.Text.myCart
    }
}
//MARK: Table View
extension CartController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listCart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: cellId) as? MyTableViewCell
        let text = listCart[indexPath.row]
        cell?.modelCart = text
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .normal, title: "Delete") { [weak self] (action, view, completion) in
            guard let strongSelf = self else {return}
            strongSelf.listCart.remove(at: indexPath.row)
            UserDefaultHelper.shared.cart = strongSelf.listCart
            strongSelf.myTableView.reloadData()
            completion(true)
        }
        delete.image = UIImage(systemName: "trash")
        delete.backgroundColor = .red
        let swipe = UISwipeActionsConfiguration(actions: [delete])
        return swipe
    }
}

