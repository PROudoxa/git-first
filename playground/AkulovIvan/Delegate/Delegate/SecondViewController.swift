//
//  SecondViewController.swift
//  Delegate
//
//  Created by Alex Voronov on 14.11.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

protocol SecondViewControllerDelegate {
    func filltheLabelWith(info: String)
}

class SecondViewController: UIViewController {

    var delegate: SecondViewControllerDelegate?
    
    @IBOutlet weak var myTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }



    @IBAction func sendDataToFirstVCPressed(_ sender: UIButton) {
        let info = myTextField.text
        delegate?.filltheLabelWith(info: info!)
        navigationController?.popViewController(animated: true)
    }


}
