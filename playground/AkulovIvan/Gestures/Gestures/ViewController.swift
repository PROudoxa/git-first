//
//  ViewController.swift
//  Gestures
//
//  Created by Alex Voronov on 10.12.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func handlePan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        if let view = sender.view {
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        }
        
        sender.setTranslation(CGPoint.zero, in: self.view)
    }
    
    @IBAction func handlePinch(_ sender: UIPinchGestureRecognizer) {
        if let view = sender.view {
            view.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
            //sender.scale = 1
        }
    }
    
    @IBAction func handleRotation(_ sender: UIRotationGestureRecognizer) {
        if let view = sender.view {
            view.transform = CGAffineTransform(rotationAngle: sender.rotation)
        }
    }
}

