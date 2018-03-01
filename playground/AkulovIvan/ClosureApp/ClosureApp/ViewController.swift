//
//  ViewController.swift
//  ClosureApp
//
//  Created by Alex Voronov on 02.01.18.
//  Copyright © 2018 Alex Voronov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var label: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if case let secondVC as SecondViewController = segue.destination, segue.identifier == "segue" {
            secondVC.completion = { [unowned self] text in
                self.label.text = text
            }
        }
    }
    
}

