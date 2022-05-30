//
//  ActionTransitioningDelegate.swift
//  Runway
//
//  Created by Jelle Vandebeeck on 02/01/16.
//  Copyright © 2016 Tracio. All rights reserved.
//

import UIKit

/// Present a `UIViewController` as a modal with a blurred background.
///
/// Set the `transitioningDelegate` to an instance of `ActionTransitioningDelegate` and the `modalPresentationStyle` to .Custom. Now present the `UIViewController` as a modal and boom!
///
/// The size of the controller is defined by the `intrinsicContentSize` of the `view` belonging to the controller.
@available(iOS 9, *)
open class ActionTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
    
    // MARK: - Configuration
    
    /// The blurred effect style of the background view can be set with this property.
    ///
    /// The possible values can be found in the `UIBlurEffectStyle` docs.
    open var blurEffectStyle: UIBlurEffect.Style = .light
    
    // MARK: - UIViewControllerTransitioningDelegate
    
    open func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let presentationController = ActionPresentationController(presentedViewController: presented, presenting: presenting)
        presentationController.blurEffectStyle = blurEffectStyle
        return presentationController
    }
    
    open func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ActionPresentationAnimationController(isPresenting: true)
    }
    
    open func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ActionPresentationAnimationController(isPresenting: false)
    }
}
