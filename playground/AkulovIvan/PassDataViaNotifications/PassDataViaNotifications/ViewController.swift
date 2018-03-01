//
//  ViewController.swift
//  PassDataViaNotifications
//
//  Created by Alex Voronov on 26.11.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(gotNotification), name: NSNotification.Name(rawValue: "NotificationFromThirdViewController"), object: nil)
    
    }


    func gotNotification(notification: Notification) {
//        guard let userInfo = notification.userInfo else { return }
//        guard let text = userInfo["text"] as? String else { return }
        guard let userInfo = notification.userInfo, let text = userInfo["text"] as? String  else { return }
        
        myLabel.text = text
    }

}

