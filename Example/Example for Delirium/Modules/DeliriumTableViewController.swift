//
//  DeliriumViewController.swift
//  Delirium
//
//  Created by Nikki Vergracht on 23/05/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

struct TableViewModel {
    let titleText: String?
    let detailText: String?
    
    init(titleText: String?, detailText: String?) {
        self.titleText = titleText
        self.detailText = detailText
    }
}

class DeleriumTableViewController: UITableViewController {
    
    var initialTableViewValues: [IndexPath: TableViewModel] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 56
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        cell.textLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        cell.detailTextLabel?.font = UIFont.preferredFont(forTextStyle: .footnote)
        
        if initialTableViewValues[indexPath] == nil {
            initialTableViewValues[indexPath] = TableViewModel(titleText: cell.textLabel?.text, detailText: cell.detailTextLabel?.text)
        }
        
        guard let tableViewModel = initialTableViewValues[indexPath] else {
            return cell
        }
        
        cell.textLabel?.text = tableViewModel.titleText
        cell.detailTextLabel?.text = tableViewModel.detailText
        return cell
    }
    
}
