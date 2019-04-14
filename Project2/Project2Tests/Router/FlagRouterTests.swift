//
//  Project2Tests.swift
//  Project2Tests
//
//  Created by Emma Lee-Choon on 13/04/2019.
//  Copyright © 2019 Emma. All rights reserved.
//

import XCTest
@testable import Project2

class FlagRouterTests: XCTestCase {

    var router: FlagRouter!
    
    override func setUp() {
        router = FlagRouter()
    }

    override func tearDown() {
        router = nil
    }

    func testFlagRouter_assembleSetsProperties() {
        let viewController = ViewController()
        
        router.assemble(viewController: viewController)
        
        XCTAssertNotNil(viewController.presenter)
    }
}
