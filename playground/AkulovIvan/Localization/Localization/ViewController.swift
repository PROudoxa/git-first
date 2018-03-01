//
//  ViewController.swift
//  Localization
//
//  Created by Alex Voronov on 21.02.18.
//  Copyright © 2018 Alex Voronov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = NSLocalizedString("sort of label", comment: "bottom label")
    }


}

