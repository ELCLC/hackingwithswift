//
//  StormViewerRouterTests.swift
//  Project3Tests
//
//  Created by Emma Lee-Choon on 13/04/2019.
//  Copyright © 2019 Emma Lee-Choon. All rights reserved.
//

import XCTest
@testable import Project3

class StormViewerRouterTests: XCTestCase {

    var stormViewerRouter: StormViewerRouter!
    var mockStormViewerViewController: MockStormViewerViewController!
    var mockDetailViewController: MockDetailViewController!

    override func setUp() {
        let mockInteractor = MockInteractor()
        mockStormViewerViewController = MockStormViewerViewController()
        mockDetailViewController = MockDetailViewController()

        stormViewerRouter = StormViewerRouter(interactor: mockInteractor)
    }

    override func tearDown() {
        stormViewerRouter = nil
        mockStormViewerViewController = nil
        mockDetailViewController = nil
    }

    func testStormViewerRouter_assemble_setsProperties() {
        stormViewerRouter.assemble(viewController: mockStormViewerViewController)

        XCTAssertNotNil(mockStormViewerViewController.router)
        XCTAssertNotNil(mockStormViewerViewController.presenter)
        XCTAssertTrue(mockStormViewerViewController.router === stormViewerRouter)
    }

    func testStormViewerRouter_configureDetail_assemblesDetailVC() {
        stormViewerRouter.configureDetail(viewController: mockDetailViewController, id: 10)

        XCTAssertNotNil(mockDetailViewController.presenter)
        XCTAssertNotNil(mockDetailViewController.router)
    }
}
