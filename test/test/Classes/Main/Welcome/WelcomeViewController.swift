//
//  WelcomeViewController.swift
//  test
//
//  Created by UCL on 2022/01/01.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var iconViewBottomCons: NSLayoutConstraint!
    @IBOutlet weak var iconView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let data = try? Data(contentsOf: URL(string: (UserAccountTool.share.account?.avatar_large)!)!)
        if data == nil {
            iconView.image = UIImage(named: "me")
        }else{
            iconView.image = UIImage(data: data!)
        }
        
        iconViewBottomCons.constant = UIScreen.main.bounds.height - 250
        UIView.animate(withDuration: 1.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 5.0, options: []) {
            self.view.layoutIfNeeded()
        } completion: { _ in
            UIApplication.shared.keyWindow?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
        }

    }
}
