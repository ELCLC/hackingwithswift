//
//  ViewController.swift
//  Project1
//
//  Created by Emma Lee-Choon on 12/04/2019.
//  Copyright © 2019 Emma Lee-Choon. All rights reserved.
//

import UIKit

protocol StormViewerViewProtocol: class {
    func set(largeTitles: Bool)
    func set(title: String)
    func navigateToDetail()
    func showRecommendOptions(message: String)
}

class StormViewerViewController: UITableViewController {

    var presenter: StormViewerPresenter!
    var router: StormViewerRouter!
    @IBOutlet weak var recommendButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewReady()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = presenter.text(at: indexPath.row)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelect(row: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "PresentDetail":
            if let id = presenter.selectedId {
                router.configureDetail(viewController: segue.destination, id: id)
            }
        default:
            fatalError()
        }
    }
    
    @IBAction func recommendTapped(_ sender: Any) {
        presenter.recommendTapped()
    }
}

extension StormViewerViewController: StormViewerViewProtocol {
    func set(largeTitles: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func set(title: String) {
        self.title = title
    }
    
    func navigateToDetail() {
        performSegue(withIdentifier: "PresentDetail", sender: nil)
    }
    
    func showRecommendOptions(message: String) {
        let activityViewController = UIActivityViewController(activityItems: [message], applicationActivities: [])
        activityViewController.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(activityViewController, animated: true)
    }
}
