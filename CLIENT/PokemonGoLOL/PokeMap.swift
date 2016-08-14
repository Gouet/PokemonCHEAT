//
//  PokeMap.swift
//  PokemonGoLOL
//
//  Created by Victor Gouet on 08/08/2016.
//  Copyright © 2016 Victor Gouet. All rights reserved.
//

import Foundation
import MapKit
import UIKit

class PokeMap : MKMapView {
    var actualUserLocation : UserLocation!
    
    func onSelectLongPressLocation(gestureReconizer: UIGestureRecognizer) {
        if (gestureReconizer.state != UIGestureRecognizerState.Began) {
            return
        }
        
        
        let location = gestureReconizer.locationInView(self)
        let coordinate = self.convertPoint(location,toCoordinateFromView: self)
        
        ClientManager.Shared.client.send(str: "lat \(coordinate.latitude)\nlon \(coordinate.longitude)\n")
        print("SEND")
    }
    
    private func constructorLongPressLocation() {
        let longPressLocation = UILongPressGestureRecognizer(target: self, action: #selector(PokeMap.onSelectLongPressLocation(_:)))
        longPressLocation.minimumPressDuration = 1.0
        self.addGestureRecognizer(longPressLocation)
    }

    private func constructorActualUserLocation() {
        actualUserLocation = UserLocation(mapView: self)
        actualUserLocation.requestForLocation()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        constructorLongPressLocation()
        constructorActualUserLocation()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        constructorLongPressLocation()
        constructorActualUserLocation()
        
    }
    
}