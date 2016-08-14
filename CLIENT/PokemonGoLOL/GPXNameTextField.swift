//
//  GPXNameTextField.swift
//  PokemonGoLOL
//
//  Created by Victor Gouet on 08/08/2016.
//  Copyright © 2016 Victor Gouet. All rights reserved.
//

import Foundation
import UIKit

class GPXNameTextField: UITextField {
    
    func onAppear() {
        UIView.animateWithDuration(0.5) {
            self.alpha = 1
        }
    }
    
    func onDisappear() {
        UIView.animateWithDuration(0.5) { 
            self.alpha = 0
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        onDisappear()
        print("ok")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        onDisappear()
        print("lol")
    }
    
}