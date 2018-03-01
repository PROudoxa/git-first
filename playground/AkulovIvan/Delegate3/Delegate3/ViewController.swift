//
//  ViewController.swift
//  Delegate3
//
//  Created by Alex Voronov on 15.11.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SecondViewControllerDelegate {

    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func filltheLabelWith(info: String) {
        myLabel.text = info
    }

    @IBAction func goToSecondVCPressed(_ sender: UIButton) {
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "getDataSegue" {
            let destination = segue.destination as! SecondViewController
            destination.delegate = self
        }
    }
}

