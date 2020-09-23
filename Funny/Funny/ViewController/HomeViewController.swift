//
//  HomeViewController.swift
//  Funny
//
//  Created by Apple on 9/19/20.
//

import UIKit

class HomeViewController: UIViewController {
    
    let menubar = MenuBar(arrButtonBar: [.bad,.good,.power,.superman,.bad])

    override func viewDidLoad() {
        super.viewDidLoad()
        
        #if Dev
            print("DEV")
        #elseif Stag
            print("STAG")
        #else
            print("PRO")
        #endif
        
        
        view.backgroundColor = .white
        
        self.view.addSubview(menubar)
        menubar.delegate = self
        NSLayoutConstraint.activate([
            menubar.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200),
            menubar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            menubar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            menubar.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        menubar.listButtonBar[0].hightlightView.backgroundColor = .blue
        

    }
}

extension HomeViewController: MenubarDelegate {
    func onTapButtonBar(at typeButtonBar: ButtonBar) {
        menubar.listButtonBar.forEach { (button) in
            if typeButtonBar == button {
                button.hightlightView.backgroundColor = .blue
                print(button.titleButonBar.text)
            } else {
                button.hightlightView.backgroundColor = .white
            }
        }
    }


}
