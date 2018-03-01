//
//  RateManager.swift
//  RateApp
//
//  Created by Alex Voronov on 02.12.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit
import StoreKit

@available(iOS 10.3, *)
class RateManager {
    
    class func incrementCount() {
        let count = UserDefaults.standard.integer(forKey: "run_count")
        print(count)
        if count < 2 {
            UserDefaults.standard.set(count + 1, forKey: "run_count")
            UserDefaults.standard.synchronize()
        }
    }
    
    class func showRatesController() {
        let count = UserDefaults.standard.integer(forKey: "run_count")
        if count == 2 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                // does not work in Xcode < 8.3.3
                //SKStoreReviewController.requestReview()
            })
        }
    }
    
}
