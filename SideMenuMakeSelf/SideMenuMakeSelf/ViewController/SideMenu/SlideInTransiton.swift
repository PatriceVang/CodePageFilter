//
//  SlideInTransiton.swift
//  SideMenuMakeSelf
//
//  Created by Apple on 10/9/20.
//

import Foundation
import UIKit

class SlideInTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    var dismissMenu: (() -> Void)?
    var isPresenting = false
    let dimingView = UIView()
    var menuType: MenuType = .home
    let mainView = MainView()
    var vcTemp: UIViewController?
    var completion: ((Any) -> Void)?
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toVC = transitionContext.viewController(forKey: .to),
              let fromVC = transitionContext.viewController(forKey: .from) else {return}
        
        let containerView = transitionContext.containerView
        let finalWidth = toVC.view.bounds.width * 0.6
        let finalHeight = toVC.view.bounds.height
        if isPresenting {
            //Add diming View
            for view in dimingView.subviews {
                view.removeFromSuperview()
            }
            dimingView.backgroundColor = .white
            containerView.addSubview(dimingView)
            dimingView.frame = containerView.bounds
            
            
            //Add mainView
            mainView.frame = .init(x: finalWidth + 10, y: dimingView.frame.minY + 60, width: dimingView.frame.width - finalWidth, height: dimingView.frame.height - 200)
            dimingView.addSubview(mainView)
            let vc = makeViewController(type: menuType, frame: mainView.frame)
            vcTemp = vc
            dimingView.addSubview((vcTemp?.view)!)
            
            // this view use to tap and pan on MainView
            let vtemp = UIView()
            vtemp.frame = dimingView.bounds
            vtemp.isUserInteractionEnabled = true
            vtemp.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTapViewTemp)))
            vtemp.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(onPanViewTemp(_:))))
            dimingView.addSubview(vtemp)
           
            
            //Add leftMenu to Container
            containerView.addSubview(toVC.view)
            toVC.view.frame = .init(x: -finalWidth, y: 0, width: finalWidth, height: finalHeight)
            
        }
        
        //Animate to screen
        let transform = {
            toVC.view.transform = CGAffineTransform(translationX: finalWidth, y: 0)
        }
        
        //Animate back off screens
        let identity = {
            fromVC.view.transform = .identity
        }
        
        //Animtion of the transition
        let duration = transitionDuration(using: transitionContext)
        let isCancled = transitionContext.transitionWasCancelled
        
        UIView.animate(withDuration: duration) {
            self.isPresenting ? transform() : identity()
        } completion: { (_) in
            transitionContext.completeTransition(!isCancled)
        }
    }
    
    func makeViewController(type: MenuType, frame: CGRect) -> UIViewController {
        let vc: UIViewController?
        switch type {
        case .home:
            vc = HomeViewController()
        case .event:
            vc = EventViewController()
        case .profile:
            vc = ProfileViewController()
        }
        vc!.view.frame = .init(x: frame.minX, y: frame.minY + 60, width: frame.width, height: frame.height - 70)
        
        return vc!
    }
    
    @objc func onTapViewTemp() {
        print(456)
    }
    
    
    // Not finish
    @objc func onPanViewTemp(_ pan: UIPanGestureRecognizer) {
        let translaction = pan.translation(in: pan.view)

        print(translaction)
        
        switch pan.state {
        case .began, .changed:
            
            if mainView.frame.minX <= dimingView.frame.minX {
                dismissMenu?()
            }
            completion?(translaction)
            mainView.center.x += translaction.x
            vcTemp?.view.center.x += translaction.x
            
        default:
            break
        }
        
        pan.setTranslation(.zero, in: pan.view)
    }

}


