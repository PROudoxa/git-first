//
//  ViewController.swift
//  Slider
//
//  Created by Alex Voronov on 30.12.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var numberSlider: UISlider!
    @IBOutlet weak var rSlider: UISlider! {
        didSet {
            rSlider.transform = CGAffineTransform(rotationAngle: CGFloat(-M_PI_2))
            rSlider.tintColor = UIColor.red
        }
    }
    
    @IBOutlet weak var gSlider: UISlider! {
        didSet {
            gSlider.transform = CGAffineTransform(rotationAngle: CGFloat(-M_PI_2))
            gSlider.tintColor = UIColor.green
        }
    }
    
    @IBOutlet weak var bSlider: UISlider! {
        didSet {
            bSlider.transform = CGAffineTransform(rotationAngle: CGFloat(-M_PI_2))
            //bSlider.tintColor = UIColor.blue
        }
    }
    
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changeColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(rSlider.value), green: CGFloat(gSlider.value), blue: CGFloat(bSlider.value), alpha: 1)
    }

    @IBAction func numberSliderChanged(_ sender: UISlider) {
        label.text = String(numberSlider.value)
    }

    @IBAction func rgbSlider(_ sender: UISlider) {
        changeColor()
    }
}

