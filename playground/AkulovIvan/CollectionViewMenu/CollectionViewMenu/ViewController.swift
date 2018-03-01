//
//  ViewController.swift
//  CollectionViewMenu
//
//  Created by Alex Voronov on 01.12.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let bottomMenu = BottomMenu()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    }

    @IBAction func TapButtonTapped(_ sender: UIButton) {
        bottomMenu.toggleMenu()
    }

}

