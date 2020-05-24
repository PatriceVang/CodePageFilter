//
//  PulsingAnimation.swift
//  ThePartYoutubeApp
//
//  Created by Apple on 5/23/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class PulsingAnimation: CALayer {
    var animationGroup = CAAnimationGroup()
    var animationDuration: TimeInterval = 1.5
    var radius: CGFloat = 200
    var numberOfPuls: Float = 10
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(numberOfPuls: Float, radius: CGFloat, position: CGPoint) {
        super.init()
        self.backgroundColor = UIColor.black.cgColor
        self.contentsScale = UIScreen.main.scale
        self.opacity = 0
        self.radius = radius
        self.numberOfPuls = numberOfPuls
        self.position = position
        
        self.bounds = CGRect(x: 0, y: 0, width: radius*2, height: radius*2)
        self.cornerRadius = radius
        
        DispatchQueue.global(qos: .default).async {
            self.setupAnimationGroup()
            DispatchQueue.main.async {
                self.add(self.animationGroup, forKey: "pulse")
            }
        }
    }
    
    private func scaleAnimation() -> CABasicAnimation {
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale.xy")
        scaleAnimation.fromValue = NSNumber(value: 0)
        scaleAnimation.toValue = NSNumber(value: 1)
        scaleAnimation.duration = animationDuration
        return scaleAnimation
    }
    
    private func opacityAnimation() -> CAKeyframeAnimation {
        let opacity = CAKeyframeAnimation(keyPath: "opacity")
        opacity.duration = animationDuration
        opacity.keyTimes = [0, 0.3, 1]
        opacity.values = [0.4, 0.8, 0]
        return opacity
    }
    
    private func setupAnimationGroup() {
        self.animationGroup.duration = animationDuration
        self.animationGroup.repeatCount = numberOfPuls
        let defaultCurve = CAMediaTimingFunction(name: .default)
        self.animationGroup.timingFunction = defaultCurve
        self.animationGroup.animations = [scaleAnimation(), opacityAnimation()]
    }
}
