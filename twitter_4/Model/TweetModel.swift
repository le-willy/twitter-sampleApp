//
//  TweetModel.swift
//  twitter_4
//
//  Created by Willy Sato on 2022/02/24.
//

import Foundation
import RealmSwift

class TweetModel: Object {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var name: String = ""
    @objc dynamic var tweet: String = ""
    @objc dynamic var time: TimeInterval = TimeInterval()
    @objc dynamic var likes: Double = 0.0
    @objc dynamic var retweet: Double = 0.0
    @objc dynamic var quoteR: Double = 0.0
    @objc dynamic var reply: String = ""
    
    func dateFormat(time: TimeInterval) -> String {
        let date = Date(timeIntervalSince1970: time)
        let formatedDate = DateFormatter()
        formatedDate.dateFormat = "dd/MM/yyyy"
        
        let dateString = formatedDate.string(from: date)
        return dateString
    }
    func limitChar() {
        if tweet.count > 140 {
            print("Error")
        } else {
            print("Post")
        }
    }
}
