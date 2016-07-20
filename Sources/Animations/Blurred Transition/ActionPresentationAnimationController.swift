//
//  ActionPresentationAnimationController.swift
//  Runway
//
//  Created by Jelle Vandebeeck on 02/01/16.
//  Copyright © 2016 Soaring Book. All rights reserved.
//

import UIKit

@available(iOS 9, *)
class ActionPresentationAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    private let isPresenting: Bool
    
    // MARK: - Init
    
    init(isPresenting: Bool) {
        self.isPresenting = isPresenting
        super.init()
    }
    
    // MARK: - UIViewControllerAnimatedTransitioning
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
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
        let containerView = transitionContext.containerView()!
        
        let horizontalConstraint: NSLayoutConstraint = presentedControllerView.centerYAnchor.constraintLessThanOrEqualToAnchor(presentedControllerView.superview?.centerYAnchor)
        horizontalConstraint.priority = 600
        horizontalConstraint.active = true
        horizontalConstraint.constant = containerView.frame.size.height
        presentedControllerView.centerXAnchor.constraintLessThanOrEqualToAnchor(presentedControllerView.superview?.centerXAnchor).active = true
        presentedControllerView.superview?.layoutIfNeeded()
        
        // We enable this constraint for when the keyboard appears.
        presentedControllerView.bottomAnchor.constraintLessThanOrEqualToAnchor(containerView.bottomAnchor, constant: 10.0).active = true
        
        // Start animation
        horizontalConstraint.constant = 0
        UIView.animateWithDuration(0.75, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.3, options: .CurveEaseInOut, animations: {
            presentedControllerView.superview?.layoutIfNeeded()
            }, completion: { (completed) -> Void in
                transitionContext.completeTransition(true)
        })
    }
    
    private func animateDismissalWithTransitionContext(transitionContext: UIViewControllerContextTransitioning) {
        let presentedControllerView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        let containerView = transitionContext.containerView()!
        
        let horizontalConstraint = containerView.constraints.filter { (constraint) -> Bool in
            constraint.firstAttribute == .CenterY && constraint.secondAttribute == .CenterY
            }.first
        
        // Start animation
        horizontalConstraint?.constant = -containerView.frame.size.height
        UIView.animateWithDuration(0.75, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.3, options: .CurveEaseInOut, animations: {
            presentedControllerView.superview?.layoutIfNeeded()
            }, completion: { (completed) -> Void in
                transitionContext.completeTransition(true)
        })
    }
}