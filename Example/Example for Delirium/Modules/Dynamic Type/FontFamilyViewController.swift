//
//  FontFamilyViewController.swift
//  Delirium
//
//  Created by Nikki Vergracht on 22/05/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

class FontFamilyViewController: UITableViewController {
    
    private let cellReuseIdentifier = "fontFamilyCell"
    fileprivate let viewModel = FontFamilyViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.title
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 20
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 40
        tableView.register(FontFamilyHeader.self, forHeaderFooterViewReuseIdentifier: FontFamilyHeader.reuseIdentifier)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: FontFamilyHeader.reuseIdentifier) as? FontFamilyHeader else {
            return nil
        }
        header.label.text = "Change the \"Text Size\" in your phone's Settings and come back to this screen to see the sizes in the table view change accordingly."
        return header
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        let familyName = viewModel.familyName(for: indexPath)
        cell.textLabel?.text = "\(familyName)"
        cell.textLabel?.font = UIFont.preferredFont(with: familyName, for: .body)
        return cell
    }
}
