//
//  SecondViewController.swift
//  PassData2
//
//  Created by Alex Voronov on 23.02.18.
//  Copyright © 2018 Alex Voronov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    var login = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = login
    }
    
    @IBAction func sendAndGoBack(_ button: UIButton) {
        //self.dismiss(animated: true)
        performSegue(withIdentifier: "goLoginScreen", sender: nil)
    }
}
