//
//  PinButton.swift
//  Delirium
//
//  Created by Jelle Vandebeeck on 13/06/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class PinButton: UIButton {
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = bounds.size.height / 2.0
        layer.masksToBounds = true
    }
    
}