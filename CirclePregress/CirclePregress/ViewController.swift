//
//  ViewController.swift
//  CirclePregress
//
//  Created by Apple on 4/26/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    
    @IBOutlet weak var vCircle: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        vCircle.progressAnimation(duration: 0, value: 0.5)
    }
}


extension UIView{
    func progressAnimation( duration: TimeInterval, completion: (()->Void)? = nil, value: CGFloat) {
        
        let totalValue: CGFloat = .pi * 2
        let startValue: CGFloat = -.pi / 2
        
        var finalValue: CGFloat  {
            return value * (.pi * 2) + startValue
        }
        
        let grayProgress = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width/2, y: frame.size.height/2), radius: frame.size.width/2, startAngle: startValue , endAngle: totalValue, clockwise: true)
        grayProgress.path = circularPath.cgPath
        grayProgress.name = "grayProgress"
        grayProgress.fillColor = UIColor.clear.cgColor
        grayProgress.lineCap = .round
        grayProgress.lineWidth = 5
        grayProgress.strokeEnd = 0
        grayProgress.strokeColor = #colorLiteral(red: 0.6901960784, green: 0.6901960784, blue: 0.6901960784, alpha: 1)
        
        let hightlightProgress = CAShapeLayer()
        let circularPath1 = UIBezierPath(arcCenter: CGPoint(x: frame.size.width/2, y: frame.size.height/2), radius: frame.size.width/2, startAngle: startValue, endAngle: finalValue, clockwise: true)
        hightlightProgress.path = circularPath1.cgPath
        hightlightProgress.name = "hightlightProgress"
        hightlightProgress.fillColor = UIColor.clear.cgColor
        hightlightProgress.lineCap = .round
        hightlightProgress.lineWidth = 5
        hightlightProgress.strokeEnd = 0
        hightlightProgress.strokeColor = UIColor.blue.cgColor
        
        layer.addSublayer(grayProgress)
        layer.addSublayer(hightlightProgress)
        
        let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        circularProgressAnimation.duration = duration
        circularProgressAnimation.toValue = 1
        circularProgressAnimation.fillMode = .forwards
        circularProgressAnimation.isRemovedOnCompletion = false
        
        grayProgress.add(circularProgressAnimation, forKey: "progressAnim")
        hightlightProgress.add(circularProgressAnimation, forKey: "progressAnim")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            if completion != nil{
                completion!()
            }
        }
    }
    func removeProgressLayer() {
        self.layer.sublayers?.forEach({ progressLayer in
            if progressLayer.name == "hightlightProgress" {
                progressLayer.removeFromSuperlayer()
            }
        })
    }
}
