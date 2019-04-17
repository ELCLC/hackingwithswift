//
//  BrowserInteractor.swift
//  Project4
//
//  Created by Emma Lee-Choon on 17/04/2019.
//  Copyright © 2019 Emma Lee-Choon. All rights reserved.
//

import Foundation

class ListWebsitesInteractor {
    
    var gateway: WebsiteGateway!
    
    init(gateway: WebsiteGateway) {
        self.gateway = gateway
    }
    
    func getWebsites() -> [String] {
        return gateway.getAllowedWebsites()
    }
}
