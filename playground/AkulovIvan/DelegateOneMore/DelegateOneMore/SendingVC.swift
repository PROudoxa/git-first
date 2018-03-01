//
//  SendingViewController.swift
//  DelegateOneMore
//
//  Created by Alex Voronov on 20.11.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

protocol SendingVCDelegate: class {
    func fillTheLabelWithSendingText(text: String)
}

class SendingVC: UIViewController {

    @IBOutlet weak var myTextView: UITextField!
    
    weak var delegate: SendingVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func SendButtonPressed(_ sender: UIButton) {
        if delegate != nil {
            let sendingText = myTextView.text
            delegate?.fillTheLabelWithSendingText(text: sendingText!)
            self.dismiss(animated: true, completion: nil)
        }
    }

}
