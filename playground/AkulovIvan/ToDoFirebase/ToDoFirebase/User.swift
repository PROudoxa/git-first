//
//  User.swift
//  ToDoFirebase
//
//  Created by Alex Voronov on 02.02.18.
//  Copyright © 2018 Alex Voronov. All rights reserved.
//

import Foundation
import Firebase

struct UserAAA {
    
    let uid: String
    let email: String
    //var tasks: [Task] = []
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email!
    }
}


