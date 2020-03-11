//
//  SlideInTransition.swift
//  Healing Paws Veterinary Hospital
//
//  Created by Jinyi Liu on 2020/3/11.
//  Copyright © 2020 Jinyi Liu. All rights reserved.
//

import UIKit

class SlideInTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    var isPresenting = false
    let dimmingView = UIView()
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: .to),
        let fromViewController = transitionContext.viewController(forKey: .from) else {return}
        
        let containerView = transitionContext.containerView
        
        let finalWidth = toViewController.view.bounds.width * 0.8
        let finalHeight = toViewController.view.bounds.height
        
        if isPresenting{
            //add dimming view
            dimmingView.backgroundColor = .black
            dimmingView.alpha = 0
            containerView.addSubview(dimmingView)
            dimmingView.frame = containerView.bounds
            //add menu view controller to container
            containerView.addSubview(toViewController.view)
            
            //init frame off the screen
            toViewController.view.frame = CGRect(x: -finalWidth, y: 0, width: finalWidth, height: finalHeight)
        }
        //animate on screen
        let transform = {
            self.dimmingView.alpha = 0.5
            toViewController.view.transform = CGAffineTransform(translationX: finalWidth, y: 0)
        }
        
        //animate back off screen
        let identity = {
            self.dimmingView.alpha = 0
            fromViewController.view.transform = .identity
        }
        
        //animation of the transition
        let duration = transitionDuration(using: transitionContext)
        let isCancelled = transitionContext.transitionWasCancelled
        UIView.animate(withDuration: duration, animations: {
            self.isPresenting ? transform() : identity()
        }) {(_) in
            transitionContext.completeTransition(!isCancelled)
        }
        
        
    }
    

}
