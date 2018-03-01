//
//  SecondViewController.swift
//  AnotherDelegate
//
//  Created by Alex Voronov on 19.11.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

protocol SecondViewControllerDelegate {
    func hideScreen(viewController: UIViewController)
}

class SecondViewController: UIViewController {
    
    var delegate: SecondViewControllerDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func goBackButtonPressed(_ sender: UIButton) {
        delegate.hideScreen(viewController: self)
    }
    

}
