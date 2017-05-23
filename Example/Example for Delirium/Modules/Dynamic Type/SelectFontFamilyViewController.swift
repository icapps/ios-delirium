//
//  SelectFontFamilyViewController.swift
//  Delirium
//
//  Created by Nikki Vergracht on 22/05/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

/// Example extension you could use in your app with your own fontFamily in order to not having to pass the fontFamily every time.
extension UIFont {
    
    @nonobjc static var fontFamily = "Chalkboard SE" // Don't use this font family, ever.
    
    class func preferredCustomFont(for style: UIFontTextStyle) -> UIFont {
        return UIFont.preferredFont(with: fontFamily, for: style)
    }
    
    @available(iOS 10.0, *)
    class func preferredCustomFont(for style: UIFontTextStyle, compatibleWith traitCollection: UITraitCollection?) -> UIFont {
        return UIFont.preferredFont(with: fontFamily, for: style, compatibleWith: traitCollection)
    }
}

class SelectFontFamilyHeader: UITableViewHeaderFooterView {
    
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

class SelectFontFamilyViewController: UITableViewController {
    
    private let cellReuseIdentifier = "fontFamilyCell"
    private var familyNames: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "UIFont Dynamic Type"
        familyNames = UIFont.familyNames
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 20
        tableView.sectionHeaderHeight = UITableViewAutomaticDimension
        tableView.estimatedSectionHeaderHeight = 40
        tableView.register(SelectFontFamilyHeader.self, forHeaderFooterViewReuseIdentifier: SelectFontFamilyHeader.reuseIdentifier)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let familyNames = familyNames else {
            return 0
        }
        return familyNames.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: SelectFontFamilyHeader.reuseIdentifier) as? SelectFontFamilyHeader else {
            return nil
        }
        header.label.text = "Change the \"Text Size\" in your phone's Settings and come back to this screen to see the sizes in the table view change accordingly."
        return header
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        guard let familyNames = familyNames else {
                return cell
        }
        let familyName = familyNames[indexPath.row]
        cell.textLabel?.text = "\(familyName)"
        cell.textLabel?.font = UIFont.preferredFont(with: familyName, for: .body)
        return cell
    }
}
