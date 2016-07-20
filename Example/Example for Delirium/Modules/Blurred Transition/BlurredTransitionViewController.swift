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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let controller = segue.destinationViewController as? BlurredPopupViewController else {
            return
        }
        
        if segue.identifier == "extralight" {
            controller.blurEffectStyle = .ExtraLight
        } else if segue.identifier == "light" {
            controller.blurEffectStyle = .Light
        } else if segue.identifier == "dark" {
            controller.blurEffectStyle = .Dark
        }
    }
    
    @IBAction func unwindToBlurredTransition(segue: UIStoryboardSegue) {
        
    }
    
}