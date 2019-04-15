//
//  Project3Tests.swift
//  Project3Tests
//
//  Created by Emma Lee-Choon on 13/04/2019.
//  Copyright © 2019 Emma Lee-Choon. All rights reserved.
//

import XCTest
@testable import Project3

class StormViewerViewControllerTests: XCTestCase {

    var stormViewerViewController: StormViewerViewController!
    var mockTableView: MockTableView!
    var mockPresenter: MockStormViewerPresenter!
    var mockRouter: MockStormViewerRouter!
    var mockDetailViewController: MockDetailViewController!
    
    override func setUp() {
        let mockInteractor = MockInteractor()
        mockTableView = MockTableView()
        mockPresenter = MockStormViewerPresenter(interactor: mockInteractor)
        mockRouter = MockStormViewerRouter(interactor: mockInteractor)
        mockDetailViewController = MockDetailViewController()

        stormViewerViewController = StormViewerViewController()
        stormViewerViewController.tableView = mockTableView
        stormViewerViewController.presenter = mockPresenter
        stormViewerViewController.router = mockRouter
    }
    
    override func tearDown() {
        stormViewerViewController = nil
        mockTableView = nil
        mockPresenter = nil
    }
    
    func testStormViewerVC_numberOfRows_CallsPresenter() {
        let resultNumber = stormViewerViewController.tableView(mockTableView, numberOfRowsInSection: 0)
        
        XCTAssertTrue(mockPresenter.numberOfRowsCalled)
        XCTAssertTrue(resultNumber == 1)
    }
    
    func testStormViewerVC_cellForRow_CallsPresenter() {
        let resultCell = stormViewerViewController.tableView(mockTableView, cellForRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(mockPresenter.textAtRowCalled)
        XCTAssertTrue(resultCell.textLabel?.text == "Test")
    }
    
    func testStormViewerVC_didSelectRow_CallsPresenter() {
        stormViewerViewController.tableView(mockTableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(mockPresenter.didSelectRowCalled)
    }
    
    func testStormViewerVC_prepareForSegue_PresenterSelectedIdNotNil_CallsRouter() {
        mockPresenter.selectedId = 10
        
        stormViewerViewController.prepare(for: MockSegue(identifier: "PresentDetail", source: stormViewerViewController, destination: mockDetailViewController), sender: nil)
        
        XCTAssertTrue(mockRouter.configureDetailCalled)
    }
    
    func testStormViewerVC_prepareForSegue_PresenterSelectedIdNil_RouterNotCalled() {
        stormViewerViewController.prepare(for: MockSegue(identifier: "PresentDetail", source: stormViewerViewController, destination: mockDetailViewController), sender: nil)
        
        XCTAssertFalse(mockRouter.configureDetailCalled)
    }
}
