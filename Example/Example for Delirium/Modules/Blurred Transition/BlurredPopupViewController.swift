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
    
    private var transitionDelegate: UIViewControllerTransitioningDelegate?
    
    // MARK: - Init
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        setupTransition()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupTransition()
    }
    
    // MARK: - Transition
    
    private func setupTransition() {
        guard #available(iOS 9, *) else { return }
        
        transitionDelegate = ActionTransitioningDelegate()
        transitioningDelegate = transitionDelegate
        modalPresentationStyle = .Custom
    }
    
}