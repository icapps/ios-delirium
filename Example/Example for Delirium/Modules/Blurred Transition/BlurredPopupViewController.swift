//
//  BlurredPopupViewController.swift
//  Delirium
//
//  Created by Jelle Vandebeeck on 18/07/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import Delirium

class BlurredPopupViewController: UIViewController {

    // MARK: - Internals

    fileprivate var transitionDelegate: UIViewControllerTransitioningDelegate?

    // MARK: - Configuration

    var blurEffectStyle: UIBlurEffectStyle? {
        didSet {
            guard let blurEffectStyle = blurEffectStyle, #available(iOS 9, *) else { return }

            (transitionDelegate as! ActionTransitioningDelegate).blurEffectStyle = blurEffectStyle
        }
    }

    // MARK: - Init

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setupTransition()
    }

    // MARK: - Transition

    fileprivate func setupTransition() {
        guard #available(iOS 9, *) else { return }

        transitionDelegate = ActionTransitioningDelegate()
        transitioningDelegate = transitionDelegate
        modalPresentationStyle = .custom
    }

}
