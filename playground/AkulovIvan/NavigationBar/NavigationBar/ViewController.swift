//
//  ViewController.swift
//  NavigationBar
//
//  Created by Alex Voronov on 07.12.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var labelText = "labelText"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "DetailScreen"
        label.text = labelText.uppercased()
    }
    
    @IBAction func goBackTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func backTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

