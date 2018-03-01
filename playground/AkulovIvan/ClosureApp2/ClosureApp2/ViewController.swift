//
//  ViewController.swift
//  ClosureApp2
//
//  Created by Alex Voronov on 03.02.18.
//  Copyright © 2018 Alex Voronov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if case let controller as SecondViewController = segue.destination, segue.identifier == "segue" {
            controller.completion = { [unowned self] text in
                self.label.text = text
            }
        }
    }
}
