//
//  WebsiteListTableViewController.swift
//  Project4
//
//  Created by Emma Lee-Choon on 17/04/2019.
//  Copyright © 2019 Emma Lee-Choon. All rights reserved.
//

import UIKit

class WebsiteListTableViewController: UITableViewController {
    
    var presenter: ListWebsitesPresenter!
    
    override func viewDidLoad() {
        presenter.viewReady()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "websiteCell", for: indexPath)
        cell.textLabel?.text = presenter.website(at: indexPath.row)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectWebsite(indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "WebsiteSelected":
            if let destinationVC = segue.destination as? ViewController,
                let url = presenter.getSelectedWebsite() {
                destinationVC.initialUrl = url
            }
        default:
            fatalError()
        }
    }
}
