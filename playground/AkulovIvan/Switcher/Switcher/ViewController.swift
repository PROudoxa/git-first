//
//  ViewController.swift
//  Switcher
//
//  Created by Alex Voronov on 29.12.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var switcher: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //switcher.setOn(false, animated: true)
        
        if switcher.isOn {
            myLabel.text = "Switch is ON"
        } else {
            myLabel.text = "Switch is OFF"
        }
        
        switcher.onTintColor = UIColor.orange
        switcher.thumbTintColor = UIColor.red
        switcher.tintColor = UIColor.green
        switcher.backgroundColor = UIColor.blue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func switchPressed(_ sender: UISwitch) {
        myLabel.text = switcher.isOn ? "ON" : "OFF"
    }

}

