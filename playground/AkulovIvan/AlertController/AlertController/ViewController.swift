//
//  ViewController.swift
//  AlertController
//
//  Created by Alex Voronov on 30.12.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlertPressed(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "Entrance", message: "Type data to enter", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "ok", style: .default, handler: nil)
        let cancel = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        
        alertController.addTextField { (loginTextField) in
            loginTextField.placeholder = "login"
        }
        alertController.addTextField { (passwordTextField) in
            passwordTextField.placeholder = "password"
            passwordTextField.isSecureTextEntry = true
        }
        
        alertController.addAction(ok)
        alertController.addAction(cancel)
        
        self.present(alertController, animated: true, completion: nil)
    }

}

