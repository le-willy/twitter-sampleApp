//
//  ViewController.swift
//  twitter_4
//
//  Created by Willy Sato on 2022/02/23.
//

import UIKit
import SideMenu
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

 var menu: SideMenuNavigationController?
 var twitterModel: [TweetModel] = []
 
 override func viewDidLoad() {
  super.viewDidLoad()
  
  addButton()
  
  menu = SideMenuNavigationController(rootViewController: SideMenuController())
  menu?.leftSide = true
  SideMenuManager.default.leftMenuNavigationController = menu
  SideMenuManager.default.addPanGestureToPresent(toView: self.view)
  
 }
 
 override func viewWillAppear(_ animated: Bool) {
  super.viewWillAppear(animated)
  setData()
  let tableView = UITableView(frame: self.view.bounds, style: .plain )
  tableView.delegate = self
  tableView.dataSource = self
  tableView.sectionHeaderHeight = 0
  view.addSubview(tableView)
  tableView.reloadData()
  
 }
 
 func setData() {
  let realm = try! Realm()
  let result = realm.objects(TweetModel.self)
  twitterModel = Array(result)
  
 }
 
 @objc func addBunttonSegue() {
  let detailVC = storyboard?.instantiateViewController(withIdentifier: "postView") as! PostViewController
  navigationController?.pushViewController(detailVC, animated: true)
 }
 
 func addButton() {
  let buttonAni: Selector = #selector(addBunttonSegue)
  let setButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: buttonAni)
  navigationItem.rightBarButtonItem = setButton
 }
 
 func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
  return UIView()
 }
 
 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  return twitterModel.count
 }
 
 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  tableView.register(UINib(nibName: "FirstTableViewCell", bundle: nil), forCellReuseIdentifier: "firstCell")
  navigationController?.navigationBar.topItem?.title = "Home"
  let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath) as! FirstTableViewCell
  
  cell.name.text = "Account Name"
  cell.tweet.text = twitterModel[indexPath.row].tweet
  cell.time.text = twitterModel[indexPath.row].dateFormat(time: Date().timeIntervalSince1970 - 1234455)
  
  return cell
 }
 
 
 func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  let tweetDetail = storyboard?.instantiateViewController(withIdentifier: "twitterDetail") as! TwitterDetailViewController
  let time = twitterModel[indexPath.row].time
  
  tweetDetail.tweet = twitterModel[indexPath.row].tweet
  tweetDetail.name = twitterModel[indexPath.row].name
  tweetDetail.time = twitterModel[indexPath.row].dateFormat(time: time)
  tweetDetail.retweet = twitterModel[indexPath.row].retweet
  tweetDetail.quoteRet = twitterModel[indexPath.row].quoteR
  tweetDetail.like = twitterModel[indexPath.row].likes
  
  navigationController?.pushViewController(tweetDetail, animated: true)
  tableView.deselectRow(at: indexPath, animated: true)
 }
 
 @IBAction func didTapMenu() {
  present(menu!, animated: true)
 }
 
 func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
  let delCell = twitterModel[indexPath.row]
  let realm = try! Realm()
  try! realm.write {
   realm.delete(delCell)
  }
  
  twitterModel.remove(at: indexPath.row)
  tableView.deleteRows(at: [indexPath], with: .automatic)
 }
 
}

