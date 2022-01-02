//
//  BaseViewController.swift
//  test
//
//  Created by UCL on 2021/12/28.
//

import UIKit

class BaseViewController: UITableViewController {

    lazy var visitorView: VisitorView = VisitorView.visitorView()

    var isLogin: Bool = UserAccountTool.share.isLogin
    
    override func loadView() {
//        var accountPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
//        accountPath = (accountPath as NSString).appendingPathComponent("account.json")
//        let accountData = try! Data(contentsOf: URL(fileURLWithPath: accountPath))
//        let account = try? JSONDecoder().decode(UserAccount.self, from: accountData)

//        if let account = account {
//            if let expiresDate = account.expires_date{
//                isLogin = expiresDate.compare(Date()) == ComparisonResult.orderedAscending
//            }
//            isLogin = true
//        }
        
        isLogin ? super.loadView() : setupVisitorView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationItems()
    }
}

extension BaseViewController{
    private func setupVisitorView(){
        view = visitorView
        
        visitorView.registBtn.addTarget(self, action: #selector(self.registBtnClick), for: .touchUpInside)
        visitorView.loginBtn.addTarget(self, action: #selector(self.loginBtnClick), for: .touchUpInside)
    }
    
    private func setupNavigationItems(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Regist", style: .plain, target: self, action: #selector(self.registBtnClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Login", style: .plain, target: self, action: #selector(self.loginBtnClick))
    }
}

extension BaseViewController{
    @objc private func registBtnClick(){
        
    }
    @objc private func loginBtnClick(){
        let oauthVc = OAuthViewController()
        
        let oauthNav = UINavigationController(rootViewController: oauthVc)
        oauthNav.modalPresentationStyle = .custom
        
        present(oauthNav, animated: true, completion: nil)
    }
}
