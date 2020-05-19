//
//  HOMEVC.swift
//  ThePartYoutubeApp
//
//  Created by Apple on 5/14/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
import XLPagerTabStrip
class HomeAuthorVC: UIViewController, IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "HOME")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
