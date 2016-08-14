//
//  ViewController.swift
//  PokemonGoLOL
//
//  Created by Victor Gouet on 08/08/2016.
//  Copyright © 2016 Victor Gouet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var pokeMap: PokeMap!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ClientManager.Shared.client.connect(timeout: 1)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

