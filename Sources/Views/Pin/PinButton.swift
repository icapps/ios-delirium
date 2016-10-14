//
//  PinButton.swift
//  Point of Sale
//
//  Created by Jelle Vandebeeck on 13/10/2016.
//  Copyright © 2016 iCapps. All rights reserved.
//

import UIKit

@available(iOS 9, *)
enum PinButtonType {
    case number(Int)
    case clear
    
    var value: Int? {
        switch self {
        case .number(let value):
            return value
        case .clear:
            return nil
        }
    }
    
    func titleColor(for configuration: PinConfiguration) -> UIColor {
        switch self {
        case .number(_):
            return configuration.numberTextColor
        case .clear:
            return configuration.clearTextColor
        }
    }
    
    func strokeColor(for configuration: PinConfiguration) -> UIColor {
        switch self {
        case .number(_):
            return configuration.numberStrokeColor
        case .clear:
            return configuration.clearStrokeColor
        }
    }
    
    func selectionBackgroundColor(for configuration: PinConfiguration) -> UIColor {
        switch self {
        case .number(_):
            return configuration.selectionBackgroundColor
        case .clear:
            return configuration.clearSelectionBackgroundColor
        }
    }
}

@available(iOS 9, *)
class PinButton: UIButton {
    
    // MARK: - Configuration
    
    /// Pass the type used for the code.
    var type = PinButtonType.clear
    
    /// Set the configuration.
    var configuration = PinConfiguration() {
        didSet {
            setTitleColor(type.titleColor(for: configuration), for: UIControlState())
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
        
        context?.setFillColor(type.strokeColor(for: configuration).cgColor)
        context?.fillEllipse(in: rect)
        if isHighlighted {
            context?.setFillColor(type.selectionBackgroundColor(for: configuration).cgColor)
        } else {
            context?.setFillColor(configuration.backgroundColor.cgColor)
        }
        context?.fillEllipse(in: rect.insetBy(dx: 0.5, dy: 0.5))
    }
    
}
