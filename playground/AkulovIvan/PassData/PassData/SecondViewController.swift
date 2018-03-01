//
//  SecondViewController.swift
//  PassData
//
//  Created by Alex Voronov on 26.11.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    var textOfLabel: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel.text = textOfLabel
    }

    @IBAction func goBackTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    
}
