//
//  BlurredTransitionViewController.swift
//  Delirium
//
//  Created by Jelle Vandebeeck on 18/07/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class BlurredTransitionViewController: UIViewController {
    
    // MARK: - View flow
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Blurred Transition"
    }
    
    // MARK: - Segue
    
    @IBAction func unwindToBlurredTransition(segue: UIStoryboardSegue) {
        
    }
    
}