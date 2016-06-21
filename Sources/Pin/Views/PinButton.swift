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
            setTitleColor(configuration.numberTextColor, forState: .Normal)
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
    
    override var highlighted: Bool {
        didSet {
            setNeedsDisplay()
        }
    }
    
    // MARK: - Drawing
    
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        
        CGContextSetFillColorWithColor(context, configuration.numberStrokeColor.CGColor)
        CGContextFillEllipseInRect(context, rect)
        if highlighted {
            CGContextSetFillColorWithColor(context, configuration.selectionBackgroundColor.CGColor)
        } else {
            CGContextSetFillColorWithColor(context, configuration.backgroundColor.CGColor)
        }
        CGContextFillEllipseInRect(context, CGRectInset(rect, 0.5, 0.5))
    }
    
}
