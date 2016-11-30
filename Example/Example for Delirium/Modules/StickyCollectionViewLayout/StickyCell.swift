//
//  StickyCell.swift
//  Delirium
//
//  Created by Stijn Willems on 30/11/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class StickyCell: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!

    override func layoutSubviews() {
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 4

        super.layoutSubviews()
    }
}
