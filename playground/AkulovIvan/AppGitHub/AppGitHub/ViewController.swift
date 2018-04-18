//
//  ViewController.swift
//  AppGitHub
//
//  Created by Alex Voronov on 08.04.18.
//  Copyright © 2018 Alex Voronov. All rights reserved.
//

import UIKit
import GithubPilot

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let client = Github.authorizedClient {
            client.users.getAuthenticatedUser().response({ user, requestError in
                if let me = user {
                    print(me.description)
                } else {
                    print(String(describing: requestError?.description))
                }
            })
        }

        if let client = Github.authorizedClient {
            client.users.getUser(username: "acmacalister").response({ (githubUser, error) -> Void in
                if let user = githubUser {
                    print("user description:")
                    print(user.description)
                } else {
                    print(error?.description ?? "default")
                }
            })
        }
        
        print("viewdidload")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

