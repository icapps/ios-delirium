//
//  ShakeViewController.swift
//  Delirium
//
//  Created by Jelle Vandebeeck on 10/06/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import Delirium

class ShakeViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet var label: UILabel!
    
    // MARK: - View model
    
    fileprivate let viewModel = ShakeViewModel()
    
    // MARK: - View flow
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = viewModel.title
    }
    
    // MARK: - Actions
    
    @IBAction func startShaking(_ sender: AnyObject) {
        label.shake()
    }
    
}
