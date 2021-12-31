//
//  HomeViewController.swift
//  test
//
//  Created by UCL on 2021/12/26.
//

import UIKit

class HomeViewController: BaseViewController {
    
    private lazy var titleBtn: TitleButton = TitleButton()
    private lazy var popoverAnimator: PopoverAnimtor = PopoverAnimtor {[weak self] presented in
        self?.titleBtn.isSelected = presented
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        visitorView.setupVisitorViewInfo(iconName: "home", tilte: "Home")
        visitorView.addRotationAnimate()
        
        if !isLogin{
            return
        }
        
        setupNavigationBar()
    }
}

extension HomeViewController{
    private func setupNavigationBar(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "Customer")
        navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "scan")
        titleBtn.addTarget(self, action: #selector(self.titleBtnClick), for: .touchUpInside)
        navigationItem.titleView = titleBtn
    }
}

extension HomeViewController{
    @objc private func titleBtnClick(titleBtn: TitleButton){
//        titleBtn.isSelected = !titleBtn.isSelected
        
        let vc = PopoverViewController()
        vc.modalPresentationStyle = .custom
        vc.transitioningDelegate = popoverAnimator
        popoverAnimator.presentedFrame = CGRect(x: 100, y: 100, width: 220, height: 300)
        
        present(vc, animated: true, completion: nil)
    }
}

//extension HomeViewController: UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning{
//    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
//        return 0.5
//    }
//
//    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
//        isPresented ? animationForPrresentedView(transitionContext: transitionContext) : animationForDissmisedView(transitionContext: transitionContext)
//    }
//
//    private func animationForPrresentedView(transitionContext: UIViewControllerContextTransitioning){
//        let presentedView = transitionContext.view(forKey: UITransitionContextViewKey.to)!
//
//        transitionContext.containerView.addSubview(presentedView)
//
//        presentedView.transform = CGAffineTransform(scaleX: 1.0,y: 0.0)
//        UIView.animate(withDuration: transitionDuration(using: transitionContext)) {
//            presentedView.transform = CGAffineTransform.identity
//            presentedView.layer.anchorPoint = CGPoint(x: 0.5, y: 0.05)
//        } completion: { (_) in
//            transitionContext.completeTransition(true)
//        }
//    }
//    private func animationForDissmisedView(transitionContext: UIViewControllerContextTransitioning){
//        let dismissView = transitionContext.view(forKey: UITransitionContextViewKey.from)!
//
//        UIView.animate(withDuration: transitionDuration(using: transitionContext)) {
//            dismissView.transform = CGAffineTransform(scaleX: 1.0, y: 0.00001)
////            dismissView.layer.anchorPoint = CGPoint(x: 0.5, y: 0.05)
//        } completion: { (_) in
//            dismissView.removeFromSuperview()
//            transitionContext.completeTransition(true)
//        }
//    }
//
//    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
//        return PopoverPresentationController(presentedViewController: presented, presenting: presenting)
//    }
//
//    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        isPresented = true
//        return self
//    }
//    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        isPresented = false
//        return self
//    }
//}
