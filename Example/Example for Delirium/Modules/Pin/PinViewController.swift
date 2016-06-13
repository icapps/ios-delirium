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
    
    var delegate: PinViewControllerDelegate?
    
    // MARK: - Outlets
    
    @IBOutlet var dotView: PinDotView!
    @IBOutlet var paddingConstraints: [NSLayoutConstraint]!
    @IBOutlet var sizeConstraints: [NSLayoutConstraint]!
    
    // MARK: - Model
    
    private let viewModel = PinViewModel()
    
    // MARK: - View flow
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for constraint in paddingConstraints { constraint.constant = 15.0 }
        for constraint in sizeConstraints { constraint.constant = 60.0 }
    }
    
    // MARK: - Actions
    
    @IBAction func pressNumber(sender: AnyObject) {
        if let button = sender as? UIButton where viewModel.add(number: button.tag) {
            dotView.currentSize = viewModel.codeString.characters.count
            if viewModel.complete {
                delegate?.pinViewController(self, didEnterPin: viewModel.codeString)
            }
        }
    }
    
    @IBAction func pressDelete(sender: AnyObject) {
        if viewModel.remove() {
            dotView.currentSize = viewModel.codeString.characters.count
        }
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