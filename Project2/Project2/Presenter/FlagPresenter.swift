//
//  FlagPresenter.swift
//  Project2
//
//  Created by Emma Lee-Choon on 14/04/2019.
//  Copyright © 2019 Emma. All rights reserved.
//

import Foundation

enum ButtonColor: Int {
    case lightGray = 0
}

class FlagPresenter {
    
    var interactor: FlagInteractorProtocol!
    weak var view: FlagViewProtocol?
    var countries: [String]!
    var correctAnswer = 0
    var score = 0
    var numberOfQuestions = 0

    init(interactor: FlagInteractorProtocol) {
        self.interactor = interactor
        countries = self.interactor.getFlags()
    }
    
    func viewReady() {
        view?.set(buttonBorderWidth: 1)
        view?.set(buttonBorderColor: .lightGray)
        view?.display(score: score)
        askQuestion()
    }
    
    func askQuestion() {
        if numberOfQuestions < 10 {
            numberOfQuestions += 1
        }
        
        countries.shuffle()
        
        view?.set(button1Image: countries[0])
        view?.set(button2Image: countries[1])
        view?.set(button3Image: countries[2])

        correctAnswer = Int.random(in: 0...2)
        
        view?.set(title: countries[correctAnswer].uppercased())
    }
    
    func resetGame() {
        score = 0
        numberOfQuestions = 0
        view?.display(score: score)
        askQuestion()
    }
    
    func didTapButton(tag: Int) {
        var title = ""
        var message = "You're right!"
        
        if tag == correctAnswer {
            score += 1
            title = "Correct"
        }
        else {
            score -= 1
            title = "Wrong"
            message = "That's the flag for \(countries[tag].uppercased())"
        }
        
        view?.display(score: score)
        
        if numberOfQuestions == 10 {
            view?.displayFinalAlert(title: "Game Over", message: "Your final score is \(score)", actionTitle: "Start Again")
        }
        else {
            view?.displayAlert(title: title, message: message, actionTitle: "Continue")
        }
    }
}
