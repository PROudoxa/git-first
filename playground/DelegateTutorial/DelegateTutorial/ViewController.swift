//
//  ViewController.swift
//  DelegateTutorial
//
//  Created by Alex Voronov on 26.08.17.
//  Copyright © 2017 Alex&V. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DataEnteredDelegate {

    @IBOutlet var dataLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func userDidEtnterInformation(info: NSString) {
        dataLabel.text = info as String
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSecondVC" {
            let secondVC: SecondViewController = segue.destination as! SecondViewController
            secondVC.delegate = self
        }
    }



}

