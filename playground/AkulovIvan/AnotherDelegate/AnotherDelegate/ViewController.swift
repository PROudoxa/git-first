//
//  ViewController.swift
//  AnotherDelegate
//
//  Created by Alex Voronov on 19.11.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

extension ViewController: SecondViewControllerDelegate {
    func hideScreen(viewController: UIViewController) {
        viewController.willMove(toParentViewController: nil)
        viewController.view.removeFromSuperview()
    }
}

class ViewController: UIViewController {

    var secondVC: SecondViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondVC = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as!SecondViewController!
    }


    
    @IBAction func goForwardButtonPressed(_ sender: UIButton) {
        
        addChildViewController(secondVC)
        view.addSubview(secondVC.view)
        secondVC.willMove(toParentViewController: self)
        secondVC.delegate = self
    }

}

