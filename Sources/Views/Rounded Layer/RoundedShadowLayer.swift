//
//  RoundedShadowLayer.swift
//  Delirium
//
//  Created by Hannes Van den Berghe on 09/05/2018.
//

import Foundation
import UIKit

class RoundedShadowLayer: RoundedLayer {

    private var _shadowColor: UIColor = UIColor.black
    private var _shadowOffset: CGSize = CGSize(width: 0, height: 15)
    private var _shadowOpacity: Float = 0.2
    private var _shadowRadius: CGFloat = 15

    // MARK: - Init

    override init() {
        super.init()
        setupShadow()
    }

    override init(layer: Any) {
        super.init(layer: layer)
        setupShadow()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupShadow()
    }

    // MARK: - UI

    override func layoutSublayers() {
        super.layoutSublayers()

        shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
    }

    // MARK: - Private methods

    private func setupShadow() {
        shadowColor = _shadowColor.cgColor
        shadowOffset = _shadowOffset
        shadowOpacity = _shadowOpacity
        shadowRadius = _shadowRadius
    }
}
