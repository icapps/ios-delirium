//
//  UIFont+DynamicTypeCustom.swift
//  Pods
//
//  Created by Nikki Vergracht on 22/05/2017.
//
//

import UIKit

extension UIFont {

    /// Uses the `descriptor` and `family` provided to return a custom UIFont compatible with the Dynamic Type selected in the user's settings.
    private class func preferredFont(for descriptor: UIFontDescriptor, with family: String) -> UIFont {
        let customFontDescriptor = UIFontDescriptor.init(fontAttributes: [
            UIFontDescriptor.AttributeName.family: family,
            UIFontDescriptor.AttributeName.size: descriptor.pointSize
            ])
        return UIFont(descriptor: customFontDescriptor, size: 0)
    }
    
    /// Returns a UIFont based on the provided `fontFamily` String with the preferred font size.
    /// - Parameters: 
    ///     - family: The font family to be used.
    ///     - style: The font text style to be used. For a list of available fonts, print `UIFont.familyNames`.
    public class func preferredFont(with family:String, for style: UIFont.TextStyle) -> UIFont {
        let systemFontDescriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: style)
        return preferredFont(for: systemFontDescriptor, with: family)
    }
    
    /// Returns a UIFont based on the provided font `family` string with the preferred font size compatible with the provided `traitCollection`.
    /// Available from iOS 10.0 upwards.
    /// - Parameters:
    ///     - family: The font family to be used.
    ///     - style: The font text style to be used. For a list of available fonts, print `UIFont.familyNames`.
    @available(iOS 10.0, tvOS 10.0, *)
    public class func preferredFont(with family:String, for style: UIFont.TextStyle, compatibleWith traitCollection: UITraitCollection?) -> UIFont {
        let systemFontDescriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: style, compatibleWith: traitCollection)
        return preferredFont(for: systemFontDescriptor, with: family)
    }
    
}
