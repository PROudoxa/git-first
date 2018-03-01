//
//  ViewController.swift
//  NotificationCenter
//
//  Created by Alex Voronov on 14.11.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NotificationCenter.default.addObserver(self, selector: #selector(setImageToRed), name: NSNotification.Name(rawValue: "red"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(setImageToBlue), name: NSNotification.Name(rawValue: "blue"), object: nil)

    }

    func setImageToRed() {
        imageView.backgroundColor = UIColor.red
    }
    
    func setImageToBlue() {
        imageView.backgroundColor = UIColor.blue
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

