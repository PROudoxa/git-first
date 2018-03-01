//
//  Comment.swift
//  MVC-N
//
//  Created by Alex Voronov on 19.12.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import Foundation

struct Comment {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
    
    // failable initializer
    init?(dictionary: [String: AnyObject]) {
        guard let postId = dictionary["postId"] as? Int,
        let id = dictionary["id"] as? Int,
        let name = dictionary["name"] as? String,
        let email = dictionary["email"] as? String,
        let body = dictionary["body"] as? String else { return nil }
    
        self.postId = postId
        self.id = id
        self.name = name
        self.email = email
        self.body = body
    }
}
