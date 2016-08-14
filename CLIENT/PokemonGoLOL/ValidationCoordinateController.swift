//
//  ValidationCoordinateController.swift
//  PokemonGoLOL
//
//  Created by Victor Gouet on 08/08/2016.
//  Copyright © 2016 Victor Gouet. All rights reserved.
//

import Foundation
import MapKit
import UIKit

class ValidationCoordinateController: UIViewController {
    private var coordinate : CLLocationCoordinate2D = CLLocationCoordinate2D()
    
    func setCoordinate(location:CLLocationCoordinate2D) {
        coordinate = location
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }
}