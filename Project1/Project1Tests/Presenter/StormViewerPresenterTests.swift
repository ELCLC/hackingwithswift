//
//  StormViewerPresenterTests.swift
//  Project1Tests
//
//  Created by Emma Lee-Choon on 13/04/2019.
//  Copyright © 2019 Emma Lee-Choon. All rights reserved.
//

import XCTest
@testable import Project1

class StormViewerPresenterTests: XCTestCase {
    var stormViewerPresenter: StormViewerPresenter!
    var mockInteractor: MockInteractor!
    var mockViewProtocol: MockStormViewerViewProtocol!
    
    override func setUp() {
        mockInteractor = MockInteractor()
        mockViewProtocol = MockStormViewerViewProtocol()
        
        stormViewerPresenter = StormViewerPresenter(interactor: mockInteractor)
        stormViewerPresenter.view = mockViewProtocol
    }

    override func tearDown() {
        stormViewerPresenter = nil
        mockInteractor = nil
        mockViewProtocol = nil
    }

    func testStormViewerPresenter_viewReady_callsInteractor() {
        stormViewerPresenter.viewReady()
        
        XCTAssertTrue(mockInteractor.getImagesCalled)
    }

    func testStormViewerPresenter_viewReady_callsView() {
        stormViewerPresenter.viewReady()
        
        XCTAssertTrue(mockViewProtocol.setLargeTitlesCalled)
        XCTAssertTrue(mockViewProtocol.setTitleCalled)
    }
    
    func testStormViewerPresenter_didSelect_callsView() {
        stormViewerPresenter.didSelect(row: 0)
        
        XCTAssertTrue(mockViewProtocol.navigateToDetailCalled)
    }

    func testStormViewerPresenter_recommendTapped_callsView() {
        stormViewerPresenter.recommendTapped()
        XCTAssertTrue(mockViewProtocol.showRecommendOptionsCalled)
    }
}
