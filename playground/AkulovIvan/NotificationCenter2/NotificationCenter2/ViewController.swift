//
//  ViewController.swift
//  NotificationCenter2
//
//  Created by Alex Voronov on 16.11.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(makeImageRed), name: NSNotification.Name(rawValue: "Red"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(makeImageBlue), name: NSNotification.Name(rawValue: "Blue"), object: nil)
    }
    
    func makeImageRed() {
        myImageView.backgroundColor = UIColor.red
    }
    
    func makeImageBlue() {
        myImageView.backgroundColor = UIColor.blue
    }

}

