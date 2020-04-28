//
//  DetailVC.swift
//  CallApiUsageObjectMapper
//
//  Created by Apple on 4/23/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let widthOfScrollView = scrollView.bounds.width
        let heightOfScrollView = scrollView.bounds.height
        scrollView.backgroundColor = .gray
        scrollView.contentSize = CGSize(width: widthOfScrollView, height: heightOfScrollView)
        
//        let heightOfSubView = CGFloat(120)
//
//        //bien tam
//        var currentViewOffSet = CGFloat(0)
//
//        while currentViewOffSet < heightOfScrollView {
//            let subView = UIView(frame: CGRect(x: 0, y: currentViewOffSet, width: widthOfScrollView, height: heightOfSubView).insetBy(dx: 5, dy: 5))
//            let hue = UIColor(hue: currentViewOffSet/heightOfScrollView, saturation: 1, brightness: 1, alpha: 1)
//            subView.backgroundColor = hue
//            scrollView.addSubview(subView)
//            currentViewOffSet += heightOfSubView
//
//        }
        
        let lable = UILabel()
        lable.text = "12345"
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.backgroundColor = .cyan
        scrollView.addSubview(lable)
        lable.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 50).isActive = true
        lable.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 50).isActive = true
        lable.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -50).isActive = true
        lable.heightAnchor.constraint(equalToConstant: 50).isActive = true
   
    
        
        let button = UIButton()
        
        button.titleLabel?.text = "This is button"
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .green
        scrollView.addSubview(button)
        button.topAnchor.constraint(equalTo: lable.bottomAnchor, constant: 150).isActive = true
        button.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 50).isActive = true
        button.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: widthOfScrollView).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50)
      
        
        let redView = UIView()
        redView.backgroundColor = .red
        redView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(redView)
        redView.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 800).isActive = true
        redView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 50).isActive = true
        redView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -50).isActive = true
        redView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
     
        redView.heightAnchor.constraint(equalToConstant: 800).isActive = true
        redView.widthAnchor.constraint(equalToConstant: widthOfScrollView).isActive = true
        
        
        
        
        

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
