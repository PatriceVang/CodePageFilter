//
//  FirstVC.swift
//  testDelegate
//
//  Created by Apple on 5/26/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
import MyPackage


class Sample {
    var title = "" {
        didSet {
            print("title \(title)")
        }
    }
    init(title: String) {
        self.title = title
    }
}

class FirstVC: BaseVC {
    

    
    
    @IBOutlet weak var resultLb: UILabel!
    
    deinit {
        //remove selected event
//        NotificationCenter.default.removeObserver(self, name: .thirdVCEmitText, object: nil)
        NotificationCenter.default.removeObserver(subscription as Any)
        //remove all event
//        NotificationCenter.default.removeObserver(self)
    }

    var value: String? {
        didSet {
            resultLb.text = value ?? "Nil"
        }
    }
    
    var sample: Sample?

    var subscription: NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = MyText.myTitle
        
        MyText.showTile()

        
        
        
//        NotificationCenter.default.addObserver(self, selector: #selector(onObserveThirdVCEmitText), name: .thirdVCEmitText, object: nil)
        subscription = NotificationCenter.default.addObserver(forName: .thirdVCEmitText, object: nil, queue: .main) { [unowned self] noti in
            if let data = noti.userInfo as? [String: String], let text = data["data"] {
                self.value = text
            }
        }
    }
    
    
//    @objc func onObserveThirdVCEmitText(_ noti: Notification) {
//
//        if let data = noti.userInfo as? [String: String], let text = data["data"] {
//            self.value = text
//        }
//    }
    
    @IBAction func onTapMovSecondBtn(_ sender: Any) {
        print("tap")
        self.navigationController?.pushViewController(SecondVC(), animated: true)
    }

    
    @IBAction func onTapMoveToHome(_ sender: UIButton) {
        self.navigationController?.setViewControllers([HomeVC()], animated: true)
    }

}

class BaseVC: UIViewController {
    deinit {
        print("\(String(describing: Self.self)) deinited")
    }
}

//
//struct User_ { //Entity
//    var id, age, name, lastname : String
//    var populaity: Int
//}
//struct SimpleUser_ {
//    var id, name, pupularity: String
//}
//class MainVC: UIViewController, UITableViewDelegate {
//    var viewModel = MainViewModel()
//    
//    var users = [SimpleUser_]
//    
//    var disposeBag = DisposeBag()
//    
//    override func viewDidLoad() {
//        //MainVC lang nghe onGetuserSucess
//        viewModel.onGetUserSuccess.subscribe( onNext: { (users: [SimpleUser_]) in
//            //DO after onGetUserSuccess have data immediatly
//            self.users = users
//            //reloaddata table
//        })
//            .dispose(self.disposeBag)
//        
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        viewModel.loadUsers()
//    }
//    
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = UIViewController()
//        vc.simpleUser = users[indexPath.row]
//        self.pushViewConrtller(vc)
//    }
//    
//}
////RxSwift
//class MainViewModel {
    //observable: cho thanag khac lang nghe no
//  var onGetUserSuccess = PublishSubject<[SimpleUser]>()
    //let observable:   = onGesUserSuccess

//  func loadUsers() {
//    //
//    APICaller.loadUsers { (users: [User_]) in
//        let viewUsers = users.map { SimpleUser_(name: $0.name, pupularity: $0.popularity) }
//        
//        // get event
//        onGetUserSuccess.onNext(viewUsers)
//
//    }
//  }
//    
//    func loadUser(id: String) {
//        APICaller.loadUser(id: id) {
//            
//        }
//    }
//}
