//
//  SecondViewController.swift
//  ClosureApp
//
//  Created by Alex Voronov on 02.01.18.
//  Copyright © 2018 Alex Voronov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {


    @IBOutlet weak var textField: UITextField!
    
    var completion: ((String) -> ())?
    
    @IBAction func sendDataPressed(sender: UIButton) {
        sendDataToFirstVC()
    }
    
    private func sendDataToFirstVC() {
        textField.text == "" ? completion?("no data") : completion?(textField.text!)
        navigationController?.popViewController(animated: true)
    }

}
