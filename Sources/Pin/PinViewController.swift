//
//  PinViewController.swift
//  Delirium
//
//  Created by Jelle Vandebeeck on 13/06/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

/// You can configure the pin view with this struct.
public struct PinConfiguration {
    
    /// Define the number of digits you want to enter.
    public var numberOfDigits: Int = 4
    
    /// The title to be displayed in the navigation bar.
    public var title: String = "Enter your pin"
    
    /// The color of the filled dot at the top of the pin view.
    public var dotColor = UIColor(red:0.11, green:0.68, blue:0.93, alpha:1.00)
    
    /// The color of the stroked dot at the top of the pin view.
    public var dotStrokeColor = UIColor(red:0.73, green:0.77, blue:0.81, alpha:1.00)
    
    /// The color of the stroked pin number button.
    public var numberStrokeColor = UIColor(red:0.75, green:0.79, blue:0.83, alpha:1.00)
    
    /// The color of the highlighted background in the pin number button.
    public var selectionBackgroundColor = UIColor(red:0.90, green:0.91, blue:0.93, alpha:1.00)
    
    /// The color of the background in the pin number button.
    public var backgroundColor = UIColor.whiteColor()
    
    /// The color of the text in the pin number button.
    public var numberTextColor = UIColor(red:0.01, green:0.13, blue:0.28, alpha:1.00)
    
    /// Initializer for public use.
    public init() {}
    
}

/// The delegate protocol for the `PinViewController`.
public protocol PinViewControllerDelegate {
    
    /// When the complete pin was entered you return to this delegate method.
    ///
    /// - Parameter controller: The controller that triggers this method.
    /// - Parameter pin: The entered pin code.
    func pinViewController(controller: PinViewController, didEnterPin pin: String)
    
}

public class PinViewController: UIViewController {
    
    // MARK: - Configuration
    
    public var delegate: PinViewControllerDelegate?
    private var configuration: PinConfiguration!
    
    // MARK: - Outlets
    
    @IBOutlet var dotView: PinDotView!
    @IBOutlet var pinButtons: [PinButton]!
    
    // MARK: - Model
    
    private var viewModel: PinViewModel!
    
    // MARK: - View flow
    
    public override func viewDidLoad() {
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
    
    public func pinViewController(withConfiguration configuration: PinConfiguration = PinConfiguration()) -> PinViewController {
        let storyboard = UIStoryboard(name: "PinViewController", bundle: NSBundle.deliriumBundle())
        let controller = storyboard.instantiateInitialViewController() as! PinViewController
        controller.configuration = configuration
        return controller
    }
    
}