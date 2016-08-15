//
//  CustomPresentationController.swift
//  OAProject
//
//  Created by NKJay on 16/7/29.
//  Copyright © 2016年 NKJay. All rights reserved.
//

import UIKit

class NKTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    let targetEdge: UIRectEdge
    
    var backgroundColor = UIColor(red:0.94, green:0.94, blue:0.94, alpha:1.00)
    
    var fromViewScale:CGFloat = 0.7
    
    var fromViewOffset:CGFloat = 275.0
    
    var transitionDuration = 0.35
    
    init(targetEdge: UIRectEdge) {
        
        switch targetEdge {
        case UIRectEdge.Left,UIRectEdge.Right:
            self.targetEdge = targetEdge
        default:
            fatalError("SlideMenu弹出方向错误")
        }
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return transitionDuration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        transitionContext.containerView()?.backgroundColor = backgroundColor
        
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        //        判断当前视图弹出状态
        let isPresenting = (toViewController?.presentingViewController == fromViewController)
        
        if isPresenting {
            pushViewAnimation(transitionContext)
        }else {
            popViewAnimation(transitionContext)
        }
    }
    
    private func popViewAnimation(transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView()
        
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)
        
        containerView!.addSubview(toView!)
        
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
            
            toView?.transform = CGAffineTransformIdentity
            if self.targetEdge == .Left {
                fromView?.transform = CGAffineTransformMakeTranslation(-(fromView?.frame.width)!, 0)
            } else {
                fromView?.transform = CGAffineTransformMakeTranslation(
                    (fromView?.frame.width)!, 0)
            }
            
        }) { (_) in
            let wasCanceled = transitionContext.transitionWasCancelled()
            transitionContext.completeTransition(!wasCanceled)
        }
    }
    
    private func pushViewAnimation(transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView()
        
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)
        
        let fromFrame = fromView?.frame
        //        获取fromView截图
        let tempView = fromView?.snapshotViewAfterScreenUpdates(false)
        //        创建动画
        let scaleTransForm = CGAffineTransformMakeScale(fromViewScale, fromViewScale)
        var fromViewTransform :CGAffineTransform?
        
        if targetEdge == .Left {
            toView?.transform = CGAffineTransformMakeTranslation(-(toView?.frame.width)!, 0)
            fromViewTransform = CGAffineTransformTranslate(scaleTransForm, fromViewOffset, 0)
        } else {
            toView?.transform = CGAffineTransformMakeTranslation((toView?.frame.width)!, 0)
            fromViewTransform = CGAffineTransformTranslate(scaleTransForm, -fromViewOffset, 0)
        }
        
        tempView?.transform = fromViewTransform!
        
        containerView!.addSubview(toView!)
        containerView?.bringSubviewToFront(fromView!)
        
        fromView?.frame = fromFrame!
        
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
            toView?.transform = CGAffineTransformMakeTranslation(0, 0)
            
            fromView?.transform = fromViewTransform!
            
            }, completion: {(_) in
                let wasCanceled = transitionContext.transitionWasCancelled()
                transitionContext.completeTransition(!wasCanceled)
                containerView!.addSubview(tempView!)
        })
    }
}
