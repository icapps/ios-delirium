//
//  PinButton.swift
//  Point of Sale
//
//  Created by Jelle Vandebeeck on 13/10/2016.
//  Copyright © 2016 iCapps. All rights reserved.
//

import UIKit

@available(iOS 9, *)
public enum PinButtonType {
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
public class PinButton: UIButton {
    
    // MARK: - Configuration
    
    /// Pass the type used for the code.
    public internal(set) var type = PinButtonType.clear
    
    /// Set the configuration.
    var pinConfiguration = PinConfiguration() {
        didSet {
            setTitleColor(type.titleColor(for: pinConfiguration), for: UIControl.State())
            titleLabel?.font = pinConfiguration.buttonFont
            setNeedsDisplay()
        }
    }
    
    // MARK: - Layout
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = bounds.size.height / 2.0
        layer.masksToBounds = true
    }
    
    // MARK: - Touch
    
    override public var isHighlighted: Bool {
        didSet {
            setNeedsDisplay()
        }
    }
    
    // MARK: - Drawing
    
    override public func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        
        context?.setFillColor(type.strokeColor(for: pinConfiguration).cgColor)
        context?.fillEllipse(in: rect)
        if isHighlighted && pinConfiguration.allowSelectionFeedback {
            context?.setFillColor(type.selectionBackgroundColor(for: pinConfiguration).cgColor)
        } else {
            context?.setFillColor(pinConfiguration.backgroundColor.cgColor)
        }
        context?.fillEllipse(in: rect.insetBy(dx: 0.5, dy: 0.5))
    }
    
}
