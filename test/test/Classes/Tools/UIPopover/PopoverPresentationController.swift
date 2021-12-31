//
//  PopoverPresentationController.swift
//  test
//
//  Created by UCL on 2021/12/28.
//

import UIKit

class PopoverPresentationController: UIPresentationController {
    
    var presentedFrame: CGRect = CGRect.zero
    
    private lazy var coverView: UIView = UIView()
    
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        
        presentedView?.frame = presentedFrame
        
        setupCoverView()
    }
}

extension PopoverPresentationController{
    private func setupCoverView(){
        containerView?.insertSubview(coverView, at: 0)
        coverView.backgroundColor = UIColor(white: 0.8, alpha: 0.2)
        coverView.frame = containerView?.bounds ?? CGRect.zero
        
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(coverviewClick))
        coverView.addGestureRecognizer(tapGes)
    }
}

extension PopoverPresentationController{
    @objc private func coverviewClick(){
        presentingViewController.dismiss(animated: true, completion: nil)
    }
}
