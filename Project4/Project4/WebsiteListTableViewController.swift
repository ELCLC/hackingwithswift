//
//  WebsiteListTableViewController.swift
//  Project4
//
//  Created by Emma Lee-Choon on 17/04/2019.
//  Copyright © 2019 Emma Lee-Choon. All rights reserved.
//

import UIKit

class WebsiteListTableViewController: UITableViewController {

    var websites = ["hackingwithswift.com", "apple.com"]

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return websites.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "websiteCell", for: indexPath)
        cell.textLabel?.text = websites[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "WebsiteSelected":
            if let destinationVC = segue.destination as? ViewController {
                destinationVC.selectedWebsite = tableView.indexPathForSelectedRow?.row
            }
        default:
            fatalError()
        }
    }
}
