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
        label.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.thin)
        contentView.addSubview(label)
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
