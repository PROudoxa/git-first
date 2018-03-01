//
//  ViewController.swift
//  NSUrlSession
//
//  Created by Alex Voronov on 04.12.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        displayURL()
    }
    
    func displayURL() {
        let myURLAdress = "http://swiftbook.ru"
        let myURL = NSURL(string: myURLAdress)
        
        let URLTask = URLSession.shared.dataTask(with: myURL as! URL) { myData, response, error in
            guard error == nil else { return }
            let myHTMLString: String = String(data: myData!, encoding: String.Encoding.utf8)!
            
            self.myWebView.loadHTMLString(myHTMLString, baseURL: nil)
            print(myHTMLString)
        }
        URLTask.resume()
    }
}

