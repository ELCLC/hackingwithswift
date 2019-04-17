//
//  WebsiteGateway
//  Project4
//
//  Created by Emma Lee-Choon on 17/04/2019.
//  Copyright © 2019 Emma Lee-Choon. All rights reserved.
//

import Foundation

protocol WebsiteGatewayProtocol: class {
    func getAllowedWebsites() -> [String]
}

class WebsiteGateway: WebsiteGatewayProtocol {
    func getAllowedWebsites() -> [String] {
        return ["hackingwithswift.com", "apple.com"]
    }
}
