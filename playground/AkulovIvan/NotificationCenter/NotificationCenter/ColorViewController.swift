//
//  ColorViewController.swift
//  NotificationCenter
//
//  Created by Alex Voronov on 14.11.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {

    @IBOutlet var redButon: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func redColorPressed(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "red"), object: nil)
        redButon.setTitle("go back", for: .normal)
        redButon.setTitleColor(UIColor.white, for: .normal)
        redButon.backgroundColor = UIColor.red
    }
    
    @IBAction func blueColorPressed(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "blue"), object: nil)
    }

}
