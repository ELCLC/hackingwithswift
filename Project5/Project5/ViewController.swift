//
//  ViewController.swift
//  Project5
//
//  Created by Emma Lee-Choon on 22/04/2019.
//  Copyright © 2019 Emma. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var allWords = [String]()
    var usedWords = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(startGame))
        
        if let path = Bundle.main.path(forResource: "start", ofType: "txt"),
            let contents = try? String(contentsOfFile: path) {
            allWords = contents.components(separatedBy: "\n")
        }
        startGame()
    }

    @objc func startGame() {
        title = allWords.randomElement()
        usedWords.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
    @objc func promptForAnswer() {
        let ac = UIAlertController(title: "Enter answer", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [weak self, weak ac] (action) in
            guard let answer = ac?.textFields?[0].text else { return }
            self?.submit(answer)
        }
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    func submit(_ answer: String) {
        let answerLowerCased = answer.lowercased()
        
        if isValid(word: answerLowerCased) {
            if isPossible(word: answerLowerCased) {
                if isOriginal(word: answerLowerCased) {
                    if isReal(word: answerLowerCased) {
                        usedWords.insert(answerLowerCased, at: 0)
                        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
                    }
                    else {
                        showErrorMessage(title: "Invalid word", message: "You must guess a real word")
                    }
                }
                else {
                    showErrorMessage(title: "Invalid word", message: "You've already guessed that word")
                }
            }
            else {
                showErrorMessage(title: "Invalid word", message: "Your guess must contain letters from the start word")
            }
        }
        else {
            showErrorMessage(title: "Invalid word", message: "Your guess must be at least 3 letters, and not the same as the start word")
        }
    }

    func showErrorMessage(title: String, message: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    func isValid(word: String) -> Bool {
        guard let titleWord = title?.lowercased() else {
            return false
        }
        return word.count >= 3 && word != titleWord
    }
    
    func isPossible(word: String) -> Bool {
        guard var titleWord = title?.lowercased() else {
            return false
        }
        
        for letter in word {
            if let position = titleWord.firstIndex(of: letter) {
                titleWord.remove(at: position)
            }
            else {
                return false
            }
        }
        
        return true
    }
    
    func isOriginal(word: String) -> Bool {
        return !usedWords.contains(word)
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedWords.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        cell.textLabel?.text = usedWords[indexPath.row]
        return cell
    }
}

