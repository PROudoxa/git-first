//
//  ViewController.swift
//  Callback2
//
//  Created by Alex Voronov on 01.01.18.
//  Copyright © 2018 Alex Voronov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var label: UILabel!

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if case let secondVC = segue.destination as! SecondViewController, segue.identifier == "segue" {
            secondVC.completion = { [unowned self] text in
                self.label.text = text
            }
        }
    }
}

