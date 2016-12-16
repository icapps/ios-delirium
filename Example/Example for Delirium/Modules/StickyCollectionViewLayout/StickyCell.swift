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
        super.layoutSubviews()
        layer.borderColor = #colorLiteral(red: 0.916252315, green: 0.916252315, blue: 0.916252315, alpha: 1).cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 4

    }
}
