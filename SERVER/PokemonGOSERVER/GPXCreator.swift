//
//  GPXCreator.swift
//  PokemonGOSERVER
//
//  Created by Victor Gouet on 09/08/2016.
//  Copyright © 2016 Victor Gouet. All rights reserved.
//
//<?xml version="1.0"?>
//<gpx version="1.1" creator="Xcode">
//    
//    <!--
//Provide one or more waypoints containing a latitude/longitude pair. If you provide one
//waypoint, Xcode will simulate that specific location. If you provide multiple waypoints,
//Xcode will simulate a route visitng each waypoint.
//-->
//<wpt lat="46.1579806" lon="-1.1529751">
//<name>Cupertino</name>
//
//<!--
//Optionally provide a time element for each waypoint. Xcode will interpolate movement
//at a rate of speed based on the time elapsed between each waypoint. If you do not provide
//a time element, then Xcode will use a fixed rate of speed.
//
//Waypoints must be sorted by time in ascending order.
//-->
//<time>2014-09-24T14:55:37Z</time>
//</wpt>
//
//</gpx>

import Foundation
import MapKit

class GPXCreator {
    
    private let header = "<?xml version=\"1.0\"?>\n"
    private let version = "<gpx version=\"1.1\" creator=\"Xcode\">\n"
    private let time = "<time>2014-09-24T14:55:37Z</time>\n"
    private let endwgpt = "</wpt>\n"
    private let endgpx = "</gpx>\n"
    
    private var location : CLLocationCoordinate2D
    private var name : String
    private var fd:Int = -1
    
    init(location: CLLocationCoordinate2D, name: String) {
        self.location = location
        self.name = name
    }
    
    deinit {
        
    }
    
    func createFile() {
        let fd = open(PATH + name + ".gpx", O_WRONLY | O_CREAT, 0o644)
        if fd == -1
        {
            print("FAILED")
        }
        else
        {
            let printLocation = "<wpt lat=\"\(location.latitude)\" lon=\"\(location.longitude)\">\n"
            let printName = "<name>\(name)</name>\n"
            
            write(fd, header, header.characters.count)
            write(fd, version, version.characters.count)
            write(fd, printLocation, printLocation.characters.count)
            write(fd, printName, printName.characters.count)
            write(fd, endwgpt, endwgpt.characters.count)
            write(fd, endgpx, endgpx.characters.count)
            
            print("suceess")
        }
    }
    
}