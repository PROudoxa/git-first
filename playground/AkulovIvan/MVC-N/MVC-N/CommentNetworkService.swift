//
//  CommentNetworkService.swift
//  MVC-N
//
//  Created by Alex Voronov on 19.12.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import Foundation


class CommentNetworkService {
    private init() {}
    
    static func getComments(completion: @escaping(GetCommentResponse) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1/comments") else { return }
        NetworkService.shared.getData(url: url) { (json) in
            do {
                let response = try GetCommentResponse(json: json)
                completion(response)
            } catch {
                print(error)
            }
        }
    }
}
