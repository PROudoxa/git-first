//
//  SecondViewController.swift
//  ClosureApp2
//
//  Created by Alex Voronov on 03.02.18.
//  Copyright © 2018 Alex Voronov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!

    var completion: ((String) -> ())?
    
    @IBAction func sendTextToFirstVCTapped(_ sender: UIButton) {
        getDataAndGoBack()
    }

    private func getDataAndGoBack() {
        guard let text = textField.text, text != "" else {
            completion?("no data")
            navigationController?.popViewController(animated: true)
            return
        }
        
        completion?(text)
        navigationController?.popViewController(animated: true)
    }
}
