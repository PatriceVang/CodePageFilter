//
//  CartController.swift
//  FashionApp
//
//  Created by Apple on 4/14/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
private let cellId = "cell"
class CartController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
    }
    //MARK: Register
    private func register() {
        let nibCell = UINib(nibName: "MyTableViewCell", bundle: nil)
        myTableView.register(nibCell, forCellReuseIdentifier: cellId)
    }
  
    
}
extension CartController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: cellId) as? MyTableViewCell
        return cell!
    }
}
