//
//  UserAccountTool.swift
//  test
//
//  Created by UCL on 2022/01/01.
//

import UIKit

class UserAccountTool {
    
    static let share:UserAccountTool = UserAccountTool()
    
    var account: UserAccount?
    var accountPath: String?
    var isLogin: Bool = false
    
    init(){
        accountPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        accountPath = (accountPath! as NSString).appendingPathComponent("account.json")
        let accountData = try! Data(contentsOf: URL(fileURLWithPath: accountPath!))
        account = try? JSONDecoder().decode(UserAccount.self, from: accountData)
        isLogin = account?.expires_date!.compare(Date()) == ComparisonResult.orderedAscending
    }
}
