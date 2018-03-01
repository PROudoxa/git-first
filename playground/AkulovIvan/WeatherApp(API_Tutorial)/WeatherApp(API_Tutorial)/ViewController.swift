//
//  ViewController.swift
//  WeatherApp(API_Tutorial)
//
//  Created by Alex Voronov on 13.01.18.
//  Copyright © 2018 Alex Voronov. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    
    let locationManager = CLLocationManager()
    
    lazy var weatherManager = APIWeatherManager(apiKey: "721cf0aa9feaf34346ff0e825fad953b")
    let coordinates = Coordinates(latitude: 46.694693, longitude: 32.551904)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        sleep(2)
        locationManager.stopUpdatingLocation()
        
        getCurrentWeatherData()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation = locations.last! as CLLocation
        
        print("my location latitude: \(userLocation.coordinate.latitude), longitude: \(userLocation.coordinate.longitude)")
    }
    
    func getCurrentWeatherData() {
        weatherManager.fetchCurrentWeatherWith(coordinates: coordinates) { (result) in
            self.toggleActivityIndicator(on: false)

            switch result {
            case .Success(let currentWeather):
                self.updateUIWith(currenWeather: currentWeather)
            case .Failure(let error as NSError):
                self.showAlertWith(error: error)
            default: break
            }
        }
    }
    
    func showAlertWith(error: NSError) {
        let title = String(error.code) + " Unable to get data"
        let message = error.localizedDescription
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showAlertWith2(title: String, message: String) {
        let title = title
        let message = message
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }

    func updateUIWith(currenWeather: CurrentWeather) {
        self.imageView.image = currenWeather.icon
        self.pressureLabel.text = currenWeather.pressureString
        self.temperatureLabel.text = currenWeather.temperatureString
        self.feelsLikeLabel.text = currenWeather.appearentTemperatureString
        self.humidityLabel.text = currenWeather.humidityString
    }
    
    @IBAction func refreshButtonTarred(_ sender: UIButton) {
        toggleActivityIndicator(on: true)
        getCurrentWeatherData()
    }

    func toggleActivityIndicator(on: Bool) {
        refreshButton.isHidden = on
        
        if on {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
}

