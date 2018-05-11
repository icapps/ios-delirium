//
//  RoundedView.swift
//  Delirium_Example
//
//  Created by Hannes Van den Berghe on 09/05/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import Delirium

class RoundedView: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()

        initializeViews()
    }

    private func initializeViews() {
        layer.cornerRadius = 0

        (layer as? RoundedShadowLayer)?.backgroundColor = UIColor.red.cgColor
        (layer as? RoundedShadowLayer)?.rounding = 0
        (layer as? RoundedShadowLayer)?.shadowOpacity = 0.3
        (layer as? RoundedShadowLayer)?.shadowRadius = 15
        (layer as? RoundedShadowLayer)?.shadowOffset = CGSize(width: -1, height: 0.0)
    }


    override class var layerClass: AnyClass {
        return RoundedShadowLayer.self
    }
}
