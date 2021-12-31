//
//  PopoverAnimator.swift
//  test
//
//  Created by UCL on 2021/12/28.
//

import UIKit

class PopoverAnimtor: NSObject{
    
    private var isPresented: Bool = false
    var presentedFrame: CGRect = CGRect.zero
    
    var callBack: ((_ presented: Bool) -> ())?
    
    init(callBack: @escaping (_ presented: Bool) -> ()) {
        self.callBack =  callBack
    }
}

extension PopoverAnimtor: UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning{
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        isPresented ? animationForPrresentedView(transitionContext: transitionContext) : animationForDissmisedView(transitionContext: transitionContext)
    }
    
    private func animationForPrresentedView(transitionContext: UIViewControllerContextTransitioning){
        let presentedView = transitionContext.view(forKey: UITransitionContextViewKey.to)!
        
        transitionContext.containerView.addSubview(presentedView)
        
        presentedView.transform = CGAffineTransform(scaleX: 1.0,y: 0.0)
        UIView.animate(withDuration: transitionDuration(using: transitionContext)) {
            presentedView.transform = CGAffineTransform.identity
            presentedView.layer.anchorPoint = CGPoint(x: 0.5, y: 0.05)
        } completion: { (_) in
            transitionContext.completeTransition(true)
        }
    }
    private func animationForDissmisedView(transitionContext: UIViewControllerContextTransitioning){
        let dismissView = transitionContext.view(forKey: UITransitionContextViewKey.from)!
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext)) {
            dismissView.transform = CGAffineTransform(scaleX: 1.0, y: 0.00001)
        } completion: { (_) in
            dismissView.removeFromSuperview()
            transitionContext.completeTransition(true)
        }
    }
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let presentation = PopoverPresentationController(presentedViewController: presented, presenting: presenting)
        presentation.presentedFrame = presentedFrame
        
        return presentation
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresented = true
        callBack!(isPresented)
        return self
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresented = false
        callBack!(isPresented)
        return self
    }
}
