//
//  SecondViewController.swift
//  Delegate4
//
//  Created by Alex Voronov on 16.11.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

protocol SecondViewControllerDelegate: class {
    func fillTheLabelWith(info: String)
}

class SecondViewController: UIViewController {

    @IBOutlet weak var myTextField: UITextField!
    
    var delegate: SecondViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if aaa != nil {
            myTextField.placeholder = aaa
        }
    }
    
    var aaa: String?

    @IBAction func goToFirstVCPressed(_ sender: UIButton) {
        let info = myTextField.text
        delegate?.fillTheLabelWith(info: info!)
        navigationController?.popViewController(animated: true)
    }


}
