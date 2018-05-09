//
//  RoundedLayer.swift
//  Delirium
//
//  Created by Hannes Van den Berghe on 09/05/2018.
//

import Foundation

@available(iOS 9, *)
public class RoundedLayer: CALayer {
    /**
     When the rounding value is nil, the layer will be rounded as a complete circle
     */
    public var rounding: CGFloat?

    override public func layoutSublayers() {
        super.layoutSublayers()

        if let rounding = rounding {
            cornerRadius = rounding
        } else {
            cornerRadius = bounds.height / 2.0
        }
    }
}
