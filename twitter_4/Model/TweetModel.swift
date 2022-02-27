//
//  TweetModel.swift
//  twitter_4
//
//  Created by Willy Sato on 2022/02/24.
//

import Foundation

struct TweetModel {
    var name: String
    var tweet: String
    var time: TimeInterval
    var likes: Double
    var retweet: Double
    var quoteR: Double
    var reply: [TweetModel]
    
    func dateFormat(time: TimeInterval) -> String {
        let date = Date(timeIntervalSince1970: time)
        let formatedDate = DateFormatter()
        formatedDate.dateFormat = "HH:mm:ss dd/MM/yyyy"
        
        let dateString = formatedDate.string(from: date)
        return dateString
    }
    
    func timeCheck(now: TimeInterval, past: TimeInterval) -> String {
        let timeDiff = Int(now - past)

        let year = timeDiff / 31104000
        let month = timeDiff / 2592000
        let day = timeDiff / 86400
        let hour = timeDiff / 3600
        let minute = timeDiff / 60
        let second = timeDiff

        if year != 0 {
            return "\(year)y"
        } else if month != 0 {
            return "\(month)m"
        } else if day != 0 {
            return "\(day)d"
        } else if hour != 0 {
            return "\(hour)h"
        } else if minute != 0 {
            return "\(minute)m"
        } else {
            return "\(second)s"
        }
    }
}
