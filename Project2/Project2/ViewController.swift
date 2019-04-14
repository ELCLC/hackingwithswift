//
//  ViewController.swift
//  Project2
//
//  Created by Emma Lee-Choon on 13/04/2019.
//  Copyright © 2019 Emma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var scoreButton: UIBarButtonItem!
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    var numberOfQuestions = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateScore()
        
        countries.append("estonia")
        countries.append("france")
        countries.append("germany")
        countries.append("ireland")
        countries.append("italy")
        countries.append("monaco")
        countries.append("nigeria")
        countries.append("poland")
        countries.append("russia")
        countries.append("spain")
        countries.append("uk")
        countries.append("us")
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion(action: nil)
    }
    
    func askQuestion(action: UIAlertAction!) {
        if numberOfQuestions < 10 {
            numberOfQuestions += 1
        }

        countries.shuffle()
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = Int.random(in: 0...2)
        
        title = countries[correctAnswer].uppercased()
    }
    
    func updateScore() {
        scoreButton.title = "Score: \(score)"
    }
    
    func resetGame(action: UIAlertAction!) {
        score = 0
        numberOfQuestions = 0
        updateScore()
        askQuestion(action: nil)
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title = ""
        var message = "You're right!"
        
        if sender.tag == correctAnswer {
            score += 1
            title = "Correct"
        }
        else {
            score -= 1
            title = "Wrong"
            message = "That's the flag for \(countries[sender.tag].uppercased())"
        }
        
        updateScore()
        
        if numberOfQuestions == 10 {
            let alertController = UIAlertController(title: "Game Over", message: "Your final score is \(score)", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Start Again", style: .default, handler: resetGame))
            present(alertController, animated: true)
        }
        else {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(alertController, animated: true)
        }
    }
}
