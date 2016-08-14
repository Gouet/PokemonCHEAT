//
//  CLLocationExtension.swift
//  PokemonGOSERVER
//
//  Created by Victor Gouet on 08/08/2016.
//  Copyright © 2016 Victor Gouet. All rights reserved.
//

import Foundation
import MapKit

extension CLLocationCoordinate2D {
    static func convertToString(data:String) -> CLLocationCoordinate2D {
        var location = CLLocationCoordinate2D()
        
        let locationData = data.characters.split{$0 == "\n"}.map(String.init)
        
        let lat = locationData[0].characters.split{$0 == " "}.map(String.init)
        let lng = locationData[1].characters.split{$0 == " "}.map(String.init)
        
        location.latitude = CLLocationDegrees(lat[1])!
        location.longitude = CLLocationDegrees(lng[1])!
        
        return location
    }
}