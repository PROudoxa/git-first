//
//  ViewController.swift
//  Delegate
//
//  Created by Alex Voronov on 14.11.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SecondViewControllerDelegate {

    
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "getDataSegue" {
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.delegate = self
            
        }
    }
    
    func filltheLabelWith(info: String) {
        myLabel.text = info
    }
    
    @IBAction func goToSecondVCPressed(_ sender: UIButton) {
    }

}

