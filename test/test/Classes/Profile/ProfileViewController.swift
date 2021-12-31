//
//  ProfileViewController.swift
//  test
//
//  Created by UCL on 2021/12/26.
//

import UIKit

class ProfileViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        visitorView.setupVisitorViewInfo(iconName: "me", tilte: "Me")
    }

}
