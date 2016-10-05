//
//  PieChartView.swift
//  Delirium
//
//  Created by Jelle Vandebeeck on 23/08/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

/// This view is responsible for drawing the pie chart.
open class PieChartView: UIView {
    
    // MARK: - Configuration
    
    /// This is the color of the circle that is drawn over the center of the pie chart. When giving this color an alpha value the pie chart is broken nicely.
    open var overlayColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.85) {
        didSet {
            setNeedsDisplay()
        }
    }
    
    /// This color is the color that is displayed between the slices.
    open var strokeColor = UIColor.white {
        didSet {
            setNeedsDisplay()
        }
    }
    
    /// This is the size of the padding from where the overlay circle will be displayed.
    open var overlayPadding: Float = 40.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    // MARK: - Internals
    
    fileprivate var startAngle = -Float(M_PI * 0.5)
    fileprivate var slices = [PieChartSlice]()
    
    // MARK: - Slices
    
    /// Add a slice to the pie chart.
    ///
    /// - Parameter slice: The `PieChartSlice` to add to the pie chart.
    open func add(slice: PieChartSlice) {
        slices.append(slice)
        setNeedsDisplay()
    }
    
    /// Remove all the slices from the pie chart.
    open func removeAllSlices() {
        slices.removeAll()
        setNeedsDisplay()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        setNeedsDisplay()
    }
    
    // MARK: - Drawing
    
    open override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
    
        let radius = min(frame.size.width, frame.size.height) * 0.5
        let center = CGPoint(x: bounds.size.width * 0.5, y: bounds.size.height * 0.5)
        let valueCount = slices.reduce(0) { $0 + $1.value }
        let shouldDrawLines = slices.count > 1
        var currentStartAngle = startAngle
        
        for slice in slices {
            // Calculate the endAngle
            let endAngle = currentStartAngle + Float(M_PI * 2.0) * (slice.value / valueCount)
            
            // Draw the slice.
            context?.setFillColor(slice.color.cgColor)
            context?.move(to: CGPoint(x: center.x, y: center.y))
            context?.addArc(center: center, radius: radius, startAngle: CGFloat(currentStartAngle), endAngle: CGFloat(endAngle), clockwise: false)
            context?.fillPath()
            
            // Persist the current start angle for the next slice.
            currentStartAngle = endAngle
        }
        
        if shouldDrawLines {
            currentStartAngle = startAngle
            for slice in slices {
                // Calculate the endAngle
                let endAngle = currentStartAngle + Float(M_PI * 2.0) * (slice.value / valueCount)
                
                // Draw the line.
                context?.setStrokeColor(strokeColor.cgColor)
                context?.move(to: CGPoint(x: center.x, y: center.y))
                let pointX = CGFloat(cos(currentStartAngle)) * radius + center.x
                let pointY = CGFloat(sin(currentStartAngle)) * radius + center.y
                context?.addLine(to: CGPoint(x: pointX, y: pointY))
                context?.strokePath()
                
                // Persist the current start angle for the next slice.
                currentStartAngle = endAngle
            }
        }
        
        // Draw the inner circle.
        context?.setFillColor(overlayColor.cgColor)
        context?.move(to: CGPoint(x: center.x, y: center.y))
        context?.addEllipse(in: rect.insetBy(dx: CGFloat(overlayPadding), dy: CGFloat(overlayPadding)))
        context?.fillPath()
    }
    
}
