//
//  SideMenuController.swift
//  Twitter_2
//
//  Created by Willy Sato on 2022/02/15.
//

import UIKit
import SideMenu

class SideMenuController: UITableViewController {
    
    var menu = ["Profile", "Lists", "Topics", "Bookmarks", "Moments", "Purchases", "Monetization", "Setting and privacy", "Help Center"]
    
    override func viewDidLoad() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = menu[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
