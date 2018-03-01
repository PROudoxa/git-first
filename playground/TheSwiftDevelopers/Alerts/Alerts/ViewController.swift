//
//  ViewController.swift
//  Alerts
//
//  Created by Alex Voronov on 13.11.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var hiLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func ShowMeAlertTapped(_ sender: Any) {
        self.hiLabel.text = "Hi, ..."
        self.alert(title: "Внимание!", message: "Введие Ваше имя", style: .alert)
    }
    

    // 2-й вариант

    func alert(title: String, message: String, style: UIAlertControllerStyle){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "ok", style: .default) {(action1) in
            let text = alertController.textFields?.first
            if text?.text != "" {
                self.hiLabel.text = "Hi, " + (text?.text!)! + ("!")
            } else {
                self.hiLabel.text = "Hi!"
            }
        }
        
        alertController.addTextField{(textfield) in
        
        }
        
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    

}

