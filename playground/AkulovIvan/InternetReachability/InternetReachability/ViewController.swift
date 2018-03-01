//
//  ViewController.swift
//  InternetReachability
//
//  Created by Alex Voronov on 09.02.18.
//  Copyright © 2018 Alex Voronov. All rights reserved.
//

import UIKit
import AFNetworking
import Reachability

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    
    let networkingManager = NetworkingManager()
    let netMan = AFNetworkReachabilityManager.shared()
    var isReachable: Bool = true
    var isMonitoring: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkingManager.observeNetworkReachability()
        netMan.startMonitoring()
        
        button.backgroundColor = isReachable ? .green : .red
        
        //        NotificationCenter.default.addObserver(forName: networkingManager.NetworkReachabilityChanged, object: nil, queue: nil, using: {
        //            (notification) in
        //            if let userInfo = notification.userInfo {
        //                if let messageTitle = userInfo["summary"] as? String, let reachableOrNot = userInfo["reachableOrNot"] as? String, let reachableStatus = userInfo["reachabilityStatus"] as? String {
        //
        //                    self.isReachable = !self.isReachable
        //                    self.setButtonColor(isReachable: self.isReachable)
        //
        //                    let messageFullBody = "\(reachableOrNot)\n\(reachableStatus)"
        //                    let alertController = UIAlertController(title: messageTitle, message: messageFullBody, preferredStyle: .alert)
        //                    let OKAction = UIAlertAction(title: "OK", style: .default)
        //                    alertController.addAction(OKAction)
        //                    self.present(alertController, animated: true, completion: nil)
        //                }
        //            }
        //        })
    }
    
    func setButtonColor(isReachable: Bool) {
        button.backgroundColor = isReachable ? .green : .yellow
    }
    
    @IBAction func stopMonitoringTapped(_ sender: UIButton) {
        
        let title = isMonitoring ? "Start monitoring..." : "Stop monitoring"
        self.button.setTitle(title, for: .normal)
        self.button.sizeToFit()
        
        isMonitoring ? netMan.stopMonitoring() : netMan.startMonitoring()
        
        isMonitoring = !isMonitoring
        
        // reachability.swift
        reachability.stopNotifier()
    }
    
    
    // MARK: Reachability.swift
    
    @IBOutlet weak var isReachableLabel: UILabel!
    
    var reachability: Reachability!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        isReachableLabel.layer.cornerRadius = isReachableLabel.frame.width / 2
        isReachableLabel.layer.masksToBounds = true
        
        reachability = Reachability()
        NotificationCenter.default.addObserver(self, selector: #selector(self.reachabilityChanged(_:)), name: Notification.Name.reachabilityChanged, object: reachability)
        
        do {
            try reachability?.startNotifier()
        } catch {
            print("This is not working.")
            return
        }
        
    }
    
    func reachabilityChanged(_ note: NSNotification) {
        
        let reachability = note.object as! Reachability
        
        if reachability.connection != .none {
            
            configureLabel(with: "online", color: .green)
            if reachability.connection == .wifi {
                print("Reachable via WiFi")
            } else if reachability.connection == .cellular {
                print("Reachable via Cellular")
            }
        } else {
            print("Not reachable")
            configureLabel(with: "offline", color: .gray)
        }
    }
    
    func configureLabel(with text: String, color: UIColor) {
        isReachableLabel.backgroundColor = color
        isReachableLabel.text = text
    }
}








/*
 class ViewController: UIViewController {
 
 override func viewDidLoad() {
 super.viewDidLoad()
 
 if (CheckInternet.isConnectedToNetwork() == true) {
 // есть интернет
 print("on")
 }
 else{
 // у вас нет интернета
 print("off")
 }
 
 }
 
 }
 
 public class CheckInternet {
 class func isConnectedToNetwork() -> Bool {
 
 var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
 zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
 zeroAddress.sin_family = sa_family_t(AF_INET)
 
 let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
 $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
 SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
 }
 }
 
 var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
 if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
 return false
 }
 
 let isReachable = flags == .reachable
 let needsConnection = flags == .connectionRequired
 
 return isReachable && !needsConnection
 
 }
 
 */

