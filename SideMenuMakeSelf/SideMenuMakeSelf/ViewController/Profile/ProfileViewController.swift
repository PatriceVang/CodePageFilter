//
//  ProfileViewController.swift
//  SideMenuMakeSelf
//
//  Created by Apple on 10/9/20.
//

import UIKit

class ProfileViewController: UIViewController {

    let transition =  SlideInTransition()
//    var containerView: UIView?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = .green
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Menu", style: .done, target: self, action: #selector(onTapMenu))
        

    }
    
    @objc func onTapMenu() {
        
        let leftMenuVC = LeftMenuViewController()
        transition.menuType = .profile
//        leftMenuVC.modalPresentationStyle = .overCurrentContext
        leftMenuVC.transitioningDelegate = self
        leftMenuVC.didTapMenuType = { [self] menu in
            transitionToNewConstant(menu)
        }
        present(leftMenuVC, animated: true, completion: nil)
        
        
    }
    
    func transitionToNewConstant(_ menuType: MenuType) {
        transition.menuType = menuType
//        containerView?.removeFromSuperview()
        switch menuType {
        case .home:
            let homeVC = HomeViewController()
            
            navigationController?.pushViewController(homeVC, animated: true)
        case .event:
            let eventVC = EventViewController()
//            eventVC.view.frame = self.view.bounds
//            self.view.addSubview(eventVC.view)
//            containerView = eventVC.view
            navigationController?.pushViewController(eventVC, animated: true)
            
            
        case .profile:
            let profileVC = ProfileViewController()
//            profileVC.view.frame = self.view.bounds
//            self.view.addSubview(profileVC.view)
//            containerView = profileVC.view
            navigationController?.pushViewController(profileVC, animated: true)
            
        }
    }
    
    
  

}
extension ProfileViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }

}
