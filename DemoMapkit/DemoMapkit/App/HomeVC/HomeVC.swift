//
//  HomeVC.swift
//  DemoMapkit
//
//  Created by Apple on 6/8/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
import MapKit

class HomeVC: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var currentLocationuser: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let eiffelTowerLocation = CLLocation(latitude: 48.858042, longitude:  2.294793)
        // khoang cacsh chieu ngang va doc vung lanh tho hien thi tren map
        // lat long: tinh bang do, phut , giay
        // 1 do cua vi do = 111km
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: eiffelTowerLocation.coordinate, span: span)
        mapView.region = region
    }
    
    func center(location: CLLocation)  {
        mapView.setCenter(location.coordinate, animated: true)
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: location.coordinate, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    @IBAction func onTapCurrentLocationUser(_ sender: Any) {
        LocationManager.shared.getCurrentLocation { (location) in
            self.center(location: location)
        }
        
    }




}
