//
//  SecondViewController.swift
//  Callback2
//
//  Created by Alex Voronov on 01.01.18.
//  Copyright © 2018 Alex Voronov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

 
    @IBOutlet weak var textField: UITextField!
    
    var completion: ((String) -> ())?
    
    @IBAction func sendDataPressed(sender: UIButton) {
        sendTextToFirstVC()
    }
    
    private func sendTextToFirstVC() {
//        guard let text = textField.text, text != "" else {
//            completion?("no data")
//            navigationController?.popViewController(animated: true)
//            return
//        }
//        completion?(text)
        
        textField.text! == "" ? completion?("no data") : completion?(textField.text!)
        navigationController?.popViewController(animated: true)
    }
}
