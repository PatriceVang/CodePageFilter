//
//  HomeViewController.swift
//  SideMenuMakeSelf
//
//  Created by Apple on 10/8/20.
//

import UIKit

class HomeViewController: UIViewController {
    
 
    let transition =  SlideInTransition()
    var containerView: UIView?
    lazy var leftMenuVC = LeftMenuViewController()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBlue
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Menu", style: .done, target: self, action: #selector(onTapMenu))
        
        transition.completion = { [self] (translaction) in
            if let _translaction = translaction as? CGPoint {
                leftMenuVC.view.center.x += _translaction.x
            }
        }
        
        
        transition.dismissMenu = { [self] in
            leftMenuVC.dismiss(animated: true, completion: nil)
        }
        

        

    }
    @objc func onTapMenu() {
        
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
            break
        case .event:
            // addSubView
            let eventVC = EventViewController()
            eventVC.view.frame = self.view.bounds
            self.view.addSubview(eventVC.view)
            containerView = eventVC.view
//            navigationController?.pushViewController(eventVC, animated: true)
        
        case .profile:
            let profileVC = ProfileViewController()
//            profileVC.view.frame = self.view.bounds
//            self.view.addSubview(profileVC.view)
//            containerView = profileVC.view
            navigationController?.pushViewController(profileVC, animated: true)
            
        }
    }
    
    
  

}
extension HomeViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
}

