//
//  NetworkService.swift
//  MVC-N
//
//  Created by Alex Voronov on 19.12.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import Foundation

class NetworkService {

    private init() {}
    
    static let shared = NetworkService()
    
    public func getData(url: URL, completion: @escaping (Any) -> ()) {
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                //print(json)
                DispatchQueue.main.async {
                    completion(json)
                }
            } catch {
                print("error: \(error)")
            }
        }.resume()
    }
}
