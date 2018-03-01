//
//  ColorViewController.swift
//  NotificationCenter2
//
//  Created by Alex Voronov on 16.11.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func redColorPressed(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Red"), object: nil)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func blueColorPressed(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Blue"), object: nil)
        navigationController?.popViewController(animated: true)
    }

}
