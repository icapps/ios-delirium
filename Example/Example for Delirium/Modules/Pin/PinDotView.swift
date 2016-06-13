//
//  PinView.swift
//  Delirium
//
//  Created by Jelle Vandebeeck on 13/06/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class PinDotView: UIView {
    
    let size: Int = 4
    
    var currentSize: Int = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    // MARK: - Configuration
    
    let dotSize: CGFloat = 20.0
    let dotPadding: CGFloat = 10.0
    
    // MARK: - Size
    
    override func intrinsicContentSize() -> CGSize {
        let width: CGFloat = dotSize * CGFloat(size) + (dotPadding * (CGFloat(size) - 1))
        return CGSize(width: width, height: dotSize)
    }
    
    // MARK: - Drawing
    
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        
        var previousBubbleRect: CGRect? = nil
        for index in 0..<size {
            var x: CGFloat = 0
            if let previousBubbleRect = previousBubbleRect {
                x = CGRectGetMaxX(previousBubbleRect) + dotPadding
            }
            let rect = CGRect(x: x, y: 0, width: dotSize, height: dotSize)
            previousBubbleRect = rect
            
            CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
            CGContextFillEllipseInRect(context, rect)
            if index >= currentSize {
                CGContextSetFillColorWithColor(context, UIColor.whiteColor().CGColor)
                CGContextFillEllipseInRect(context, CGRectInset(rect, 2.0, 2.0))
            }
        }
    }
    
}