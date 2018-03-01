//
//  ThirdViewController.swift
//  PassDataViaNotifications
//
//  Created by Alex Voronov on 26.11.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    let dictionary = ["text": "Got notification!"]

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "NotificationFromThirdViewController"), object: nil, userInfo: dictionary)
    }


}
