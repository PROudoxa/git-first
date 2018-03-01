//
//  SecondViewController.swift
//  Delegate3
//
//  Created by Alex Voronov on 15.11.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

protocol SecondViewControllerDelegate: class {
    func filltheLabelWith(info: String)
}

class SecondViewController: UIViewController {

    @IBOutlet weak var myTextField: UITextField!
    
    weak var delegate: SecondViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func sendDataToFirstVCPressed(_ sender: UIButton) {
        let info = myTextField.text
        delegate?.filltheLabelWith(info: info!)
        navigationController?.popViewController(animated: true)
    }


}
