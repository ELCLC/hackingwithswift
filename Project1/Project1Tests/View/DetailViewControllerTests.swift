//
//  DetailViewControllerTests.swift
//  Project1Tests
//
//  Created by Emma Lee-Choon on 13/04/2019.
//  Copyright © 2019 Emma Lee-Choon. All rights reserved.
//

import XCTest
@testable import Project1

class DetailViewControllerTests: XCTestCase {

    var detailViewController: DetailViewController!
    var mockPresenter: MockDetailViewPresenter!
    var mockImageView: MockImageView!
    var mockRouter: MockDetailViewRouter!
    
    override func setUp() {
        let mockInteractor = MockInteractor()
        mockPresenter = MockDetailViewPresenter(interactor: mockInteractor, id: 10)
        mockImageView = MockImageView()
        mockRouter = MockDetailViewRouter(interactor: mockInteractor)
        
        detailViewController = DetailViewController()
        detailViewController.presenter = mockPresenter
        detailViewController.image = mockImageView
        detailViewController.router = mockRouter
    }

    override func tearDown() {
        detailViewController = nil
        mockPresenter = nil
        mockImageView = nil
        mockRouter = nil
    }

    func testDetailVC_viewDidLoad_CallsPresenter() {
        detailViewController.viewDidLoad()
        XCTAssertTrue(mockPresenter.viewReadyCalled)
    }
    
    func testDetailVC_setTitle() {
        let testTitle = "Test Title"
        detailViewController.set(title: testTitle)
        XCTAssertTrue(detailViewController.title == testTitle)
    }
    
    func testDetailVC_setLargetTitleDisplayMode() {
        detailViewController.set(largeTitleDisplayMode: .always)
        XCTAssertTrue(detailViewController.navigationItem.largeTitleDisplayMode.rawValue == LargeTitleDisplayMode.always.rawValue)
    }
}
