//
//  MainViewController.swift
//  test
//
//  Created by UCL on 2021/12/26.
//

import UIKit

class MainViewController: UITabBarController {
    
    private lazy var composeBtn: UIButton = UIButton(imageName: "Post", bgImageName: "")

    override func viewDidLoad() {
        super.viewDidLoad()

        setupComposeBtn()
    }
}

extension MainViewController{
    private func setupComposeBtn(){
        tabBar.addSubview(composeBtn)
        composeBtn.center = CGPoint(x: tabBar.center.x, y: tabBar.bounds.size.height*0.6)
        
        composeBtn.addTarget(self, action: #selector(self.composeBtnClick), for: .touchUpInside)
    }
    
    @objc private func composeBtnClick(){
        print("13")
    }
}
