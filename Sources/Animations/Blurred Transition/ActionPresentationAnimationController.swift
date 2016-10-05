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
    fileprivate let isPresenting: Bool
    
    // MARK: - Init
    
    init(isPresenting: Bool) {
        self.isPresenting = isPresenting
        super.init()
    }
    
    // MARK: - UIViewControllerAnimatedTransitioning
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if isPresenting {
            animatePresentationWithTransitionContext(transitionContext)
        } else {
            animateDismissalWithTransitionContext(transitionContext)
        }
    }
    
    // MARK: - Animations
    
    fileprivate func animatePresentationWithTransitionContext(_ transitionContext: UIViewControllerContextTransitioning) {
        let presentedControllerView = transitionContext.view(forKey: UITransitionContextViewKey.to)!
        presentedControllerView.translatesAutoresizingMaskIntoConstraints = false
        let containerView = transitionContext.containerView
        
        let horizontalConstraint: NSLayoutConstraint = presentedControllerView.centerYAnchor.constraint(lessThanOrEqualTo: (presentedControllerView.superview?.centerYAnchor)!)
        horizontalConstraint.priority = 600
        horizontalConstraint.isActive = true
        horizontalConstraint.constant = containerView.frame.size.height
        presentedControllerView.centerXAnchor.constraint(lessThanOrEqualTo: (presentedControllerView.superview?.centerXAnchor)!).isActive = true
        presentedControllerView.superview?.layoutIfNeeded()
        
        // We enable this constraint for when the keyboard appears.
        presentedControllerView.bottomAnchor.constraint(lessThanOrEqualTo: containerView.bottomAnchor, constant: 10.0).isActive = true
        
        // Start animation
        horizontalConstraint.constant = 0
        UIView.animate(withDuration: 0.75, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.3, options: UIViewAnimationOptions(), animations: {
            presentedControllerView.superview?.layoutIfNeeded()
            }, completion: { (completed) -> Void in
                transitionContext.completeTransition(true)
        })
    }
    
    fileprivate func animateDismissalWithTransitionContext(_ transitionContext: UIViewControllerContextTransitioning) {
        let presentedControllerView = transitionContext.view(forKey: UITransitionContextViewKey.from)!
        let containerView = transitionContext.containerView
        
        let horizontalConstraint = containerView.constraints.filter { (constraint) -> Bool in
            constraint.firstAttribute == .centerY && constraint.secondAttribute == .centerY
            }.first
        
        // Start animation
        horizontalConstraint?.constant = -containerView.frame.size.height
        UIView.animate(withDuration: 0.75, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.3, options: UIViewAnimationOptions(), animations: {
            presentedControllerView.superview?.layoutIfNeeded()
            }, completion: { (completed) -> Void in
                transitionContext.completeTransition(true)
        })
    }
}
