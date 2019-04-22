//
//  ViewController.swift
//  Project7
//
//  Created by Emma Lee-Choon on 22/04/2019.
//  Copyright © 2019 Emma. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var petitions = [Petition]()
    var filteredPetitions = [Petition]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Credits", style: .plain, target: self, action: #selector(showCredits))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(filterAction))
        
        let urlString: String
        
        if navigationController?.tabBarItem.tag == 0 {
            // urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
            urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        } else {
            // urlString = "https://api.whitehouse.gov/v1/petitions.json?signatureCountFloor=10000&limit=100"
            urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
        }
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                if let petitions = try? JSONDecoder().decode(Petitions.self, from: data) {
                    self.petitions = petitions.results
                    self.filteredPetitions = petitions.results
                    tableView.reloadData()
                }
                else {
                    showError()
                }
            }
            else {
                showError()
            }
        }
    }
    
    @objc func filterAction() {
        let ac = UIAlertController(title: "Filter", message: "Enter a word/phrase to filter by", preferredStyle: .alert)
        ac.addTextField()
        let action = UIAlertAction(title: "Go", style: .default, handler: {  [weak self, weak ac] (alert) in
                self?.filterPetitions(filterParameter: ac?.textFields?[0].text)
            })
        ac.addAction(action)
        present(ac, animated: true)
    }
    
    @objc func filterPetitions(filterParameter: String?) {
        if let parameter = filterParameter {
            if parameter.count > 0 {
                filteredPetitions = [Petition]()
                for petition in petitions {
                    if petition.title.contains(parameter) || petition.body.contains(parameter) {
                        filteredPetitions.append(petition)
                    }
                }
                tableView.reloadData()
            }
        }
    }
    
    @objc func showCredits() {
        let ac = UIAlertController(title: "Credits", message: "The data comes from the We The People API of the Whitehouse", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        ac.addAction(action)
        present(ac, animated: true)
    }

    func showError() {
        let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPetitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = filteredPetitions[indexPath.row].title
        cell.detailTextLabel?.text = filteredPetitions[indexPath.row].body
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = filteredPetitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

