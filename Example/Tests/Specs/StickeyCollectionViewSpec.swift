//
//  PinViewSpec.swift
//  Delirium
//
//  Created by Jelle Vandebeeck on 14/10/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots
import Delirium

class StickyCollectionViewSpec: QuickSnapshotSpec {

    override func spec() {
        describe("pin view") {
            var view: PinView!
            beforeEach{
                let bundle = Bundle(for: self.classForCoder)
                let storyboard = UIStoryboard(name: "StickeyCollectionView", bundle: bundle)
                let controller = storyboard.instantiateInitialViewController()!
                view = controller.view.subviews.first as? PinView
            }

            pending("should show an normal stickey collectionView") {
                self.expect📷ToHaveValidSnapshot(view)
            }

        }
    }
}
