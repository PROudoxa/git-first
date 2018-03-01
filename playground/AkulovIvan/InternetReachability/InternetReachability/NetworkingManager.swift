//
//  NetworkingManager.swift
//  InternetReachability
//
//  Created by Alex Voronov on 09.02.18.
//  Copyright © 2018 Alex Voronov. All rights reserved.
//

import Foundation
import AFNetworking


class NetworkingManager {
    
    let NetworkReachabilityChanged = NSNotification.Name("NetworkReachabilityChanged")
    var previousNetworkReachabilityStatus: AFNetworkReachabilityStatus = .unknown
    
    func observeNetworkReachability() {
        
        //AFNetworkReachabilityManager.shared().startMonitoring()
        AFNetworkReachabilityManager.shared().setReachabilityStatusChange { (status) in
            let reachabilityStatus = AFStringFromNetworkReachabilityStatus(status)
            var reachableOrNot = ""
            var networkSummary = ""
            var reachableStatusBool = false
            
            switch (status) {
            case .reachableViaWWAN, .reachableViaWiFi:
                // Reachable.
                reachableOrNot = "Reachable"
                networkSummary = "Connected to Network"
                reachableStatusBool = true
            case .notReachable, .unknown:
                // Not reachable.
                reachableOrNot = "Not Reachable"
                networkSummary = "Disconnected from Network"
                reachableStatusBool = false
            }
            
            // Any class which has observer for this notification will be able to report loss of network connection
            // successfully.
            
            if (self.previousNetworkReachabilityStatus != .unknown && status != self.previousNetworkReachabilityStatus) {
                NotificationCenter.default.post(name: self.NetworkReachabilityChanged, object: nil, userInfo: [
                    "reachabilityStatus" : "Connection Status : \(reachabilityStatus)",
                    "reachableOrNot" : "Network Connection \(reachableOrNot)",
                    "summary" : networkSummary,
                    "reachableStatus" : reachableStatusBool
                    ])
            }
            self.previousNetworkReachabilityStatus = status
        }
    }
}
