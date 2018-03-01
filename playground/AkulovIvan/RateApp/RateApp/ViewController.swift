//
//  ViewController.swift
//  RateApp
//
//  Created by Alex Voronov on 02.12.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

@available(iOS 10.3, *)
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        RateManager.showRatesController()
    }

}

