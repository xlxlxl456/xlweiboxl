//
//  OAuthViewController.swift
//  test
//
//  Created by UCL on 2021/12/29.
//

import UIKit
import WebKit

class OAuthViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self

        setupNavigationBar()
        loadPage()
    }
}

extension OAuthViewController{
    private func setupNavigationBar(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(closeItemClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Fill", style: .plain, target: self, action: #selector(fillItemClick))
        navigationItem.title = "Login"
    }
    
    private func loadPage(){
        let urlString = "https://api.weibo.com/oauth2/authorize?client_id=\(app_key)&redirect_uri=\(redirect_uri)"
        
        webView.load(URLRequest(url: URL(string: urlString)!))
    }
}

extension OAuthViewController{
    @objc private func closeItemClick(){
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func fillItemClick(){
//        let jsCode = ""
//        webView.evaluateJavaScript(jsCode, in: webView)
    }
}

extension OAuthViewController: WKNavigationDelegate{
//    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
//        <#code#>
//    }
//
//    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        <#code#>
//    }
//
//    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
//        <#code#>
//    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        guard let url = navigationAction.request.url else {
            return decisionHandler(.allow)
        }
        
        let urlString = url.absoluteString
        
        guard urlString.contains("code=") else{
            return decisionHandler(.allow)
        }
        
        let code:String = urlString.components(separatedBy: "code=").last!
        loadAccessToken(code: code)
        
        decisionHandler(.allow)
    }
}

extension OAuthViewController{
    private func loadAccessToken(code: String){
        NetworkTools.shareInstance.loadAccessToken(code: code) { [self] result, error in
            if error != nil {
                print(error as Any)
                return
            }
            
            guard let accountDict = result else{
                print("No authorized data")
                return
            }
            
            let account = UserAccount(dict: accountDict)
            
            loadUserInfo(account: account)
        }
    }
    
    private func loadUserInfo(account: UserAccount){
        guard let accessToken = account.access_token else{
            return
        }
        guard let uid = account.uid else{
            return
        }
        
        NetworkTools.shareInstance.loadUserInfo(access_token: accessToken, uid: uid) { Result, Error in
            if Error != nil {
                print(Error as Any)
            }
            
            guard let userInfoDict = Result else {
                return
            }
            
            account.screen_name = userInfoDict["name"] as? String
            account.avatar_large = userInfoDict["avatar_large"] as? String
            
            var accountPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            accountPath = (accountPath as NSString).appendingPathComponent("account.json")
            
            let data = try? JSONEncoder().encode(account)
            
            try? data?.write(to: URL(fileURLWithPath: accountPath))
            
//            let accountJson:[String : Any] = ["access_token": account.access_token,"uid": account.uid,"expires_date": account.expires_date,"screen_name": account.screen_name,"avatar_large": account.avatar_large]
            
            
//            try! NSKeyedArchiver.archivedData(withRootObject: accountData, requiringSecureCoding: true)
//            if let dataToBeArchived = try? NSKeyedArchiver.archivedData(withRootObject: account, requiringSecureCoding: false) {
//                try? dataToBeArchived.write(to: URL(fileURLWithPath: accountPath))
//            }
        }
    }
}

