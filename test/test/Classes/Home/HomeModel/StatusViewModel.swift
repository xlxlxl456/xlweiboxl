//
//  StatusViewModel.swift
//  test
//
//  Created by UCL on 2022/01/02.
//

import UIKit

class StatusViewModel: NSObject {
    var status: Status?
    
    var sourceText: String?
    var createAtText: String?
    var vipRank: String?
    var picURLs: [NSURL] = [NSURL]()
    
    init(status: Status){
        super.init()
        self.status = status
        
        if let source = status.source, status.source != "" {
            let startindex = (source as NSString).range(of: ">").location+1
            let length = (source as NSString).range(of: "</").location - startindex
            sourceText = (source as NSString).substring(with: NSRange(location: startindex, length: length))
        }
        
        
        if let createAt = status.created_at {
            createAtText = NSDate.createDateString(createAt: createAt)
        }
        
        let mbrank = status.user?.mbrank ?? 0
        if mbrank > 0 && mbrank < 8 {
            vipRank = "Vip\(mbrank)"
        }else{
            vipRank = "not vip"
        }
        let picURLDicts = status.pic_urls?.count != 0 ? status.pic_urls : status.retweeted_status?.pic_urls
        if let picURLDicts = picURLDicts {
            for picURLDict in picURLDicts {
                guard let picURLString = picURLDict["thumbnail_pic"] else {
                    continue
                }
                picURLs.append(NSURL(string: picURLString)!)
            }
        }
    }
    
}
