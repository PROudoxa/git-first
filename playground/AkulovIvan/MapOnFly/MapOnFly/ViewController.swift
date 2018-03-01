//
//  ViewController.swift
//  MapOnFly
//
//  Created by Alex Voronov on 13.01.18.
//  Copyright © 2018 Alex Voronov. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    
    var geocoder: CLGeocoder!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        geocoder = CLGeocoder()
        
        textField.addTarget(self, action: #selector(ViewController.textFieldDidChanged), for: UIControlEvents.editingChanged)
        
    }
    
    func textFieldDidChanged() {
        geocoder.geocodeAddressString((textField.text!)) { (placemarks, error) -> Void in
            if error != nil {
                print("MapKit error \(String(describing: error))")
            }
            
            if let placemark = placemarks?.first {
                let annotation = MKPointAnnotation()
                annotation.title = "title"
                annotation.subtitle = self.textField.text!
                annotation.coordinate = placemark.location!.coordinate
                
                self.mapView.showAnnotations([annotation], animated: true)
                self.mapView.selectAnnotation(annotation, animated: true)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

