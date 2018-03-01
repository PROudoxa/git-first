//
//  ViewController.swift
//  GETandPOST
//
//  Created by Alex Voronov on 27.11.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func getTapped(_ sender: UIButton) {
        guard let url = URL(string: "http://jsonplaceholder.typicode.com/posts") else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let response = response {
                print(response)
            }
            
            guard let data = data else { return }
            print(data)
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    @IBAction func postTapped(_ sender: UIButton) {
        guard let url = URL(string: "http://jsonplaceholder.typicode.com/posts") else { return }
        let parameters = ["username" : "Ivan", "message" : "Hello, Steve!"]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request)  { (data, response, error) in
            if let response = response {
                print(response)
            }
            
            guard let data = data else { return }
            
            do {
                let json = try JSONSerialization.data(withJSONObject: data, options: [])
                print(json)
            } catch {
                print(error)
            }
        }.resume()
        
    }
}







