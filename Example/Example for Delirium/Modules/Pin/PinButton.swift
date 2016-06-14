//
//  PinButton.swift
//  Delirium
//
//  Created by Jelle Vandebeeck on 13/06/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class PinButton: UIButton {
    
    // MARK: - Init
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setTitleColor(UIColor(red:0.07, green:0.18, blue:0.33, alpha:1.00), forState: .Normal)
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
        
        CGContextSetFillColorWithColor(context, UIColor(red:0.72, green:0.76, blue:0.80, alpha:1.00).CGColor)
        CGContextFillEllipseInRect(context, rect)
        if highlighted {
            CGContextSetFillColorWithColor(context, UIColor(red:0.90, green:0.91, blue:0.93, alpha:1.00).CGColor)
        } else {
            CGContextSetFillColorWithColor(context, UIColor.whiteColor().CGColor)
        }
        CGContextFillEllipseInRect(context, CGRectInset(rect, 0.5, 0.5))
    }
    
}
