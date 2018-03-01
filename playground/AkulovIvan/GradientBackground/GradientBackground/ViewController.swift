//
//  ViewController.swift
//  GradientBackground
//
//  Created by Alex Voronov on 06.12.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let color1 = UIColor(red: 153 / 255, green: 26 / 255, blue: 61 / 255, alpha: 1.0).cgColor
        let color2 = UIColor(red: 243 / 255, green: 155 / 255, blue: 51 / 255, alpha: 1.0).cgColor
        let color3 = UIColor(red: 183 / 255, green: 34 / 255, blue: 59 / 255, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [color1, color2, color3]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }

//    override var shouldAutorotate: Bool {
//        return true
//    }
}

