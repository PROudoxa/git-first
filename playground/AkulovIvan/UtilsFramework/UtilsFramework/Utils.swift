//
//  Utils.swift
//  UtilsFramework
//
//  Created by Alex Voronov on 10.02.18.
//  Copyright © 2018 Alex Voronov. All rights reserved.
//

import Foundation

public class Utils {
    
    private init() {}
    
    public static func delay(delay: Double, closure: @escaping ()->()) {
        DispatchQueue.main.asyncAfter(deadline: (.now() + delay)) {
            closure()
        }
    }
}
