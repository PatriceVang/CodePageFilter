//
//  SideMenuButton.swift
//  SideMenuMakeSelf
//
//  Created by Apple on 10/9/20.
//


import Foundation
import UIKit

class PhatSliderButton: UIBarButtonItem {
    weak var datasource: PhatSliderButtonDatasource? {
        didSet{
            darkView.backgroundColor = UIColor.gray.withAlphaComponent(0.7)
            viewController = datasource?.viewControllerHandle()
            hamburgerView = datasource?.hamburgerView()
            setUpView()
            addGesture()
        }
    }
    weak var delegate: PhatSliderButtonDelegate?
    
    private var appView: UIView?
    private var mainView = UIView()
    private weak var viewController: UIViewController?
    var hamburgerView: UIView?
    private var darkView = UIView()
    private var leadingAnchor: NSLayoutConstraint?
    private var widthAnchor: NSLayoutConstraint?
    private var maxPanSize: CGFloat!
    private var hasSetUpView = false
    private var hamburgerWidth: CGFloat {
        let baseRatio: CGFloat = 5/6
        let baseWidth: CGFloat = 400
        guard let frame = UIApplication.shared.windows.last?.frame else { return baseWidth }
        return frame.width * baseRatio < baseWidth ? frame.width * baseRatio : baseWidth
    }
    var isClosed = true

    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(image: UIImage?) {
        self.init(image: image, style: .done, target: datasource?.viewControllerHandle(), action: #selector(buttonPress))
    }
    
    func setUpView(){
        if self.hasSetUpView { return }
        if let frame = UIApplication.shared.windows.last?.frame {
            mainView.backgroundColor = .clear
            mainView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            mainView.isOpaque = false
            if let keyWindows = UIApplication.shared.keyWindow {
                appView = keyWindows
            }
            guard let appView = self.appView else { return }
            
            hamburgerView?.frame = CGRect(x: 0, y: 0, width: hamburgerWidth, height: frame.height)
            
            mainView.addSubview(hamburgerView ?? UIView())
            appView.addSubview(mainView)
            
            mainView.isUserInteractionEnabled = true
            mainView.translatesAutoresizingMaskIntoConstraints = false
            widthAnchor = mainView.widthAnchor.constraint(equalToConstant: frame.width)
            widthAnchor?.isActive = true
            leadingAnchor = mainView.leadingAnchor.constraint(equalTo: appView.leadingAnchor, constant: -appView.frame.width)
            leadingAnchor?.isActive = true
            mainView.topAnchor.constraint(equalTo: appView.topAnchor, constant: 0).isActive = true
            mainView.bottomAnchor.constraint(equalTo: appView.bottomAnchor, constant: 0).isActive = true
            
            mainView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(mainViewTapped(_:))))
//            makeShadow(view: hamburgerView ?? UIView())
            mainView.isHidden = true
            self.hasSetUpView = true
        }
    }
    
    private func addGesture(){
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panInSelf(_:)))
        self.mainView.addGestureRecognizer(panGesture)
    }
    
    func updateWhenDeviceRotate(size: CGSize) {
        widthAnchor?.constant = size.width
    }
    private var initialCenter = CGPoint()
    @objc private func panInSelf(_ gesture: UIPanGestureRecognizer){
        guard let hamburgerView = self.hamburgerView else { return }
        maxPanSize = (mainView.frame.width) / 2
        guard gesture.view != nil else {return}
        guard let piece = gesture.view else { return }
        // Get the changes in the X and Y directions relative to
        // the superview's coordinate space.
        let translation = gesture.translation(in: piece.superview)
        let velocity = gesture.velocity(in: piece.superview)
        if gesture.state == .began {
            self.initialCenter = piece.center
        }
        // Update the position for .changed
        if gesture.state == .changed {
            if translation.x > 0  {
                return
            }
            // Add the X and Y translation to the view's original position.
            let newCenter = CGPoint(x: initialCenter.x + translation.x, y: initialCenter.y)
            UIView.animate(withDuration: 0.1) {
                piece.center = newCenter
            }
        } else if gesture.state == .ended {
            // Add the X and Y translation to the view's original position.
            if -translation.x > hamburgerView.frame.width / 1.5 || -velocity.x > 300 {
                closeMenu()
            } else {
                UIView.animate(withDuration: 0.1) {
                    piece.center = self.initialCenter
                }
            }
        }
    }
    
    private func makeShadow(view: UIView, add: Bool = true){
        //make shadow
        view.layer.masksToBounds = false
        let shadowPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: view.frame.width + 10, height: view.frame.height), cornerRadius: 1)
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowOpacity = 0.5
        view.layer.shadowPath = shadowPath.cgPath
    }
    private func makeAppViewDarker(on: Bool) {
        //make darker
        if !on {
            darkView.removeFromSuperview()
            return
        }
        appView?.insertSubview(darkView, belowSubview: mainView)
        darkView.frame = UIScreen.main.bounds
    }
    
    func closeMenu(){
        guard let appView = self.appView else { return }
        makeAppViewDarker(on: false)
        UIView.animate(withDuration: 0.2, animations: {
            self.leadingAnchor?.constant = -appView.frame.width
            self.appView?.layoutIfNeeded()
        }) { (_) in
            self.delegate?.dismissSlider?()
            self.mainView.isHidden = true
        }
        self.isClosed = true
    }
    func openMenu() {
        self.mainView.isHidden = false
        makeAppViewDarker(on: true)
        UIView.animate(withDuration: 0.2, animations: {
            self.leadingAnchor?.constant = 0
            self.appView?.layoutIfNeeded()
        })
        isClosed = false
    }
    
    @objc private func mainViewTapped(_ sender: UITapGestureRecognizer){
        let location = sender.location(in: mainView)
        guard let hamburgerView = self.hamburgerView else { return }
        if !hamburgerView.frame.contains(location) {
            closeMenu()
        }
    }
    
    @objc private func buttonPress(){
        delegate?.buttonClick?()
        guard let appView = self.appView else { return }
        widthAnchor?.constant = appView.frame.width
        openMenu()
    }
}
protocol PhatSliderButtonDatasource: class {
    func viewControllerHandle() -> UIViewController
    func hamburgerView() -> UIView
}
@objc protocol PhatSliderButtonDelegate: class {
    @objc optional func buttonClick()
    @objc optional func dismissSlider()
}
