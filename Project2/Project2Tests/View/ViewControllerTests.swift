//
//  ViewControllerTests.swift
//  Project2Tests
//
//  Created by Emma Lee-Choon on 14/04/2019.
//  Copyright © 2019 Emma. All rights reserved.
//

import XCTest
@testable import Project2

class ViewControllerTests: XCTestCase {

    var viewController: ViewController!
    var mockPresenter: MockFlagPresenter!
    let mockButton1 = UIButton()
    let mockButton2 = UIButton()
    let mockButton3 = UIButton()
    let mockScoreButton = UIBarButtonItem()

    override func setUp() {
        let interactor = FlagInteractor()
        mockPresenter = MockFlagPresenter(interactor: interactor)
        
        viewController = ViewController()
        viewController.presenter = mockPresenter
        viewController.button1 = mockButton1
        viewController.button2 = mockButton2
        viewController.button3 = mockButton3
        viewController.scoreButton = mockScoreButton
    }

    override func tearDown() {
        viewController = nil
    }

    func testViewController_viewDidLoad_callsPresenter() {
        viewController.viewDidLoad()
        XCTAssertTrue(mockPresenter.viewReadyCalled)
    }
    
    func testViewController_buttonTapped_callsPresenter() {
        let mockButton = UIButton()
        mockButton.tag = 0
        viewController.buttonTapped(mockButton)
        
        XCTAssertTrue(mockPresenter.didTapButtonCalled)
    }
    
    func testViewController_resetGame_callsPresenter() {
        viewController.resetGame(action: nil)
        XCTAssertTrue(mockPresenter.resetGameCalled)
    }
    
    func testViewController_askQuestion_callsPresenter() {
        viewController.askQuestion(action: nil)
        XCTAssertTrue(mockPresenter.askQuestionCalled)
    }
    
    func testViewController_setButtonBorderWidth() {
        viewController.set(buttonBorderWidth: 10)
        XCTAssertTrue(viewController.button1.layer.borderWidth == 10)
        XCTAssertTrue(viewController.button2.layer.borderWidth == 10)
        XCTAssertTrue(viewController.button3.layer.borderWidth == 10)
    }
    
    func testViewController_setButtonBorderColor() {
        viewController.set(buttonBorderColor: .lightGray)
        
        XCTAssertTrue(viewController.button1.layer.borderColor == UIColor.lightGray.cgColor)
        XCTAssertTrue(viewController.button2.layer.borderColor == UIColor.lightGray.cgColor)
        XCTAssertTrue(viewController.button3.layer.borderColor == UIColor.lightGray.cgColor)
    }
    
    func testViewController_displayScore() {
        viewController.display(score: 100)
        XCTAssertTrue(viewController.scoreButton.title == "Score: 100")
    }
    
    func testViewController_setTitle() {
        viewController.set(title: "Test Title")
        XCTAssertTrue(viewController.title == "Test Title")
    }
}
