//
//  ListWebsitesPresenter.swift
//  Project4
//
//  Created by Emma Lee-Choon on 17/04/2019.
//  Copyright © 2019 Emma Lee-Choon. All rights reserved.
//

import Foundation

class ListWebsitesPresenter {
    
    var interactor: ListWebsitesInteractor!
    var websites: [String]?
    var selectedWebsite: Int?
    
    init(interactor: ListWebsitesInteractor) {
        self.interactor = interactor
    }
    
    func viewReady() {
        self.websites = interactor.getWebsites()
    }
    
    func numberOfRows() -> Int {
        return websites?.count ?? 0
    }
    
    func website(at row: Int) -> String {
        return websites?[row] ?? ""
    }
    
    func didSelectWebsite(_ row: Int) {
        self.selectedWebsite = row
    }
    
    func getSelectedWebsite() -> String? {
        guard let selectedWebsite = selectedWebsite,
            let website = websites?[selectedWebsite] else {
            return nil
        }
        return website
    }
}
