//
//  PinDotView.swift
//  Point of Sale
//
//  Created by Jelle Vandebeeck on 13/10/2016.
//  Copyright © 2016 iCapps. All rights reserved.
//

import UIKit

@available(iOS 9, *)
class PinDotView: UIView {
    
    // MARK: - Configuration
    
    /// Set the configuration.
    var configuration = PinConfiguration() {
        didSet {
            setNeedsDisplay()
        }
    }
    
    // MARK: - Layout Configuration
    
    fileprivate let dotSize: CGFloat = 12.0
    fileprivate let dotPadding: CGFloat = 12.0
    
    // MARK: - Size
    
    var currentSize: Int = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    // MARK: - Size
    
    override var intrinsicContentSize: CGSize {
        let width: CGFloat = dotSize * CGFloat(configuration.numberOfDigits) + (dotPadding * (CGFloat(configuration.numberOfDigits) - 1))
        return CGSize(width: width, height: dotSize)
    }
    
    // MARK: - Drawing
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        
        var previousBubbleRect: CGRect? = nil
        for index in 0..<configuration.numberOfDigits {
            var x: CGFloat = 0
            if let previousBubbleRect = previousBubbleRect {
                x = previousBubbleRect.maxX + dotPadding
            }
            let rect = CGRect(x: x, y: 0, width: dotSize, height: dotSize)
            previousBubbleRect = rect
            
            if index >= currentSize {
                context?.setStrokeColor(configuration.dotStrokeColor.cgColor)
                context?.strokeEllipse(in: rect)
                context?.setFillColor(configuration.emptyDotColor.cgColor)
                context?.fillEllipse(in: rect.insetBy(dx: 0.5, dy: 0.5))
            } else {
                context?.setFillColor(configuration.dotColor.cgColor)
                context?.fillEllipse(in: rect)
            }
        }
    }
    
}
