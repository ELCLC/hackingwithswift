//
//  ViewController.swift
//  Project6a
//
//  Created by Emma Lee-Choon on 13/04/2019.
//  Copyright © 2019 Emma. All rights reserved.
//

import UIKit

protocol FlagViewProtocol: class {
    func set(buttonBorderWidth: CGFloat)
    func set(buttonBorderColor: ButtonColor)
    func display(score: Int)
    func set(button1Image: String)
    func set(button2Image: String)
    func set(button3Image: String)
    func set(title: String)
    func displayFinalAlert(title: String, message: String, actionTitle: String)
    func displayAlert(title: String, message: String, actionTitle: String)
}

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var scoreButton: UIBarButtonItem!
    
    var presenter: FlagPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewReady()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        presenter.didTapButton(tag: sender.tag)
    }
    
    func resetGame(action: UIAlertAction!) {
        presenter.resetGame()
    }
    
    func askQuestion(action: UIAlertAction!) {
        presenter.askQuestion()
    }
}

extension ViewController: FlagViewProtocol {
    func set(buttonBorderWidth: CGFloat) {
        button1.layer.borderWidth = buttonBorderWidth
        button2.layer.borderWidth = buttonBorderWidth
        button3.layer.borderWidth = buttonBorderWidth
    }
    
    func set(buttonBorderColor: ButtonColor) {
        if buttonBorderColor.rawValue == 0 {
            let borderColor = UIColor.lightGray.cgColor
            button1.layer.borderColor = borderColor
            button2.layer.borderColor = borderColor
            button3.layer.borderColor = borderColor
        }
    }

    func display(score: Int) {
        scoreButton.title = "Score: \(score)"
    }

    func set(button1Image: String) {
        button1.setImage(UIImage(named: button1Image), for: .normal)
    }
    
    func set(button2Image: String) {
        button2.setImage(UIImage(named: button2Image), for: .normal)
    }
    
    func set(button3Image: String) {
        button3.setImage(UIImage(named: button3Image), for: .normal)
    }
    
    func set(title: String) {
        self.title = title
    }
    
    func displayFinalAlert(title: String, message: String, actionTitle: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: actionTitle, style: .default, handler: resetGame))
        present(alertController, animated: true)
    }
    
    func displayAlert(title: String, message: String, actionTitle: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: actionTitle, style: .default, handler: askQuestion))
        present(alertController, animated: true)

    }
}
