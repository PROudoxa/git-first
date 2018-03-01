//
//  ViewController.swift
//  Switch
//
//  Created by Alex Voronov on 13.11.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    //let mySwitch = UISwitch()
    let mySwitch2 = UISwitch()
    let button = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.button.frame = CGRect(x: 100, y: 200, width: 200, height: 100)
        self.button.backgroundColor = UIColor.orange
        self.button.setTitle("ok", for: .normal)
        self.button.setTitle("OOOOOOk", for: .highlighted)
        
        self.view.addSubview(self.button)
        
        
        self.mySwitch2.frame = CGRect.zero
        self.mySwitch2.center = self.view.center

        self.view.addSubview(self.mySwitch2)
        self.mySwitch2.tintColor = UIColor.green
        self.mySwitch2.thumbTintColor = UIColor.red
        self.mySwitch2.onTintColor = UIColor.blue
        
        self.mySwitch2.addTarget(self, action: #selector(isOn(target: )), for: .valueChanged)
        //self.button.addTarget(self, action: #selector(switchHasBeenChanged(parameterTarget: )), for: .normal)
        
    }
    
    
    
    func isOn(target: UISwitch) {
        if target.isOn {
            self.button.isUserInteractionEnabled = false
        } else {
            self.button.isUserInteractionEnabled = true
        }
    }
    
    
    
        
//        self.mySwitch.frame = CGRect(x: 100, y: 100, width: 0, height: 0)
//        self.view.addSubview(self.mySwitch)
//        
//        self.mySwitch.setOn(true, animated: true)
//        
//        self.mySwitch.addTarget(self, action: #selector(switchHasBeenChanged(paramTarget: )), for: .valueChanged)
//        
//    }
//    
//    func switchHasBeenChanged(paramTarget: UISwitch) {
//        if paramTarget.isOn {
//            print("On")
//        } else {
//            print("Off")
//        }
//    }


}

