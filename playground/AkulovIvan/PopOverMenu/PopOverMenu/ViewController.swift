//
//  ViewController.swift
//  PopOverMenu
//
//  Created by Alex Voronov on 23.01.18.
//  Copyright © 2018 Alex Voronov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGestures()
    }

    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
        tapGesture.numberOfTapsRequired = 1
        button.addGestureRecognizer(tapGesture)
    }

    @objc
    private func tapped() {
        guard let popVC = storyboard?.instantiateViewController(withIdentifier: "popVC") else { return }
        
        popVC.modalPresentationStyle = .popover
        
        let popOverVC = popVC.popoverPresentationController
        popOverVC?.delegate = self
        popOverVC?.sourceView = self.button
        popOverVC?.sourceRect = CGRect(x: self.button.bounds.midX, y: self.button.bounds.minY, width: 0, height: 0)
        popVC.preferredContentSize = CGSize(width: 250, height: 250)
        
        self.present(popVC, animated: true, completion: nil)
    }
}


extension ViewController: UIPopoverPresentationControllerDelegate {
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}
