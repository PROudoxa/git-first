//
//  ViewController.swift
//  SegmentControlTutorial
//
//  Created by Алексей on 25.05.16.
//  Copyright © 2016 Alex&V. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var textLabel: UILabel!
    
    @IBAction func indexChanged(sender: UISegmentedControl) {
        switch segmentControl.selectedSegmentIndex {
        case 0:     textLabel.text = "America has selected"
        case 1:     textLabel.text = "Europe has selected"
        case 2:     textLabel.text = "All countries have selected"
        default:    break
        }
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
