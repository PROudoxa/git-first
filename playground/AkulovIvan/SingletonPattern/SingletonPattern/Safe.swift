//
//  Safe.swift
//  SingletonPattern
//
//  Created by Alex Voronov on 19.12.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//


class Safe {
    
    var money = 0
    static let shared = Safe()

    private init() {}

}


