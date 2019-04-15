//
//  DetailViewController.swift
//  Project3
//
//  Created by Emma Lee-Choon on 12/04/2019.
//  Copyright © 2019 Emma Lee-Choon. All rights reserved.
//

import UIKit

protocol DetailViewProtocol: class {
    func set(largeTitleDisplayMode: LargeTitleDisplayMode)
    func set(image: String)
    func set(title: String)
    func showShareOptions()
}

class DetailViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    var presenter: DetailViewPresenter!
    var router: DetailViewRouter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewReady()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @IBAction func shareTapped(_ sender: Any) {
        presenter.shareTapped()
    }
}

extension DetailViewController: DetailViewProtocol {
    func set(largeTitleDisplayMode: LargeTitleDisplayMode) {
        self.navigationItem.largeTitleDisplayMode = UINavigationItem.LargeTitleDisplayMode(rawValue: largeTitleDisplayMode.rawValue)!
    }
    
    func set(image: String) {
        self.image.image = UIImage(named: image)
    }
    
    func set(title: String) {
        self.title = title
    }
    
    func showShareOptions() {
        guard let image = image.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}
