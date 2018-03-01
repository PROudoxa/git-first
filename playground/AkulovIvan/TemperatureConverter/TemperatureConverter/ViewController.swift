//
//  ViewController.swift
//  TemperatureConverter
//
//  Created by Alex Voronov on 22.02.18.
//  Copyright © 2018 Alex Voronov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var celciumLabel: UILabel!
    @IBOutlet weak var farenheitLabel: UILabel!
    @IBOutlet weak var slider: UISlider! {
        didSet {
            slider.maximumValue = 120
            slider.minimumValue = -45
            slider.value = 36.6
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaultValue = Float(round(10 * slider.value) / 10)
        celciumLabel.text = "\(defaultValue) ºC"
        farenheitLabel.text = "\(celciumToFarenheit(temperature: defaultValue)) F"
    }

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let temperatureCelcius = Float(round(10 * sender.value) / 10)
        celciumLabel.text = "\(temperatureCelcius) ºC"
        let temperatureFarenheit = celciumToFarenheit(temperature: temperatureCelcius)
        farenheitLabel.text = "\(temperatureFarenheit) F"
    }
    
    func celciumToFarenheit(temperature: Float) -> Float {
        let farenheit = temperature * 9 / 5 + 32
        let roundedFarenheit = Float(round(10 * farenheit) / 10)
        return roundedFarenheit
    }

}

