//
//  SecondViewController.swift
//  Callbacks
//
//  Created by Alex Voronov on 01.01.18.
//  Copyright © 2018 Alex Voronov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {


    @IBOutlet weak var textField: UITextField!
    
    var completion: ((String) -> ())?
    
    @IBAction func backPressed(sender: UIButton) {
        getDataAndBack()
    }

    private func getDataAndBack() {
        guard let text = textField.text, text != "" else {
            completion?("no data")
            navigationController?.popViewController(animated: true)
            return
        }
        
        completion?(text)
        navigationController?.popViewController(animated: true)
    }
}
