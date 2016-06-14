//
//  PinViewController.swift
//  Delirium
//
//  Created by Jelle Vandebeeck on 13/06/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

struct PinConfiguration {
    var numberOfDigits: Int = 4
}

protocol PinViewControllerDelegate {
    
    func pinViewController(controller: PinViewController, didEnterPin pin: String)
    
}

class PinViewController: UIViewController {
    
    // MARK: - Configuration
    
    var delegate: PinViewControllerDelegate?
    private var configuration: PinConfiguration!
    
    // MARK: - Outlets
    
    @IBOutlet var dotView: PinDotView!
    
    // MARK: - Model
    
    private var viewModel: PinViewModel!
    
    // MARK: - View flow
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = PinViewModel(withConfiguration: configuration)
        dotView.configuration = configuration
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
        viewModel.clean()
        dotView.currentSize = 0
    }
    
}

extension UIViewController {
    
    // MARK: - Controller
    
    func pinViewController(withConfiguration configuration: PinConfiguration = PinConfiguration()) -> PinViewController {
        let storyboard = UIStoryboard(name: "PinViewController", bundle: nil)
        let controller = storyboard.instantiateInitialViewController() as! PinViewController
        controller.configuration = configuration
        return controller
    }
    
}