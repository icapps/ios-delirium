//
//  UIFont+ChalkboardPreferred.swift
//  Delirium
//
//  Created by Nikki Vergracht on 31/05/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

/// Example extension you could use in your app with your own fontFamily in order to not having to pass the fontFamily every time.
extension UIFont {
    
    @nonobjc static var fontFamily = "Chalkboard SE" // Don't use this font family, ever.
    
    class func preferredCustomFont(for style: UIFontTextStyle) -> UIFont {
        return UIFont.preferredFont(with: fontFamily, for: style)
    }
    
    @available(iOS 10.0, *)
    class func preferredCustomFont(for style: UIFontTextStyle, compatibleWith traitCollection: UITraitCollection?) -> UIFont {
        return UIFont.preferredFont(with: fontFamily, for: style, compatibleWith: traitCollection)
    }
}
