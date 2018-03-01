//
//  ViewController.swift
//  SingletonPattern
//
//  Created by Alex Voronov on 19.12.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let safe = Safe.shared
        print("safe money: \(safe.money)")
//        let safe2 = Safe.shared
//        safe2.money = 2000
//        print(safe2.money)
//        print(safe.money)
    }


}

