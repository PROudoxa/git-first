//
//  ViewController.swift
//  TestApp
//
//  Created by Alex Voronov on 10.02.18.
//  Copyright © 2018 Alex Voronov. All rights reserved.
//

import UIKit
import UtilsFramework

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("start")
        Utils.delay(delay: 5) {
            print("hello!")
        }
    }

}

