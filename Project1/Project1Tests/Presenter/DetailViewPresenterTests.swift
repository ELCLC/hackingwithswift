//
//  DetailViewPresenterTests.swift
//  Project1Tests
//
//  Created by Emma Lee-Choon on 13/04/2019.
//  Copyright © 2019 Emma Lee-Choon. All rights reserved.
//

import XCTest
@testable import Project1

class DetailViewPresenterTests: XCTestCase {
    var detailViewPresenter: DetailViewPresenter!
    var mockInteractor: MockInteractor!
    var mockDetailViewProtocol: MockDetailViewProtocol!
    
    override func setUp() {
        mockInteractor = MockInteractor()
        mockDetailViewProtocol = MockDetailViewProtocol()
    }

    override func tearDown() {
        detailViewPresenter = nil
        mockInteractor = nil
        mockDetailViewProtocol = nil
    }

    func testDetailViewPresenter_viewReady_callsView() {
        detailViewPresenter = DetailViewPresenter(interactor: mockInteractor, id: 10)
        detailViewPresenter.view = mockDetailViewProtocol
        detailViewPresenter.viewReady()
        
        XCTAssertTrue(mockDetailViewProtocol.setLargetTitleDisplayModeCalled)
        XCTAssertTrue(mockDetailViewProtocol.setTitleCalled)
        XCTAssertTrue(mockDetailViewProtocol.setImageCalled)
    }
    
    func testDetailViewPresenter_viewReady_noImage() {
        detailViewPresenter = DetailViewPresenter(interactor: mockInteractor, id: 0)
        detailViewPresenter.view = mockDetailViewProtocol
        detailViewPresenter.viewReady()
        
        XCTAssertTrue(mockDetailViewProtocol.setLargetTitleDisplayModeCalled)
        XCTAssertFalse(mockDetailViewProtocol.setTitleCalled)
        XCTAssertFalse(mockDetailViewProtocol.setImageCalled)
    }
}
