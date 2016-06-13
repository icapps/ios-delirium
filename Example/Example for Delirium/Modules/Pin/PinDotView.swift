//
//  PinView.swift
//  Delirium
//
//  Created by Jelle Vandebeeck on 13/06/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class PinDotView: UIView {
    
    // MARK: - Configuration
    
    var size: Int = 4 {
        didSet {
            invalidateIntrinsicContentSize()
            setNeedsDisplay()
        }
    }
    
    var dotSize: CGFloat = 16.0 {
        didSet {
            invalidateIntrinsicContentSize()
            setNeedsDisplay()
        }
    }
    
    var dotPadding: CGFloat = 6.0 {
        didSet {
            invalidateIntrinsicContentSize()
            setNeedsDisplay()
        }
    }
    
    // MARK: - Size
    
    var currentSize: Int = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
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