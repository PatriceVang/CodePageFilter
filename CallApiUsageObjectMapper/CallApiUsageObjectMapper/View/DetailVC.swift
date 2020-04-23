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
        let heightOfScrollView = scrollView.bounds.height * 2
        scrollView.contentSize = CGSize(width: widthOfScrollView, height: heightOfScrollView)
        
        let heightOfSubView = CGFloat(120)
        
        //bien tam
        var currentViewOffSet = CGFloat(0)
        
        while currentViewOffSet < heightOfScrollView {
            let subView = UIView(frame: CGRect(x: 0, y: currentViewOffSet, width: widthOfScrollView, height: heightOfSubView).insetBy(dx: 5, dy: 5))
            let hue = UIColor(hue: currentViewOffSet/heightOfScrollView, saturation: 1, brightness: 1, alpha: 1)
            subView.backgroundColor = hue
            scrollView.addSubview(subView)
            currentViewOffSet += heightOfSubView
            
        }
        

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
