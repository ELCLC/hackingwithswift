//
//  Project2Mocks.swift
//  Project2Tests
//
//  Created by Emma Lee-Choon on 14/04/2019.
//  Copyright © 2019 Emma. All rights reserved.
//

import UIKit
import Foundation
@testable import Project2

class MockFlagPresenter: FlagPresenter {
    var viewReadyCalled = false
    var didTapButtonCalled = false
    var resetGameCalled = false
    var askQuestionCalled = false
    
    override func viewReady() {
        viewReadyCalled = true
    }
    
    override func didTapButton(tag: Int) {
        didTapButtonCalled = true
    }
    
    override func resetGame() {
        resetGameCalled = true
    }
    
    override func askQuestion() {
        askQuestionCalled = true
    }
}

class MockFlagView: FlagViewProtocol {
    var setButtonBorderWidthCalled = false
    var setButtonBorderColorCalled = false
    var displayScoreCalled = false
    var setButton1ImageCalled = false
    var setButton2ImageCalled = false
    var setButton3ImageCalled = false
    var setTitleCalled = false
    var displayFinalAlertCalled = false
    var displayAlertCalled = false
    
    func set(buttonBorderWidth: CGFloat) {
        setButtonBorderWidthCalled = true
    }
    
    func set(buttonBorderColor: ButtonColor) {
        setButtonBorderColorCalled = true
    }
    
    func display(score: Int) {
        displayScoreCalled = true
    }
    
    func set(button1Image: String) {
        setButton1ImageCalled = true
    }
    
    func set(button2Image: String) {
        setButton2ImageCalled = true
    }
    
    func set(button3Image: String) {
        setButton3ImageCalled = true
    }
    
    func set(title: String) {
        setTitleCalled = true
    }
    
    func displayFinalAlert(title: String, message: String, actionTitle: String) {
        displayFinalAlertCalled = true
    }
    
    func displayAlert(title: String, message: String, actionTitle: String) {
        displayAlertCalled = true
    }
}
