//
//  ViewController.swift
//  github
//
//  Created by Alex Voronov on 08.04.18.
//  Copyright © 2018 Alex Voronov. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url: URLConvertible = "http://api.github.com"
        let parameters = ["proudoxa": "aaa111aaa111"]
        
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: .url, headers: nil)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

