import UIKit

extension UIView {
    
    public func shake(repeatCount repeatCount: Float = 4, duration duration: CFTimeInterval = 0.07) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = duration
        animation.repeatCount = repeatCount
        animation.autoreverses = true
        animation.fromValue = NSValue(CGPoint: CGPointMake(center.x - 10, center.y))
        animation.toValue = NSValue(CGPoint: CGPointMake(center.x + 10, center.y))
        layer.addAnimation(animation, forKey: "position")
    }
    
}