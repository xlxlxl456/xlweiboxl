//
//  User.swift
//  test
//
//  Created by UCL on 2022/01/02.
//

import UIKit

class User: NSObject {
    var profile_image_url: String?
    var screen_name: String?
    var verified_type: Int? = -1
    var mbrank: Int? = 0
    
    var verifiedImage: UIImage?
    
    
    init(dict: [String: AnyObject]) {
        super.init()
        
        profile_image_url = dict["profile_image_url"] as? String
        screen_name = dict["screen_name"] as? String
        verified_type = dict["verified_type"] as? Int
        mbrank = dict["mbrank"] as? Int
    }
}
