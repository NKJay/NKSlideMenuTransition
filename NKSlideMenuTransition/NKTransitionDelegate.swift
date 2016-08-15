//
//  CustomPresentationController.swift
//  OAProject
//
//  Created by NKJay on 16/7/29.
//  Copyright © 2016年 NKJay. All rights reserved.
//

import UIKit

class NKTransitionDelegate: NSObject, UIViewControllerTransitioningDelegate {
    
    private var animator:NKTransitionAnimator?
    
    init(targetEdge: UIRectEdge) {
        super.init()
        animator = NKTransitionAnimator(targetEdge: targetEdge)
    }
    
    func setBackgroundColor(color:UIColor) {
        animator?.backgroundColor = color
    }
    
    func setTransitionArgument(offSet:CGFloat?,scale:CGFloat?,transitionDuration:Double?) {
        if offSet != nil {
            animator?.fromViewOffset = offSet!
        }
        if scale != nil {
            animator?.fromViewScale = scale!
        }
        if transitionDuration != nil {
            animator?.transitionDuration = transitionDuration!
        }
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return animator
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return animator
    }
}
