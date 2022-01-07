//
//  Status.swift
//  test
//
//  Created by UCL on 2022/01/02.
//

import UIKit

class Status: NSObject {

    var created_at: String?
    var source: String?
    var text: String?
    var mid: String?
    var user:User?
    var pic_urls: [[String: String]]?
    var retweeted_status: Status?
    
    init(dict: [String : AnyObject]){
        super.init()
        
        created_at = dict["created_at"] as? String
        source = dict["source"] as? String
        text = dict["text"] as? String
        mid = dict["mid"] as? String
        
//        guard let source = source, source != "" else {
//            return
//        }
//        let startindex = (source as NSString).range(of: ">").location+1
//        let length = (source as NSString).range(of: "</").location - startindex
//        sourceText = (source as NSString).substring(with: NSRange(location: startindex, length: length))
//        
//        guard let createAt = created_at else {
//            return
//        }
//        createAtText = createAtText(createAt: createAt)
        
        if let userDict = dict["user"] as? [String : AnyObject] {
            user = User(dict: userDict)
        }
        
        pic_urls = dict["pic_urls"] as? [[String : String]]
        
        if let retweetedStatusDict = dict["retweeted_status"] as? [String : AnyObject] {
            retweeted_status = Status(dict: retweetedStatusDict)
        }
        
    }
}
