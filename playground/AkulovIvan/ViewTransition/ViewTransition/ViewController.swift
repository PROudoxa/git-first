//
//  ViewController.swift
//  ViewTransition
//
//  Created by Alex Voronov on 27.11.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redCardView: UIImageView!
    @IBOutlet weak var blackCardView: UIImageView!
    
    var isFlipped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func flipOver(_ sender: UIButton) {
        
        isFlipped = !isFlipped
        let fromView = isFlipped ? redCardView : blackCardView
        let toView = isFlipped ? blackCardView : redCardView
        
        UIView.transition(from: fromView!, to: toView!, duration: 0.5, options: [.curveEaseOut, .transitionFlipFromTop, .showHideTransitionViews])
    }
}

