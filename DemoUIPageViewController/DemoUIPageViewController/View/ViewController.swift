//
//  ViewController.swift
//  DemoUIPageViewController
//
//  Created by Apple on 4/27/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var viewBackgroud: UIView!
    @IBOutlet var arrViewAnimation: [UIView]!
    @IBOutlet var arrLb: [UILabel]!
    @IBOutlet weak var viewUnderFinalLb: UIView!
    @IBOutlet weak var viewUnderHomeLb: UIView!
    let rootPageVC =  UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    
    let controllers = [
           HelloVC(),
           HomeVC(),
           FinalVC()
    ]
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rootPageVC.dataSource = self
        rootPageVC.delegate = self
        view.addSubview(rootPageVC.view)
        rootPageVC.setViewControllers([controllers.first!], direction: .forward, animated: true, completion: nil)
        
        let pageView = rootPageVC.view
        pageView?.translatesAutoresizingMaskIntoConstraints = false
        pageView?.topAnchor.constraint(equalTo: viewBackgroud.bottomAnchor, constant: 0).isActive = true
        pageView?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        pageView?.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        pageView?.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -150).isActive = true
        self.addChild(rootPageVC)
        
        
    }
    

    

    
    
}

extension ViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource{
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return controllers.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if !completed {
            return
        }
        
        let currentIndex = controllers.firstIndex(of: (pageViewController.viewControllers?.first)!)
        for i in 0..<arrLb.count {
            if currentIndex == i {
                arrLb[i].textColor = .black
                arrViewAnimation[i].backgroundColor = .darkGray
            } else {
                 arrLb[i].textColor = .gray
                arrViewAnimation[i].backgroundColor = .white
            }
        }
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = controllers.firstIndex(of: viewController) ?? 0
        if index > 0 {
            return controllers[index - 1]
        } else {
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = controllers.firstIndex(of: viewController) ?? 0
        if index < controllers.count - 1 {
            return controllers[index + 1]
        } else {
            return nil
        }
    }
    

}



