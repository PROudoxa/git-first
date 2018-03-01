//
//  ViewController.swift
//  DynamicAppIcons
//
//  Created by Alex Voronov on 13.02.18.
//  Copyright © 2018 Alex Voronov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    func delay() {
    
    }
    
    


    @IBAction func changeIconTapped(_ sender: UIButton) {
        
        let floatVersion = (UIDevice.current.systemVersion as NSString).floatValue
        print("version: " + String(floatVersion))
        /*
        if #available(iOS 11, *) {
            // iOS 11 (or newer) Swift code
            print("11+")
        } else {
            // iOS 10 or older code
            print(".. < 11")
        }  */

        
        // available in iOS 10.3+
        //guard UIApplication.shared.supportsAlternateIcons else { return }
        guard let title = sender.currentTitle else { return }
        
        if title == "Weasel_1" {
            
        } else if title == "Wesel_2" {
            
        }
        
    }
}

