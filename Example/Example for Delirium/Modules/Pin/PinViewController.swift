//
//  PinViewController.swift
//  Delirium
//
//  Created by Jelle Vandebeeck on 13/06/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

struct PinConfiguration {
    
    // The pin view configuration.
    var numberOfDigits: Int = 4
    var title: String = "Enter your pin"
    
    // The dots configuration.
    var dotColor = UIColor(red:0.11, green:0.68, blue:0.93, alpha:1.00)
    var dotStrokeColor = UIColor(red:0.73, green:0.77, blue:0.81, alpha:1.00)
    
    // The number button configuration.
    var numberStrokeColor = UIColor(red:0.75, green:0.79, blue:0.83, alpha:1.00)
    var selectionBackgroundColor = UIColor(red:0.90, green:0.91, blue:0.93, alpha:1.00)
    var backgroundColor = UIColor.whiteColor()
    var numberTextColor = UIColor(red:0.01, green:0.13, blue:0.28, alpha:1.00)
    
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
    @IBOutlet var pinButtons: [PinButton]!
    
    // MARK: - Model
    
    private var viewModel: PinViewModel!
    
    // MARK: - View flow
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = configuration.title
        
        viewModel = PinViewModel(withConfiguration: configuration)
        dotView.configuration = configuration
        
        for pinButton in pinButtons {
            pinButton.configuration = configuration
        }
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