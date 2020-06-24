//
//  LocationManager.swift
//  DemoMapkit
//
//  Created by Apple on 6/8/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import CoreLocation

typealias LocationCompletion = ((CLLocation) -> ())


class LocationManager: NSObject {
    static var shared = LocationManager()
    
    private let locationManager = CLLocationManager()
    private var currentLocation: CLLocation?
    private var currentCompletion: LocationCompletion?
    private var locationCompletion: LocationCompletion?
    private var isUpdatingLocation = false
    
    
    override init() {
        super.init()
        configLocationManager()
    }
    
    private func configLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 10
        locationManager.allowsBackgroundLocationUpdates = true
        
    }
}

extension LocationManager:  CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways:
            print("user allow app to get location data when app is active or in background")
            manager.requestLocation()
        case .authorizedWhenInUse:
            print("user allow app to get location data only when app is active")
            manager.requestLocation()
        case .denied:
             print("user tap 'disallow' on the permission dialog, cant get location data")
        case .restricted:
            print("parental control setting disallow location data")
        case .notDetermined:
             print("the location permission dialog haven't shown before, user haven't tap allow/disallow")
        default:
            print("defult")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            self.currentLocation = location
            currentCompletion!(location)
            locationCompletion!(location)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Err: \(error.localizedDescription)")
    }
}

extension LocationManager {
    // quyen truy cap tu ng dung
    public func request() {
        let status = CLLocationManager.authorizationStatus()
        if status == .denied || status == .restricted || !CLLocationManager.locationServicesEnabled() {
            return
        }
        
        if status == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
            return
        }
        
        locationManager.requestLocation()
    }
    
    // lay curent location
    func getCurrentLocation() -> CLLocation? {
        return currentLocation
    }
    func getCurrentLocation(completion: @escaping LocationCompletion) {
        currentCompletion = completion
        locationManager.requestLocation()
    }
    
    // kich hoat tracking
    //nhan dulieu vaf vitri moi nhat ng dung lay dc
    func startUpdating(completion: @escaping LocationCompletion) {
        locationCompletion = completion
        isUpdatingLocation = true
        locationManager.startUpdatingLocation()
    }
    // stop tracking
    func stopUpdating() {
        locationManager.stopUpdatingLocation()
        isUpdatingLocation = false
    }
}
