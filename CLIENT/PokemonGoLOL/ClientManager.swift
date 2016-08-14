//
//  ClientManager.swift
//  PokemonGoLOL
//
//  Created by Victor Gouet on 08/08/2016.
//  Copyright © 2016 Victor Gouet. All rights reserved.
//

import Foundation

class ClientManager {
    var client:TCPClient = TCPClient(addr: IP, port: PORT)
    
     class var Shared : ClientManager {
        get {
            struct Static {
                static var instance : ClientManager? = nil
                static var token : dispatch_once_t = 0
            }
            dispatch_once(&Static.token) { Static.instance = ClientManager() }
            return Static.instance!
        }
    }
    
    
    
}