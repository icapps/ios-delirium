//
//  PinView.swift
//  Point of Sale
//
//  Created by Jelle Vandebeeck on 13/10/2016.
//  Copyright © 2016 iCapps. All rights reserved.
//

import UIKit

/// The delegate protocol for the `PinViewController`.
@available(iOS 9, *)
public protocol PinViewDelegate {
    
    /// When the complete pin was entered you return to this delegate method.
    ///
    /// - Parameter controller: The controller that triggers this method.
    /// - Parameter pin: The entered pin code.
    func pinView(view: PinView, didEnterPin pin: String)
    
}

@available(iOS 9, *)
open class PinView: UIView {
    
    // MARK: - Configuration
    
    private let buttonPadding: CGFloat = 10.0
    private let dotPadding: CGFloat = 20.0
    
    public var delegate: PinViewDelegate?
    
    public var configuration = PinConfiguration() {
        didSet {
            dotView.configuration = configuration
            buttons.forEach { $0.configuration = configuration }
            buttonWidthConstraints.forEach { $0.constant = configuration.buttonSize }
        }
    }
    
    // MARK: - Init
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        prepareDots()
        prepareButtons()
    }
    
    // MARK: - Dots
    
    private lazy var dotView: PinDotView = {
        let dotView = PinDotView()
        dotView.translatesAutoresizingMaskIntoConstraints = false
        dotView.backgroundColor = UIColor.clear
        dotView.configuration = self.configuration
        return dotView
    }()
    
    private func prepareDots() {
        addSubview(dotView)
        
        dotView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        dotView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    // MARK: - Buttons
    
    private var buttons = [PinButton]()
    private var buttonWidthConstraints = [NSLayoutConstraint]()
    
    private func prepareButtons() {
        // 2
        let buttonTwo = prepareButton(text: "2", type: .number(2), action: #selector(PinView.tapNumber(sender:)))
        buttonTwo.topAnchor.constraint(equalTo: dotView.bottomAnchor, constant: dotPadding).isActive = true
        buttonTwo.centerXAnchor.constraint(equalTo: dotView.centerXAnchor).isActive = true
        
        // 1
        let buttonOne = prepareButton(text: "1", type: .number(1), action: #selector(PinView.tapNumber(sender:)))
        buttonOne.topAnchor.constraint(equalTo: buttonTwo.topAnchor).isActive = true
        buttonOne.rightAnchor.constraint(equalTo: buttonTwo.leftAnchor, constant: -buttonPadding).isActive = true
        buttonOne.leftAnchor.constraint(greaterThanOrEqualTo: leftAnchor).isActive = true
        
        // 3
        let buttonThree = prepareButton(text: "3", type: .number(3), action: #selector(PinView.tapNumber(sender:)))
        buttonThree.topAnchor.constraint(equalTo: buttonTwo.topAnchor).isActive = true
        buttonThree.leftAnchor.constraint(equalTo: buttonTwo.rightAnchor, constant: buttonPadding).isActive = true
        buttonThree.rightAnchor.constraint(greaterThanOrEqualTo: rightAnchor).isActive = true
        
        // 5
        let buttonFive = prepareButton(text: "5", type: .number(5), action: #selector(PinView.tapNumber(sender:)))
        buttonFive.topAnchor.constraint(equalTo: buttonTwo.bottomAnchor, constant: buttonPadding).isActive = true
        buttonFive.centerXAnchor.constraint(equalTo: buttonTwo.centerXAnchor).isActive = true
        
        // 4
        let buttonFour = prepareButton(text: "4", type: .number(4), action: #selector(PinView.tapNumber(sender:)))
        buttonFour.topAnchor.constraint(equalTo: buttonFive.topAnchor).isActive = true
        buttonFour.rightAnchor.constraint(equalTo: buttonFive.leftAnchor, constant: -buttonPadding).isActive = true
        buttonFour.leftAnchor.constraint(greaterThanOrEqualTo: leftAnchor).isActive = true
        
        // 6
        let buttonSix = prepareButton(text: "6", type: .number(6), action: #selector(PinView.tapNumber(sender:)))
        buttonSix.topAnchor.constraint(equalTo: buttonFive.topAnchor).isActive = true
        buttonSix.leftAnchor.constraint(equalTo: buttonFive.rightAnchor, constant: buttonPadding).isActive = true
        buttonSix.rightAnchor.constraint(greaterThanOrEqualTo: rightAnchor).isActive = true
        
        // 8
        let buttonEight = prepareButton(text: "8", type: .number(8), action: #selector(PinView.tapNumber(sender:)))
        buttonEight.topAnchor.constraint(equalTo: buttonFive.bottomAnchor, constant: buttonPadding).isActive = true
        buttonEight.centerXAnchor.constraint(equalTo: buttonFive.centerXAnchor).isActive = true
        
        // 7
        let buttonSeven = prepareButton(text: "7", type: .number(7), action: #selector(PinView.tapNumber(sender:)))
        buttonSeven.topAnchor.constraint(equalTo: buttonEight.topAnchor).isActive = true
        buttonSeven.rightAnchor.constraint(equalTo: buttonEight.leftAnchor, constant: -buttonPadding).isActive = true
        buttonSeven.leftAnchor.constraint(greaterThanOrEqualTo: leftAnchor).isActive = true
        
        // 9
        let buttonNine = prepareButton(text: "9", type: .number(9), action: #selector(PinView.tapNumber(sender:)))
        buttonNine.topAnchor.constraint(equalTo: buttonEight.topAnchor).isActive = true
        buttonNine.leftAnchor.constraint(equalTo: buttonEight.rightAnchor, constant: buttonPadding).isActive = true
        buttonNine.rightAnchor.constraint(greaterThanOrEqualTo: rightAnchor).isActive = true
        
        // 0
        let buttonZero = prepareButton(text: "0", type: .number(0), action: #selector(PinView.tapNumber(sender:)))
        buttonZero.topAnchor.constraint(equalTo: buttonEight.bottomAnchor, constant: buttonPadding).isActive = true
        buttonZero.centerXAnchor.constraint(equalTo: buttonEight.centerXAnchor).isActive = true
        buttonZero.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        // C
        let buttonC = prepareButton(text: "C", type: .clear, action: #selector(PinView.clear))
        buttonC.topAnchor.constraint(equalTo: buttonZero.topAnchor).isActive = true
        buttonC.rightAnchor.constraint(equalTo: buttonZero.leftAnchor, constant: -buttonPadding).isActive = true
        buttonC.leftAnchor.constraint(greaterThanOrEqualTo: leftAnchor).isActive = true
    }
    
    private func prepareButton(text: String, type: PinButtonType, action: Selector) -> PinButton {
        let button = PinButton(type: .custom)
        button.type = type
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(text, for: .normal)
        button.configuration = configuration
        button.addTarget(self, action: action, for: .touchUpInside)
        buttons.append(button)
        addSubview(button)
        
        // Set the button size.
        let widthConstraint = button.widthAnchor.constraint(equalToConstant: configuration.buttonSize)
        widthConstraint.isActive = true
        buttonWidthConstraints.append(widthConstraint)
        button.heightAnchor.constraint(equalTo: button.widthAnchor).isActive = true
        
        return button
    }
    
    // MARK: - Actions
    
    func tapNumber(sender: PinButton) {
        guard
            let value = sender.type.value,
            code.count < configuration.numberOfDigits else {
                return
        }
        
        code.append(value)
        reloadDotView()
        
        if complete {
            delegate?.pinView(view: self, didEnterPin: codeString)
        }
    }
    
    public func clear() {
        code.removeAll()
        reloadDotView()
    }
    
    private func reloadDotView() {
        dotView.currentSize = codeString.characters.count
    }
    
    // MARK: - Code
    
    private var code = [Int]()
    
    public var codeString: String {
        return code.map { String($0) }.joined(separator: "")
    }
    
    private var complete: Bool {
        return code.count == configuration.numberOfDigits
    }
    
}
