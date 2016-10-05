//
//  PinButton.swift
//  Delirium
//
//  Created by Jelle Vandebeeck on 13/06/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class PinButton: UIButton {
    
    // MARK: - Configuration
    
    var configuration = PinConfiguration() {
        didSet {
            setTitleColor(configuration.numberTextColor, for: UIControlState())
            setNeedsDisplay()
        }
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = bounds.size.height / 2.0
        layer.masksToBounds = true
    }
    
    // MARK: - Touch
    
    override var isHighlighted: Bool {
        didSet {
            setNeedsDisplay()
        }
    }
    
    // MARK: - Drawing
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        
        context?.setFillColor(configuration.numberStrokeColor.cgColor)
        context?.fillEllipse(in: rect)
        if isHighlighted {
            context?.setFillColor(configuration.selectionBackgroundColor.cgColor)
        } else {
            context?.setFillColor(configuration.backgroundColor.cgColor)
        }
        context?.fillEllipse(in: rect.insetBy(dx: 0.5, dy: 0.5))
    }
    
}
