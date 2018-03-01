//
//  ViewController.swift
//  PickerView
//
//  Created by Alex Voronov on 29.11.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myPickerView: UIPickerView!
    
    let array = ["Пикачу", "Нехочу", "Пугачу"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myPickerView.delegate = self
        myPickerView.dataSource = self
        self.myImageView.image = UIImage(named: "pickachu")
    }

    // returns the number of 'columns' to display.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    // returns the # of rows in each component..
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return array.count
    }

    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0:
            self.myImageView.image = UIImage(named: "pickachu")
        case 1:
            self.myImageView.image = UIImage(named: "nehochu")
        case 2:
            self.myImageView.image = UIImage(named: "pugachu")
        default:
            break
        }
        
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return array[row]
    }
}

