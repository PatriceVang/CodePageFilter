//
//  MainVC.swift
//  SampleMVP
//
//  Created by Vinova Dev on 4/15/20.
//  Copyright © 2020 phthphat. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var tbV: UITableView!
    
    let cellId = "ActorInfoCell"
    var presenter: MainPresenterProtocol
    
    var actors = [ActorResponse]()
    
    init() {
        presenter = MainPresenter()
        super.init(nibName: "MainVC", bundle: nil)
        presenter.view = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbV.register(
            UINib(nibName: "ActorInfoCell", bundle: nil),
            forCellReuseIdentifier: cellId
        )
        presenter.getAllActors()
    }
}


extension MainVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.actors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ActorInfoCell
        cell.model = self.actors[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}


extension MainVC: MainViewProtocol {
    func onGetAllActorsComplete(actors: [ActorResponse]) {
        self.actors = actors
        self.tbV.reloadData()
    }
    
    func onReceiveError(msg: String) {
        print(msg)
    }
}
