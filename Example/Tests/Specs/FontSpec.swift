//
//  FontSpec.swift
//  Delirium
//
//  Created by Nikki Vergracht on 24/05/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots
import Delirium

class FontSpec: QuickSnapshotSpec {
    
    override func spec() {
        describe("Font label view") {
            var label: UILabel!
            let fontFamily = "Courier"
            beforeEach{
                self.record = false
                let frame = CGRect(x: 0, y: 0, width: 500, height: 300)
                label = UILabel(frame: frame)
                label.text = "This text should be in the correct size."
            }
            
            it("should have a valid snapshot for the dynamic font type extra small") {
                if #available(iOS 10.0, *) {
                    let categoryTrait = UITraitCollection(preferredContentSizeCategory: .extraSmall)
                    label.font = UIFont.preferredFont(with: fontFamily, for: .headline, compatibleWith: categoryTrait)
                } else {
                    label.font = UIFont.preferredFont(with: fontFamily, for: .headline)
                }
                self.expect📷ToHaveValidSnapshot(label, "FontDynamicType", .extraSmall)
            }

            it("should have a valid snapshot for the dynamic font type large") {
                if #available(iOS 10.0, *) {
                    let categoryTrait = UITraitCollection(preferredContentSizeCategory: .extraExtraExtraLarge)
                    label.font = UIFont.preferredFont(with: fontFamily, for: .headline, compatibleWith: categoryTrait)
                } else {
                    label.font = UIFont.preferredFont(with: fontFamily, for: .headline)
                }
                self.expect📷ToHaveValidSnapshot(label, "FontDynamicType", .extraExtraExtraLarge)
            }
        }
    }
}
