//
//  ViewController.swift
//  Torch
//
//  Created by Alex Voronov on 10.12.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func torchTapped(_ sender: UIButton) {
        let device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        
        if (device?.hasTorch)! {
            do {
                try device?.lockForConfiguration()
                device?.torchMode = device?.torchMode == AVCaptureTorchMode.on ? .off : .on
                device?.unlockForConfiguration()
                
            } catch {
                print(error)
            }
        }
    }

}

