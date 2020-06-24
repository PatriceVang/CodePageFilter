//
//  HomeVC.swift
//  DemoMapBox
//
//  Created by Apple on 6/8/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
import Mapbox

class HomeVC: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let mapView = MGLMapView(frame: view.bounds)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
         
        // Set the map’s center coordinate and zoom level.
        mapView.setCenter(CLLocationCoordinate2D(latitude: 59.31, longitude: 18.06), zoomLevel: 9, animated: false)
        view.addSubview(mapView)
    
    }

}

extension HomeVC: MGLMapViewDelegate {
  
}
