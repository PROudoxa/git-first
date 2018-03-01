//
//  ViewController.swift
//  SpellChecker2
//
//  Created by Alex Voronov on 06.12.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func checkItTapped(_ sender: Any) {
        guard let word = textField.text else { return }
        guard word.characters.count > 1  else { print("too short string") ; return }
        
        let arrayOfWords = word.components(separatedBy: " ")
        var k = 0
        for word in arrayOfWords {
            if word.characters.count < 2 {
                k += 1
            }
        }
        if k == arrayOfWords.count {
            print("There are words in you string!")
        }
        
        if checkWordIfCorrect(word: word) {
            label.text = "Correct!"
            label.backgroundColor = UIColor.green
        } else {
            label.text = "Try again"
            label.backgroundColor = UIColor.gray
        }
    }
    
    func checkWordIfCorrect(word: String) -> Bool {
        
        let textChecker = UITextChecker()
        let checkRange = NSMakeRange(0, word.characters.count)
        let stringRange = textChecker.rangeOfMisspelledWord(in: word, range: checkRange, startingAt: 0, wrap: false, language: "en")
        
        return stringRange.location == NSNotFound
    }
}

