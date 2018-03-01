//
//  ViewController.swift
//  NSUserDefaults
//
//  Created by Alex Voronov on 26.11.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var currentScoreLabel: UILabel!
    @IBOutlet weak var highscoreLabel: UILabel!
    
    var currentScore: Int = 0
    var highscore: Int = 0
    //var theLastHighscore: Int? = UserDefaults.value(forKey: "TheLastHighscore") as? Int

    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentScoreLabel.text = "Current Score: \(currentScore)"
        highscoreLabel.text = "Highscore: \(highscore)"
        
        if let theLastHighscore = UserDefaults.standard.value(forKey: "TheLastHighscore") as? Int {
            highscoreLabel.text = "Saved score: \(String(describing: theLastHighscore))"
            highscore = theLastHighscore
        }
    }
    
    @IBAction func plussOneTapped(_ sender: UIButton) {
        currentScore += 1
        currentScoreLabel.text = "Current Score: \(currentScore)"
        
        if currentScore > highscore {
            highscore = currentScore
            highscoreLabel.text = "Highscore: \(highscore)"
            UserDefaults.standard.set(highscore, forKey: "TheLastHighscore")
        }
    }
    
    @IBAction func resetTapped(_ sender: UIButton) {
        currentScore = 0
        currentScoreLabel.text = "Current Score: \(currentScore)"
    }

}

