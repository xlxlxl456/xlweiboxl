//
//  NSDate_Extension.swift
//  test
//
//  Created by UCL on 2022/01/02.
//

import Foundation

extension NSDate {
    class func createDateString(createAt: String) -> String {
        let fmt = DateFormatter()
        fmt.dateFormat = "EEE MM dd HH:mm:ss Z yyyy"
        fmt.locale = Locale(identifier: "en")
        let nowDate = Date()
        guard let createDate = fmt.date(from: createAt) else{
            return ""
        }
        let interval = Int(nowDate.timeIntervalSince(createDate))
        if interval < 60{
            return "just now"
        }
        if interval < 60*60{
            return "\(interval/60)minutes ago"
        }
        if interval < 60*60*24{
            return "\(interval/(60*60))hours ago"
        }
        let calendar = Calendar.current
        if calendar.isDateInYesterday(createDate){
            fmt.dateFormat = "Yesterday HH:mm"
            return fmt.string(from: createDate)
        }
        let cmps = calendar.component(.year, from: createDate)
        if cmps < 1{
            fmt.dateFormat = "MM-dd HH:mm"
            return fmt.string(from: createDate)
        }
        if cmps > 1 {
            fmt.dateFormat = "yyyy-MM-dd HH:mm"
            return fmt.string(from: createDate)
        }
        
        return ""
    }
}
