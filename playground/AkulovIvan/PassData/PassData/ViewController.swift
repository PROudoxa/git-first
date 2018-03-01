//
//  ViewController.swift
//  PassData
//
//  Created by Alex Voronov on 26.11.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC: SecondViewController = segue.destination as! SecondViewController
        destinationVC.textOfLabel = myTextField.text!
    }

}

