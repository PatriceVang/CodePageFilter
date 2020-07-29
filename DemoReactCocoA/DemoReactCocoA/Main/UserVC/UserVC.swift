//
//  UserVC.swift
//  DemoReactCocoA
//
//  Created by Apple on 7/22/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
import ReactiveCocoa
import ReactiveSwift

class UserVC: UIViewController {
    @IBOutlet weak var userTableView: UITableView!
    let viewModel: UserViewModelProtocol
    
    let getUserAction: CocoaAction<Any>
    let updateUserAction: CocoaAction<Any>
    init() {
        viewModel = UserViewModel()
        getUserAction = CocoaAction(viewModel.getUSerAction, {_ in return ()})
        updateUserAction = CocoaAction(viewModel.updateUserAction, {_ in return ()})
        super.init(nibName: "UserVC", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userTableView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "cell")
        userTableView.tableFooterView = .none

        getUserAction.execute(self)
        observerAction()

    }

    private func observerAction() {
        getUserAction.isExecuting.signal.observeValues { [weak self] (done) in
            if done {
                return
            } else {
                self?.userTableView.reloadData()
            }
        }
        
        updateUserAction.isExecuting.signal.observeValues { [weak self] done in
            if done {
                return
            } else {
                self?.userTableView.reloadData()
            }
        }
    }
}

extension UserVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.listUser.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userTableView.dequeueReusableCell(withIdentifier: "cell") as! UserCell
        cell.setValue(user: viewModel.listUser.value[indexPath.row])
        return cell
    }
}
extension UserVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Dialog.shared.showDialogOneTextField(target: self, titleDialog: "Update name of User", msg: nil, titleAction: "OK", handleAction: { (action, str) in
            
            self.viewModel.indexUser.value = indexPath.row
            self.viewModel.newName.value = str.trimmingCharacters(in: .whitespacesAndNewlines)
            
            if self.viewModel.newName.value.isEmpty {
                print(self.viewModel.msgErr.value)
            } else {
                self.updateUserAction.execute(self)
            }
        }) { (tf) in
            tf.placeholder = "david"
        }
        
    }
}
