//
//  UIView+Shake.swift
//  Pods
//
//  Created by Jelle Vandebeeck on 08/06/16.
//
//

import UIKit

extension UIView {
    
    /// Shake a `UIView`.
    ///
    /// ```
    /// view.shake()
    /// view.shake(repeatCount: 10, duration: 1.0)
    /// ```
    ///
    /// - Parameter repeatCount: How many times the animation is repeated.
    /// - Parameter duration: The duration of the animation.
    public func shake(repeatCount: Float = 4, duration: CFTimeInterval = 0.07) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = duration
        animation.repeatCount = repeatCount
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: center.x - 10, y: center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: center.x + 10, y: center.y))
        layer.add(animation, forKey: "position")
    }
    
}
