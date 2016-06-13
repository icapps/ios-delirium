//
//  PinViewController.swift
//  Delirium
//
//  Created by Jelle Vandebeeck on 13/06/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

protocol PinViewControllerDelegate {
    
    func pinViewController(controller: PinViewController, didEnterPin pin: String)
    
}

class PinViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet var dotView: PinDotView!
    @IBOutlet var paddingConstraints: [NSLayoutConstraint]!
    @IBOutlet var sizeConstraints: [NSLayoutConstraint]!
    
    // MARK: - Model
    
    private let viewModel = PinViewModel()
    
    // MARK: - View flow
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let padding: CGFloat = 20.0
        for constraint in paddingConstraints {
            constraint.constant = padding
        }
        
        let size: CGFloat = 60.0
        for constraint in sizeConstraints {
            constraint.constant = size
        }
    }
    
    // MARK: - Actions
    
    @IBAction func pressNumber(sender: AnyObject) {
        if let button = sender as? UIButton {
            viewModel.add(number: button.tag)
            dotView.currentSize = viewModel.codeString.characters.count
        }
    }
    
    @IBAction func pressDelete(sender: AnyObject) {
        viewModel.remove()
        dotView.currentSize = viewModel.codeString.characters.count
    }
    
}

extension UIViewController {
    
    // MARK: - Add pin view
    
    func addPinChildViewController() -> PinViewController {
        let storyboard = UIStoryboard(name: "PinViewController", bundle: nil)
        let controller = storyboard.instantiateInitialViewController() as! PinViewController
        addChildViewController(controller)
        view.addSubview(controller.view)
        
        return controller
    }
    
}