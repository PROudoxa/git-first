//
//  ViewController.swift
//  firstApp
//
//  Created by Алексей on 13.05.16.
//  Copyright © 2016 Алексей. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var totalTextField: UITextField?
    @IBOutlet var taxPctSlider: UISlider?
    @IBOutlet var taxPctLabel: UILabel?
    @IBOutlet var resultsTextView: UITextView?
    
    @IBAction func calculateTapped(sender : AnyObject) {
    }
    @IBAction func taxPercentageChanged(sender : AnyObject) {
    }
    @IBAction func viewTapped(sender : AnyObject) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

