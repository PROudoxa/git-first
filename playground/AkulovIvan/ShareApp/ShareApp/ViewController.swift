//
//  ViewController.swift
//  ShareApp
//
//  Created by Alex Voronov on 04.01.18.
//  Copyright © 2018 Alex Voronov. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func facebookShareButtonPressed(_ sender: UIButton) {
        let facebookShare = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        facebookShare?.setInitialText("Hi, kitty!")
        facebookShare?.add(UIImage(named: "4"))
        self.present(facebookShare!, animated: true, completion: nil)
    }

    @IBAction func twitterShareButtonPressed(_ sender: UIButton) {
        let twitterShare = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        twitterShare?.setInitialText("Hi, kitty!")
        twitterShare?.add(UIImage(named: "4"))
        self.present(twitterShare!, animated: true, completion: nil)
    }
}

