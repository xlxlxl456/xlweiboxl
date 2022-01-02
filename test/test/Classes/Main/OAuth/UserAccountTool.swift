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
    var accountPath: String{
        let accountPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        return (accountPath as NSString).appendingPathComponent("account.json")
    }
    var isLogin: Bool {
        if account == nil {
            return false
        }
        
        guard let expiresDateString = account?.expires_date else{
            return false
        }
        
        let dateFormatter = DateFormatter()
        let expiresDate = dateFormatter.date(from: expiresDateString)
        return expiresDate!.compare(Date()) == ComparisonResult.orderedAscending
    }
    
    init(){
        
        guard let accountData = try? Data(contentsOf: URL(fileURLWithPath: accountPath)) else{
            return
        }
        account = try? JSONDecoder().decode(UserAccount.self, from: accountData)
    }
}
