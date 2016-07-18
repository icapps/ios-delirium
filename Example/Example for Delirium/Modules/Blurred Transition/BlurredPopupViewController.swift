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
    
    private let transitionDelegate = ActionTransitioningDelegate()
    
    // MARK: - Init
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        transitioningDelegate = transitionDelegate
        modalPresentationStyle = .Custom
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        transitioningDelegate = transitionDelegate
        modalPresentationStyle = .Custom
    }
    
}