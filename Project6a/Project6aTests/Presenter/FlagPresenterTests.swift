//
//  FlagPresenterTests.swift
//  Project6aTests
//
//  Created by Emma Lee-Choon on 14/04/2019.
//  Copyright © 2019 Emma. All rights reserved.
//

import XCTest
@testable import Project6a

class FlagPresenterTests: XCTestCase {

    var flagPresenter: FlagPresenter!
    var mockView: MockFlagView!
    
    override func setUp() {
        mockView = MockFlagView()
        
        let interactor = FlagInteractor()
        flagPresenter = FlagPresenter(interactor: interactor)
        flagPresenter.view = mockView
    }

    override func tearDown() {
        flagPresenter = nil
        mockView = nil
    }

    func testFlagPresenter_viewReady_callsView() {
        flagPresenter.viewReady()
        XCTAssertTrue(mockView.setButtonBorderWidthCalled)
        XCTAssertTrue(mockView.setButtonBorderColorCalled)
        XCTAssertTrue(mockView.displayScoreCalled)
    }
    
    func testFlagPresenter_askQuestion_callsView() {
        flagPresenter.askQuestion()
        XCTAssertTrue(mockView.setButton1ImageCalled)
        XCTAssertTrue(mockView.setButton2ImageCalled)
        XCTAssertTrue(mockView.setButton3ImageCalled)
        XCTAssertTrue(mockView.setTitleCalled)
    }

    func testFlagPresenter_askQuestion_incrementsNumberOfQuestions() {
        XCTAssertTrue(flagPresenter.numberOfQuestions == 0)
        flagPresenter.askQuestion()
        XCTAssertTrue(flagPresenter.numberOfQuestions == 1)
    }
    
    func testFlagPresenter_resetGame_callsView() {
        flagPresenter.resetGame()
        XCTAssertTrue(mockView.displayScoreCalled)
    }
    
    func testFlagPresenter_resetGame_setsScoreQuestions() {
        flagPresenter.score = 10
        flagPresenter.numberOfQuestions = 10
        flagPresenter.resetGame()
        
        XCTAssertTrue(flagPresenter.score == 0)
        XCTAssertTrue(flagPresenter.numberOfQuestions == 1)
    }
    
    func testPresenter_didTapButton_callsView() {
        flagPresenter.didTapButton(tag: 0)
        XCTAssertTrue(mockView.displayScoreCalled)
    }
    
    func testPresenter_didTapButton_finalAlert() {
        flagPresenter.numberOfQuestions = 10
        flagPresenter.didTapButton(tag: 0)
        XCTAssertTrue(mockView.displayFinalAlertCalled)
        XCTAssertFalse(mockView.displayAlertCalled)
    }
    
    func testPresenter_didTapButton_alert() {
        flagPresenter.numberOfQuestions = 5
        flagPresenter.didTapButton(tag: 0)
        XCTAssertTrue(mockView.displayAlertCalled)
        XCTAssertFalse(mockView.displayFinalAlertCalled)
    }
}
