//
//  UserAccount.swift
//  test
//
//  Created by UCL on 2021/12/31.
//

import UIKit

class UserAccount: NSObject {
    
    var access_token: String?
    var expires_in: TimeInterval = 0.0
    var uid: String?
    
    var expires_date: NSDate?
    
    init(dict: [String: AnyObject]){
        super.init()
        
        self.access_token = dict["access_token"] as? String
        self.expires_in = dict["expires_in"] as! TimeInterval
        self.uid = dict["uid"] as? String
        self.expires_date = NSDate(timeIntervalSinceNow: self.expires_in)
//        setValuesForKeys(dict)
    }
    
//    override class func setValue(_ value: Any?, forKey key: String) {}
    
//    override var description: String{
//        return self.dictionaryWithValues(forKeys: ["expires_in","uid"]).description
//    }
    
}
