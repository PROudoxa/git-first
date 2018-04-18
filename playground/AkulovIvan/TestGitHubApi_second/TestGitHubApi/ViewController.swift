//
//  ViewController.swift
//  TestGitHubApi
//
//  Created by Alex Voronov on 07.04.18.
//  Copyright © 2018 Alex Voronov. All rights reserved.
//

import UIKit
import Octokit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
//        let config = TokenConfiguration("e63522ed8e3cca871d9a6badc2cc100dbea4cdd3")
//
//        Octokit(config).me() { response in
//            switch response {
//            case .success(let user):
//                print("succes:")
//                print(user.login as Any)
//            case .failure(let error):
//                print("failure:")
//                print(error)
//            }
//        }
        
        let config = OAuthConfiguration(token: "cad13d23cf58366f96e6", secret: "ac02fcabcca1bce953f55e9e456c7905e4194188", scopes: ["repo", "read:org"])
        let url = config.authenticate()
        
        print(String(describing: url))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

