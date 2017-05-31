//
//  FontFamilyHeader.swift
//  Delirium
//
//  Created by Nikki Vergracht on 31/05/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

class FontFamilyHeader: UITableViewHeaderFooterView {
    
    let label = UILabel()
    
    class var reuseIdentifier: String {
        return String(describing: self)
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.backgroundColor = .clear
        label.textAlignment = .center
        if #available(iOS 8.2, tvOS 8.2,  *) {
            label.font = UIFont.systemFont(ofSize: 20, weight: UIFontWeightThin)
        } else {
            label.font = UIFont.systemFont(ofSize: 20)
        }
        contentView.addSubview(label)
        contentView.addConstraint(NSLayoutConstraint(item: label, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1.0, constant: 20))
        contentView.addConstraint(NSLayoutConstraint(item: label, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailing, multiplier: 1.0, constant: -20))
        contentView.addConstraint(NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1.0, constant: 20))
        contentView.addConstraint(NSLayoutConstraint(item: label, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottom, multiplier: 1.0, constant: -20))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
