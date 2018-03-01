//
//  ViewController.swift
//  DelegateOneMore
//
//  Created by Alex Voronov on 20.11.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class ReceivingVC: UIViewController, SendingVCDelegate {

    @IBOutlet weak var myLabel: UILabel!

    
//    @IBAction func AddSomeTextPressed(_ sender: UIBarButtonItem) {
//        
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func fillTheLabelWithSendingText(text: String) {
        myLabel.text = text
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addSomeText" {
            let destinationVC = segue.destination as! SendingVC
            destinationVC.delegate = self
        }
    }


}

