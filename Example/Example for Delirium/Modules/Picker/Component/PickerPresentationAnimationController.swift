//
//  PickerPresentationAnimationController.swift
//  Delirium
//
//  Created by Jelle Vandebeeck on 13/09/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

@available(iOS 9, *)
class PickerPresentationAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    private let isPresenting: Bool
    
    // MARK: - Init
    
    init(isPresenting: Bool) {
        self.isPresenting = isPresenting
        super.init()
    }
    
    // MARK: - UIViewControllerAnimatedTransitioning
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.15
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        if isPresenting {
            animatePresentationWithTransitionContext(transitionContext)
        } else {
            animateDismissalWithTransitionContext(transitionContext)
        }
    }
    
    // MARK: - Animations
    
    private func animatePresentationWithTransitionContext(transitionContext: UIViewControllerContextTransitioning) {
        let presentedControllerView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        presentedControllerView.translatesAutoresizingMaskIntoConstraints = false
        
        let bottomConstraint: NSLayoutConstraint = presentedControllerView.bottomAnchor.constraintLessThanOrEqualToAnchor(presentedControllerView.superview?.bottomAnchor)
        bottomConstraint.priority = 600
        bottomConstraint.active = true
        bottomConstraint.constant = presentedControllerView.frame.size.height
        presentedControllerView.leftAnchor.constraintLessThanOrEqualToAnchor(presentedControllerView.superview?.leftAnchor).active = true
        presentedControllerView.rightAnchor.constraintLessThanOrEqualToAnchor(presentedControllerView.superview?.rightAnchor).active = true
        presentedControllerView.superview?.layoutIfNeeded()
        
        // Start animation
        bottomConstraint.constant = 0
        UIView.animateWithDuration(0.15, animations: {
            presentedControllerView.superview?.layoutIfNeeded()
        }) { success in
            transitionContext.completeTransition(true)
        }
    }
    
    private func animateDismissalWithTransitionContext(transitionContext: UIViewControllerContextTransitioning) {
        let presentedControllerView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        let containerView = transitionContext.containerView()!
        
        let bottomConstraint = containerView.constraints.filter { (constraint) -> Bool in
            constraint.firstAttribute == .Bottom && constraint.priority == 600
        }.first
        
        // Start animation
        bottomConstraint?.constant = presentedControllerView.frame.size.height
        UIView.animateWithDuration(0.15, animations: {
            presentedControllerView.superview?.layoutIfNeeded()
        }) { success in
            transitionContext.completeTransition(true)
        }
    }
}