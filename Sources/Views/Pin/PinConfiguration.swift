//
//  PinConfiguration.swift
//  Point of Sale
//
//  Created by Jelle Vandebeeck on 13/10/2016.
//  Copyright © 2016 iCapps. All rights reserved.
//

import UIKit

/// You can configure the pin view with this struct.
@available(iOS 9, *)
public struct PinConfiguration {
    
    /// Define the size of the buttons.
    public var buttonSize: CGFloat = 60.0

    /// Define the font of the buttons.
    public var buttonFont = UIFont.systemFont(ofSize: 18.0)
    
    /// Define the number of digits you want to enter.
    public var numberOfDigits: Int = 4
    
    /// The color of the filled dot at the top of the pin view.
    public var dotColor = UIColor.gray
    
    /// The color of the stroked dot at the top of the pin view.
    public var dotStrokeColor = UIColor.gray
    
    /// The color of the stroked pin number button.
    public var numberStrokeColor = UIColor.gray
    
    /// The color of the highlighted background in the pin number button.
    public var selectionBackgroundColor = UIColor.lightGray
    
    /// The color of the stroked clear button.
    public var clearStrokeColor = UIColor.red
    
    /// The color of the highlighted background in the clear button.
    public var clearSelectionBackgroundColor = UIColor.lightGray
    
    /// The color of the text in the clear button.
    public var clearTextColor = UIColor.red
    
    /// The color of the background in the buttons.
    public var backgroundColor = UIColor.white
    
    /// The color of the text in the pin number button.
    public var numberTextColor = UIColor.black
    
    /// Initializer for public use.
    public init() {}
    
}
