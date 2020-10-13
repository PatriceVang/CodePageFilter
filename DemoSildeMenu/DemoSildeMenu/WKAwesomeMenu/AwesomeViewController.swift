//
//  AwesomeViewController.swift
//  DemoSildeMenu
//
//  Created by Apple on 10/12/20.
//

import UIKit
import WKAwesomeMenu




class AwesomeViewController: BaseViewController {
    
    private var shadowLayer: CAShapeLayer!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "HOME"

        
    }
  
    
    
}

extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}


//extension AwesomeViewController: LeftViewControllerDelegate {
//    func moveToScreen(at index: Int) {
//        let c2 = Screen2ViewController()
//        navigationController?.pushViewController(c2, animated: true)
//    }
//}
