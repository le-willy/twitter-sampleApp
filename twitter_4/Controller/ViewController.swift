//
//  ViewController.swift
//  twitter_4
//
//  Created by Willy Sato on 2022/02/23.
//

import UIKit
import SideMenu

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
 var menu: SideMenuNavigationController?
 
 var items = [TweetModel(name: "Zsw", tweet: "Hello World", time: Date().timeIntervalSince1970 - 123456, likes: 1000, retweet: 2000, quoteR: 3000, reply: []),
              TweetModel(name: "Rew", tweet: "Hello World2", time: Date().timeIntervalSince1970 - 123456, likes: 2, retweet: 3, quoteR: 4, reply: []),
              TweetModel(name: "Pok", tweet: "Hello World3", time: Date().timeIntervalSince1970 - 1234536, likes: 34, retweet: 56, quoteR: 432, reply: []),
              TweetModel(name: "Rpk", tweet: "Hello World3", time: Date().timeIntervalSince1970 - 12345326, likes: 24, retweet: 30, quoteR: 78, reply: []),
              TweetModel(name: "Crl", tweet: "Hello World4", time: Date().timeIntervalSince1970 - 12323456, likes: 98, retweet: 45, quoteR: 21, reply: []),
              TweetModel(name: "P09", tweet: "Hello World5", time: Date().timeIntervalSince1970 - 123454236, likes: 900, retweet: 3342, quoteR: 4156, reply: []),
              TweetModel(name: "Kji", tweet: "Hello World6", time: Date().timeIntervalSince1970 - 12345666, likes: 456, retweet: 737, quoteR: 456, reply: []),
              TweetModel(name: "😇", tweet: "Hello World7", time: Date().timeIntervalSince1970 - 123456, likes: 368, retweet: 4, quoteR: 8, reply: [])]
 
 override func viewDidLoad() {
  super.viewDidLoad()
  
  let reply1 = TweetModel(name: "Ze", tweet: "Hi", time: Date().timeIntervalSince1970 - 12345634, likes: 2, retweet: 3, quoteR: 4, reply: [])
  let reply2 =  TweetModel(name: "Pu", tweet: "Hi2", time: Date().timeIntervalSince1970 - 12345634, likes: 23, retweet: 40, quoteR: 32, reply: [])
  let reply3 = TweetModel(name: "Thu", tweet: "Hi3", time: Date().timeIntervalSince1970 - 12345634, likes: 321, retweet: 234, quoteR: 498, reply: [])
  let reply4 = TweetModel(name: "Mji", tweet: "Hi4", time: Date().timeIntervalSince1970 - 12345634, likes: 34, retweet: 98, quoteR: 84, reply: [])
  
  items[0].reply.append(reply1)
  items[1].reply.append(reply2)
  items[2].reply.append(reply3)
  items[3].reply.append(reply4)
  
  let tableView = UITableView(frame: self.view.bounds, style: .plain )
  tableView.delegate = self
  tableView.dataSource = self
  tableView.sectionHeaderHeight = 0.1
  view.addSubview(tableView)
  
  menu = SideMenuNavigationController(rootViewController: SideMenuController())
  menu?.leftSide = true
  SideMenuManager.default.leftMenuNavigationController = menu
  SideMenuManager.default.addPanGestureToPresent(toView: self.view)
  
 }
 func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
  return UIView()
 }
 
 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  return items.count
 }
 
 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  tableView.register(UINib(nibName: "FirstTableViewCell", bundle: nil), forCellReuseIdentifier: "firstCell")
  navigationController?.navigationBar.topItem?.title = "Home"
  let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath) as! FirstTableViewCell
  let now = Date().timeIntervalSince1970
  let past = items[indexPath.row].time
  
  cell.name.text = items[indexPath.row].name
  cell.tweet.text = items[indexPath.row].tweet
  cell.time.text = items[indexPath.row].timeCheck(now: now, past: past)
  
  return cell
 }
 
 
 func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  let tweetDetail = storyboard?.instantiateViewController(withIdentifier: "twitterDetail") as! TwitterDetailViewController
  let time = items[indexPath.row].time
  
  tweetDetail.tweet = items[indexPath.row].tweet
  tweetDetail.name = items[indexPath.row].name
  tweetDetail.time = items[indexPath.row].dateFormat(time: time)
  tweetDetail.retweet = items[indexPath.row].retweet
  tweetDetail.quoteRet = items[indexPath.row].quoteR
  tweetDetail.like = items[indexPath.row].likes
  tweetDetail.reply = items[indexPath.row].reply
  
  navigationController?.pushViewController(tweetDetail, animated: true)
  tableView.deselectRow(at: indexPath, animated: true)
 }
 
 @IBAction func didTapMenu() {
  present(menu!, animated: true)
 }
 
 
}

