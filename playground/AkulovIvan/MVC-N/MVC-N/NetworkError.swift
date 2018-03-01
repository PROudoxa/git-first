//
//  NetworkError.swift
//  MVC-N
//
//  Created by Alex Voronov on 20.12.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import Foundation


enum NetworkError: Error {
    case failInternetError
    case noInternetConnection
}
