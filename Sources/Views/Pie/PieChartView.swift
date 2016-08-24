//
//  PieChartView.swift
//  Delirium
//
//  Created by Jelle Vandebeeck on 23/08/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

public class PieChartView: UIView {
    
    // MARK: - Configuration
    
    public var startAngle = -Float(M_PI * 0.5)
    
    // MARK: - Internals
    
    private var slices = [PieChartSlice]()
    
    // MARK: - Slices
    
    public func add(slice slice: PieChartSlice) {
        slices.append(slice)
        setNeedsDisplay()
    }
    
    public func removeAllSlices() {
        slices.removeAll()
        setNeedsDisplay()
    }
    
    // MARK: - Drawing
    
    public override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
    
        let radius = min(frame.size.width, frame.size.height) * 0.5
        let center = CGPoint(x: bounds.size.width * 0.5, y: bounds.size.height * 0.5)
        let valueCount = slices.reduce(0) { $0 + $1.value }
        var currentStartAngle = startAngle
        
        for slice in slices {
            CGContextSetFillColorWithColor(context, slice.color.CGColor)
            
            // Calculate the endAngle
            let endAngle = currentStartAngle + Float(M_PI * 2.0) * (slice.value / valueCount)
            
            // Draw the slice.
            CGContextMoveToPoint(context, center.x, center.y)
            CGContextAddArc(context, center.x, center.y, radius, CGFloat(currentStartAngle), CGFloat(endAngle), 0)
            CGContextFillPath(context)
            
            // Persist the current start angle for the next slice.
            currentStartAngle = endAngle
        }
    }
    
}