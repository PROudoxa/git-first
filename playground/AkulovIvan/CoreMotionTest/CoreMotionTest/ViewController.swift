//
//  ViewController.swift
//  CoreMotionTest
//
//  Created by Alex Voronov on 29.11.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet weak var colorLabel: UILabel!
    
    let manager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if manager.isDeviceMotionAvailable {
            manager.deviceMotionUpdateInterval = 0.5
            manager.startDeviceMotionUpdates(to: OperationQueue.main, withHandler: { (data: CMDeviceMotion?, error: NSError?) in
                print("Acceleration x: \(String(describing: data?.userAcceleration.x))")
                print("Rotation x: \(String(describing: data?.rotationRate.x))")
                print("Gravity z: \(String(describing: data?.gravity.z))")
                
                if (data?.userAcceleration.x)! < -1.5 {
                    self.colorLabel.text = "Red"
                    self.view.backgroundColor = UIColor.red
                } else if (data?.userAcceleration.x)! > 1.5 {
                    self.colorLabel.text = "Green"
                    self.view.backgroundColor = UIColor.green
                }
            } as! CMDeviceMotionHandler)
        
        }
    }

}

