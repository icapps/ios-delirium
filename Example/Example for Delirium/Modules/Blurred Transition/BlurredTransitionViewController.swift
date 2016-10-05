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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let controller = segue.destination as? BlurredPopupViewController else {
            return
        }
        
        if segue.identifier == "extralight" {
            controller.blurEffectStyle = .extraLight
        } else if segue.identifier == "light" {
            controller.blurEffectStyle = .light
        } else if segue.identifier == "dark" {
            controller.blurEffectStyle = .dark
        }
    }
    
    @IBAction func unwindToBlurredTransition(_ segue: UIStoryboardSegue) {
        
    }
    
}
