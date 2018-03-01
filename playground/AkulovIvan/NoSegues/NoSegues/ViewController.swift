//
//  ViewController.swift
//  NoSegues
//
//  Created by Alex Voronov on 02.12.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func buttonTapped(_ sender: UIButton) {
        if sender.titleLabel?.text == "Green" {
            let vc = storyboard?.instantiateViewController(withIdentifier: "GreenVC") as! GreenViewController
            vc.property = "got it!"
            self.navigationController?.pushViewController(vc, animated: true)
            
        } else if sender.titleLabel?.text == "Blue" {
            let vc = storyboard?.instantiateViewController(withIdentifier: "BlueVC")
            self.present(vc!, animated: true, completion: nil)
        }
    }

}

