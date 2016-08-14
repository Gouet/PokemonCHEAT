//
//  UserLocation.swift
//  PokemonGoLOL
//
//  Created by Victor Gouet on 08/08/2016.
//  Copyright © 2016 Victor Gouet. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import MapKit
import CoreLocation

class UserLocation: CLLocationManager, CLLocationManagerDelegate {
    private var mapView:PokeMap
    
    init(mapView:PokeMap) {
        self.mapView = mapView
        
        super.init()
    }
    
    func requestForLocation() {
        if CLLocationManager.locationServicesEnabled() {
            self.desiredAccuracy = kCLLocationAccuracyBest
            self.delegate = self
            self.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.AuthorizedWhenInUse {
            mapView.showsUserLocation = true
        }  else {
            mapView.showsUserLocation = false
            self.stopUpdatingLocation()
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if mapView != nil {
//            mapView!.onUserLocation()
//        }
    }
}