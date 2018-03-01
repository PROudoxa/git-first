//
//  ViewController.swift
//  PassData2
//
//  Created by Alex Voronov on 23.02.18.
//  Copyright © 2018 Alex Voronov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func sendData(_ sender: UIButton) {
        performSegue(withIdentifier: "detailSegue", sender: nil)
    }
    
    @IBAction func unwindToLoginScreen(segue: UIStoryboardSegue) {
        if segue.identifier == "goLoginScreen" {
            guard let sourceVC = segue.source as? SecondViewController else { return }
            self.loginTF.text = sourceVC.login + " wow!"
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            guard let login = loginTF.text else { return }
            guard let destination = segue.destination as? SecondViewController else { return }
        
            destination.login = login
        }
    }
}

