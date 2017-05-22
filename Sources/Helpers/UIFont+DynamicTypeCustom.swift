//
//  UIFont+DynamicTypeCustom.swift
//  Pods
//
//  Created by Nikki Vergracht on 22/05/2017.
//
//

import UIKit

/// Available from iOS & tvOS 7.0 upwards.
@available(iOS 7.0, tvOS 7.0, *)
extension UIFont {
    
    /// Uses the `fontDescriptor` and `fontFamily` provided to return a custom UIFont compatible with the Dynamic Type selected in the user's settings.
    private class func preferredFont(forFontDescriptor fontDescriptor: UIFontDescriptor, withFontFamily fontFamily: String) -> UIFont {
        let customFontDescriptor = UIFontDescriptor.init(fontAttributes: [
            UIFontDescriptorFamilyAttribute: fontFamily,
            UIFontDescriptorSizeAttribute: fontDescriptor.pointSize
            ])
        return UIFont(descriptor: customFontDescriptor, size: 0)
    }
    
    /// Returns a UIFont based on the provided `fontFamily` String with the preferred font size.
    public class func preferredFont(withFontFamily fontFamily:String, forTextStyle style: UIFontTextStyle) -> UIFont {
        let systemFontDescriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: style)
        return preferredFont(forFontDescriptor: systemFontDescriptor, withFontFamily: fontFamily)
    }
    
    /// Returns a UIFont based on the provided `fontFamily` String with the preferred font size compatible with the provided `traitCollection`.
    /// Available from iOS 10.0 upwards.
    @available(iOS 10.0, tvOS 10.0, *)
    public class func preferredFont(withFontFamily fontFamily:String, forTextStyle style: UIFontTextStyle, compatibleWith traitCollection: UITraitCollection?) -> UIFont {
        let systemFontDescriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: style, compatibleWith: traitCollection)
        return preferredFont(forFontDescriptor: systemFontDescriptor, withFontFamily: fontFamily)
    }
    
}
