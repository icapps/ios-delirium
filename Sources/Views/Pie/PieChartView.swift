//
//  PieChartView.swift
//  Delirium
//
//  Created by Jelle Vandebeeck on 23/08/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

/// This view is responsible for drawing the pie chart.
public class PieChartView: UIView {
    
    // MARK: - Configuration
    
    /// This is the color of the circle that is drawn over the center of the pie chart. When giving this color an alpha value the pie chart is broken nicely.
    public var overlayColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.85) {
        didSet {
            setNeedsDisplay()
        }
    }
    
    /// This color is the color that is displayed between the slices.
    public var strokeColor = UIColor.whiteColor() {
        didSet {
            setNeedsDisplay()
        }
    }
    
    /// This is the size of the padding from where the overlay circle will be displayed.
    public var overlayPadding: Float = 40.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    // MARK: - Internals
    
    private var startAngle = -Float(M_PI * 0.5)
    private var slices = [PieChartSlice]()
    
    // MARK: - Slices
    
    /// Add a slice to the pie chart.
    ///
    /// - Parameter slice: The `PieChartSlice` to add to the pie chart.
    public func add(slice slice: PieChartSlice) {
        slices.append(slice)
        setNeedsDisplay()
    }
    
    /// Remove all the slices from the pie chart.
    public func removeAllSlices() {
        slices.removeAll()
        setNeedsDisplay()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
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
            // Calculate the endAngle
            let endAngle = currentStartAngle + Float(M_PI * 2.0) * (slice.value / valueCount)
            
            // Draw the slice.
            CGContextSetFillColorWithColor(context, slice.color.CGColor)
            CGContextMoveToPoint(context, center.x, center.y)
            CGContextAddArc(context, center.x, center.y, radius, CGFloat(currentStartAngle), CGFloat(endAngle), 0)
            CGContextFillPath(context)
            
            // Draw the line.
            CGContextSetStrokeColorWithColor(context, strokeColor.CGColor)
            CGContextMoveToPoint(context, center.x, center.y)
            let pointX = CGFloat(cos(currentStartAngle)) * radius + center.x
            let pointY = CGFloat(sin(currentStartAngle)) * radius + center.y
            CGContextAddLineToPoint(context, pointX, pointY)
            CGContextStrokePath(context)
            
            // Persist the current start angle for the next slice.
            currentStartAngle = endAngle
        }
        
        // Draw the inner circle.
        CGContextSetFillColorWithColor(context, overlayColor.CGColor)
        CGContextMoveToPoint(context, center.x, center.y)
        CGContextAddEllipseInRect(context, CGRectInset(rect, CGFloat(overlayPadding), CGFloat(overlayPadding)))
        CGContextFillPath(context)
    }
    
}