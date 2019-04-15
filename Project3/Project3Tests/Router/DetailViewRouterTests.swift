//
//  DetailViewRouterTests.swift
//  Project3Tests
//
//  Created by Emma Lee-Choon on 13/04/2019.
//  Copyright © 2019 Emma Lee-Choon. All rights reserved.
//

import XCTest
@testable import Project3

class DetailViewRouterTests: XCTestCase {

    var detailViewRouter: DetailViewRouter!
    var mockDetailViewController: MockDetailViewController!
    
    override func setUp() {
        let interactor = MockInteractor()
        mockDetailViewController = MockDetailViewController()
        
        detailViewRouter = DetailViewRouter(interactor: interactor)
    }

    override func tearDown() {
        detailViewRouter = nil
        mockDetailViewController = nil
    }

    func testDetailViewRouter_assemble_setsProperties() {
        detailViewRouter.assemble(viewController: mockDetailViewController, id: 10)
        
        XCTAssertNotNil(mockDetailViewController.presenter)
        XCTAssertNotNil(mockDetailViewController.router)
        XCTAssertTrue(mockDetailViewController.router === detailViewRouter)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
