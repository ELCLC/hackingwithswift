//
//  DetailViewPresenterTests.swift
//  Project3Tests
//
//  Created by Emma Lee-Choon on 13/04/2019.
//  Copyright © 2019 Emma Lee-Choon. All rights reserved.
//

import XCTest
@testable import Project3

class DetailViewPresenterTests: XCTestCase {
    var detailViewPresenter: DetailViewPresenter!
    var mockInteractor: MockInteractor!
    var mockDetailViewProtocol: MockDetailViewProtocol!
    
    override func setUp() {
        mockInteractor = MockInteractor()
        mockDetailViewProtocol = MockDetailViewProtocol()
        
        detailViewPresenter = DetailViewPresenter(interactor: mockInteractor, id: 10)
        detailViewPresenter.view = mockDetailViewProtocol
    }

    override func tearDown() {
        detailViewPresenter = nil
        mockInteractor = nil
        mockDetailViewProtocol = nil
    }

    func testDetailViewPresenter_viewReady_callsView() {
        detailViewPresenter.viewReady()
        
        XCTAssertTrue(mockDetailViewProtocol.setLargeTitleDisplayModeCalled)
        XCTAssertTrue(mockDetailViewProtocol.setTitleCalled)
        XCTAssertTrue(mockDetailViewProtocol.setImageCalled)
    }
    
    func testDetailViewPresenter_viewReady_noImage() {
        detailViewPresenter = DetailViewPresenter(interactor: mockInteractor, id: 0)
        detailViewPresenter.view = mockDetailViewProtocol
        detailViewPresenter.viewReady()
        
        XCTAssertTrue(mockDetailViewProtocol.setLargeTitleDisplayModeCalled)
        XCTAssertFalse(mockDetailViewProtocol.setTitleCalled)
        XCTAssertFalse(mockDetailViewProtocol.setImageCalled)
    }
    
    func testDetailViewPresenter_shareTapped_callsView() {
        detailViewPresenter.shareTapped()
        XCTAssertTrue(mockDetailViewProtocol.showShareOptionsCalled)
    }
}
