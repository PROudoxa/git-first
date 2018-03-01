//
//  ViewController.swift
//  ConteinerView
//
//  Created by Alex Voronov on 24.01.18.
//  Copyright © 2018 Alex Voronov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var containerView = ContainerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func second(sender: AnyObject) {
        containerView.segueIdentifierReceivedFromParent(button: "buttonTwo")
    }
    
    @IBAction func first(sender: AnyObject) {
        containerView.segueIdentifierReceivedFromParent(button: "buttonOne")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "container"{
            containerView = (segue.destination as? ContainerViewController)!
            
        }
    }
}

