//
//  RoundedViewSpec.swift
//  Delirium_Tests
//
//  Created by Hannes Van den Berghe on 09/05/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots
import Delirium

class MockRoundedView: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        initializeViews()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeViews()
    }

    private func initializeViews() {
        layer.cornerRadius = 0

        (layer as? RoundedShadowLayer)?.backgroundColor = UIColor.red.cgColor
        (layer as? RoundedShadowLayer)?.rounding = 100
        (layer as? RoundedShadowLayer)?.shadowOpacity = 0.3
        (layer as? RoundedShadowLayer)?.shadowRadius = 15
        (layer as? RoundedShadowLayer)?.shadowColor = UIColor.white.cgColor
        (layer as? RoundedShadowLayer)?.shadowOffset = CGSize(width: -1, height: 0.0)
    }


    override class var layerClass: AnyClass {
        return RoundedShadowLayer.self
    }
}

class RoundedViewSpec: QuickSnapshotSpec {
    override func spec() {

        describe("Rounded view") {
            var view: MockRoundedView!

            beforeEach {
                self.record = false
                let frame = CGRect(x: 0, y: 0, width: 300, height: 300)
                view = MockRoundedView(frame: frame)
            }

            it("should have a red view with white corners") {
                self.expect📷ToHaveValidSnapshot(view)
            }
        }

    }
}
