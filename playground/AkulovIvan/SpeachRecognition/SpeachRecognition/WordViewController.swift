//
//  WordViewController.swift
//  SpeachRecognition
//
//  Created by Alex Voronov on 08.12.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit
import Foundation

class WordViewController: UIViewController {

    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var transcriptionLabel: UILabel!
    
    var word = ("", "")
    //var player: AVAudioplayer?  //xcode 9.0 || project has not been finished yet.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wordLabel.text = word.0
        transcriptionLabel.text = word.1
    }
    
    @IBAction func recognizeButtonTapped(_ sender: UIButton) {
    
    }
    
    @IBAction func playButtonTapper(_ sender: UIButton) {
    
    }

    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }


}
