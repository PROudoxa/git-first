//
//  BlueViewController.swift
//  NoSegues
//
//  Created by Alex Voronov on 02.12.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(dismissVC), userInfo: nil, repeats: false)
    }

    func dismissVC() {
        self.dismiss(animated: true, completion: nil)
    }

}
