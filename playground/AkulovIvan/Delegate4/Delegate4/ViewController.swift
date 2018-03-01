//
//  ViewController.swift
//  Delegate4
//
//  Created by Alex Voronov on 16.11.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SecondViewControllerDelegate {

    @IBOutlet weak var myLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func goToSecondVCPressed(_ sender: UIButton) {
    }
    
    func fillTheLabelWith(info: String) {
        myLabel.text = info
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "getDataSegue" {
            let destination = segue.destination as! SecondViewController
            destination.delegate = self
            if ((myLabel.text != "") && (myLabel.text != "Label")) {
                destination.aaa = myLabel.text
            }
        }
    }

}

