//
//  TwitterDetailViewController.swift
//  twitter_4
//
//  Created by Willy Sato on 2022/02/24.
//

import UIKit

class TwitterDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tweetModel = TweetModel()
    
    var reply: [TweetModel] = []
    var count = 0
    var name = ""
    var tweet = ""
    var time = ""
    var like = 0.0
    var retweet = 0.0
    var quoteRet = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.sectionHeaderHeight = 0.1
        view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reply.count + 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch count {
        case 0:
            tableView.register(UINib(nibName: "SecondTableViewCell", bundle: nil), forCellReuseIdentifier: "secondCell")
            let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath) as! SecondTableViewCell
            
            cell.tweet.text = tweet
            cell.name.text = "Account Name"
            count += 1
            return cell
            
        case 1:
            tableView.register(UINib(nibName: "ThirdTableViewCell", bundle: nil), forCellReuseIdentifier: "thirdCell")
            let cell = tableView.dequeueReusableCell(withIdentifier: "thirdCell", for: indexPath) as! ThirdTableViewCell
            cell.retweetCount = retweet
            cell.quoteCount = quoteRet
            count += 1
            return cell
            
        case 2:
            tableView.register(UINib(nibName: "LikesTableViewCell", bundle: nil), forCellReuseIdentifier: "likeCell")
            let cell = tableView.dequeueReusableCell(withIdentifier: "likeCell", for: indexPath) as! LikesTableViewCell
            cell.likeCount = like
            count += 1
            return cell
            
        case 3:
            tableView.register(UINib(nibName: "FourthTableViewCell", bundle: nil), forCellReuseIdentifier: "fourthCell")
            let cell = tableView.dequeueReusableCell(withIdentifier: "fourthCell", for: indexPath) as! FourthTableViewCell
            count += 1
            return cell
            
        default:
            tableView.register(UINib(nibName: "FirstTableViewCell", bundle: nil), forCellReuseIdentifier: "firstCell")
            let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath) as! FirstTableViewCell

            
            cell.tweet.text = reply[count - 4].tweet
            cell.time.text = reply[count - 4].dateFormat(time: Date().timeIntervalSince1970 - 1234455)
            cell.name.text = reply[count - 4].name
            return cell
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }

}
