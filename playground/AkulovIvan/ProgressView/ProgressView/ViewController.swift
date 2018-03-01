//
//  ViewController.swift
//  ProgressView
//
//  Created by Alex Voronov on 01.12.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var loadingLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    var timer: Timer? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStartPoint()
        setTimer(timer: timer)
    }
    
    func updateProgressView() {
        if progressView.progress < 1 {
            self.progressView.progress += 2 / 10
        } else {
            self.loginButton.isHidden = false
            UIView.animate(withDuration: 0.4, animations: { () -> Void in
                self.loginButton.alpha = 1
            })
            self.loadingLabel.text = "Loaded!"
            resetButton.isEnabled = true
            resetButton.backgroundColor = UIColor.green
            timer?.invalidate()
        }
    }
    
    func setStartPoint() {
        self.progressView.setProgress(0, animated: true)
        self.progressView.progressViewStyle = UIProgressViewStyle.bar
        self.loadingLabel.text = "Loading..."
        self.loginButton.isHidden = true
        self.loginButton.alpha = 0
        self.resetButton.isEnabled = false
        self.resetButton.backgroundColor = UIColor.red
    }
    
    func setTimer(timer: Timer?) {
        if (timer == nil || !(timer?.isValid)!) {
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateProgressView), userInfo: nil, repeats: true)
        }
    }

    @IBAction func resetProgressTapped(_ sender: UIButton) {
        setStartPoint()
        setTimer(timer: timer)
    }

}

