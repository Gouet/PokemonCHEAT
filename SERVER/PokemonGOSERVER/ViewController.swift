//
//  ViewController.swift
//  PokemonGOSERVER
//
//  Created by Victor Gouet on 08/08/2016.
//  Copyright © 2016 Victor Gouet. All rights reserved.
//

import Cocoa
import MapKit


class ViewController: NSViewController {
    @IBOutlet weak var fileName: NSTextField!
    @IBOutlet weak var createButton: NSButton!
    
    var actualLocation : CLLocationCoordinate2D? = nil
    
    @IBAction func onCreateAction(sender: AnyObject) {
        // on creer le file
        self.createButton.alphaValue = 0
        self.fileName.alphaValue = 0
//        
        if (actualLocation != nil)
        {
            GPXCreator(location: actualLocation!, name: fileName.stringValue).createFile()
        }
        else
        {
            print("NULL")
        }
//        print(actualLocation)
//        print(fileName.stringValue)
        
        fileName.enabled = false
        fileName.stringValue = ""
    }
    
    private func onAppearToAct() {
        self.fileName.alphaValue = 1
        self.createButton.alphaValue = 1
        fileName.enabled = true
    }
    
    private func onLaunchServer() {
        let server:TCPServer = TCPServer(addr: IP, port: PORT)
        let (success, msg) = server.listen()
        var client : TCPClient? = nil
        //        var clientArray: [TCPClient] = [TCPClient]()
        
        if success {
            NSLog("on attend un client ...")
            if let newClient = server.accept()
                {
                    client = newClient
                }
            else
            {
                NSLog("accept error")
                abort()
            }
            NSLog("client trouvé")
        }
        
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        dispatch_async(dispatch_get_global_queue(priority, 0)) {
            
            if success {
                
                
                while (client != nil)
                {
                   
                    let data = client?.read(300, timeout: 0)
                    
                    if let d = data
                    {
                        if let str = String(bytes: d, encoding: NSUTF8StringEncoding)
                        {
                            let location : CLLocationCoordinate2D = CLLocationCoordinate2D.convertToString(str)
//                            NSLog("\(location.latitude)")
//                            NSLog("\(location.longitude)")
                            
                            dispatch_async(dispatch_get_main_queue(), {
                                self.actualLocation = location
                                self.onAppearToAct()
                                // code here on the main thread
                            })
                            
                        }
                    }
                    else
                    {
                        // A Y'a plus le client
                        server.close()
                        abort()
                    }
                    
                }
            }
            else
            {
                NSLog(msg)
            }
            
        }
        server.close()
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        onLaunchServer()
        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

