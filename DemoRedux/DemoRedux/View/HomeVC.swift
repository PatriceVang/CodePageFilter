//
//  HomeVC.swift
//  DemoRedux
//
//  Created by Apple on 7/1/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
import ReSwift

class HomeVC: UIViewController {
    @IBOutlet weak var number_Lb: UILabel!
    @IBOutlet weak var displayName_Lb: UILabel!
    @IBOutlet weak var moveToDetail_Btn: UIButton!
    
    var homeStateController: HomeStateController
    
    lazy var homeState: Subcriber<HomeState> = Subcriber(block: nil)
    
    init() {
        self.homeStateController = HomeStateController()
        super.init(nibName: "HomeVC", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isTranslucent = false
        homeState = Subcriber<HomeState>(block: { (home) in
            self.number_Lb.text = String(format: "%d", home.counter)
            self.displayName_Lb.text = home.displayTitle.name
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        store.subscribe(self.counterState) {
//            $0.select {
//                $0.homeState
//            }.skip { (old, new) -> Bool in
//                return new.counter == 8
//            }
//        }
        
        
        store.subscribe(self.homeState) { (home) in
            home.select { (state)  in
                state.homeState
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        store.unsubscribe(homeState)
    }
    
    @IBAction func onTapMoveDetailVC_Btn(_ sender: Any) {
        let detailVC = DetailVC()
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    @IBAction func onTapDisplayName(_ sender: Any) {
        homeStateController.displaytitle(title: number_Lb.text!)
        homeStateController.allowedDisplayText(isAllowed: true)
    }

    @IBAction func onTapGiamBtn(_ sender: Any) {
        homeStateController.numberDecrease()
        
    }
    @IBAction func onTapTangBtn(_ sender: Any) {
        homeStateController.numberIncrease()
    }
    
}







