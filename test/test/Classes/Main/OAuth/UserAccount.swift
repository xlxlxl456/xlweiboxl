//
//  UserAccount.swift
//  test
//
//  Created by UCL on 2021/12/31.
//

import UIKit

class UserAccount: NSObject,Codable {
    
    var access_token: String?
    var expires_in: TimeInterval = 0.0
    var uid: String?
    
    var expires_date: Date?
    var screen_name: String?
    var avatar_large: String?
    
    init(dict: [String: AnyObject]){
        super.init()
        
        self.access_token = dict["access_token"] as? String
        self.expires_in = dict["expires_in"] as! TimeInterval
        self.uid = dict["uid"] as? String
        self.expires_date = Date(timeIntervalSinceNow: self.expires_in)
//        setValuesForKeys(dict)
    }
    
//    override class func setValue(_ value: Any?, forKey key: String) {}
    
//    override var description: String{
//        return self.dictionaryWithValues(forKeys: ["expires_in","uid"]).description
//    }
    
//    func encode(with coder: NSCoder) {
//        coder.encode(access_token,forKey:"access_token")
//        coder.encode(screen_name,forKey:"screen_name")
//        coder.encode(uid,forKey:"uid")
//        coder.encode(avatar_large,forKey:"avatar_large")
//        coder.encode(expires_date,forKey:"expires_date")
//    }
//
//    required init?(coder: NSCoder) {
//        access_token = coder.decodeObject(forKey: "access_token") as? String
//        screen_name = coder.decodeObject(forKey: "screen_name") as? String
//        uid = coder.decodeObject(forKey: "uid") as? String
//        avatar_large = coder.decodeObject(forKey: "avatar_large") as? String
//        expires_date = coder.decodeObject(forKey: "expires_date") as? NSDate
//    }
    
    private enum CodingKeys: String, CodingKey {
        case access_token
        case expires_in
        case uid
        case expires_date
        case screen_name
        case avatar_large
    }

    required init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        access_token = try values.decode(String.self, forKey: .access_token)
        expires_in = try values.decode(TimeInterval.self, forKey: .expires_in)
        uid = try values.decode(String.self, forKey: .uid)
        expires_date = try values.decode(Date.self, forKey: .expires_date)
        screen_name = try values.decode(String.self, forKey: .screen_name)
        avatar_large = try values.decode(String.self, forKey: .avatar_large)
    }
    
}
