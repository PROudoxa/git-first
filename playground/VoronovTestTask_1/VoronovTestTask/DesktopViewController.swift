//
//  ViewController.swift
//  VoronovTestTask
//
//  Created by Alex Voronov on 15.04.18.
//  Copyright © 2018 Alex Voronov. All rights reserved.
//

import UIKit

class DesktopViewController: UIViewController, UIGestureRecognizerDelegate {

    
    //let gestureManager = GestureManager()
    
    @IBOutlet weak var rectView: UIView!
    @IBOutlet weak var coverView: UIView!


    override func viewDidLoad() {
        super.viewDidLoad()

        
        var recognizers = [
            setTapGestureToMove(),
            setTapGestureToDelete(),
            setPanGesture(),
            setPinchGesture(),
            setRotateGesture(),
            setLongPressGesture() ]

        
        // временно тут!
        recognizers[0].require(toFail: recognizers[1])
        recognizers[3].delegate = self
        
        for recognizer in recognizers {
            rectView.addGestureRecognizer(recognizer)
        }
        
        recognizers = [
            setTapGestureToMove(),
            setTapGestureToDelete(),
            setPanGesture(),
            setPinchGesture(),
            setRotateGesture(),
            setLongPressGesture() ]
        
        // временно тут!
        recognizers[0].require(toFail: recognizers[1])
        recognizers[3].delegate = self
        
        for recognizer in recognizers {
            coverView.addGestureRecognizer(recognizer)
        }
        
        
    }
    
    

    
    // MARK: set gesture recognizers

    func setTapGestureToMove() -> UITapGestureRecognizer {
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapToMove(_:)))
        tapRecognizer.numberOfTapsRequired = 1
        
        return tapRecognizer
    }
    
    func setTapGestureToDelete() -> UITapGestureRecognizer {
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapDelete(_:)))
        tapRecognizer.numberOfTapsRequired = 2
        
        return tapRecognizer
    }
    
    func setPanGesture() -> UIPanGestureRecognizer {
        
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        
        return panRecognizer
    }
    
    func setPinchGesture() -> UIPinchGestureRecognizer {
        
        let pinchRecognizer = UIPinchGestureRecognizer (target: self, action: #selector(handlePinch(_:)))
        
        return pinchRecognizer
    }
    
    func setRotateGesture() -> UIRotationGestureRecognizer {
        
        let rotateRecognizer = UIRotationGestureRecognizer (target: self, action: #selector(handleRotate(_:)))
        
        return rotateRecognizer
    }
    
    func setLongPressGesture() -> UILongPressGestureRecognizer {
        
        let longPressRecognizer = UILongPressGestureRecognizer (target: self, action: #selector(handleLongPress(_:)))
        
        return longPressRecognizer
    }
    
    
    
    // MARK: handle gesture recognizers

    func handleTapToMove(_ sender: UITapGestureRecognizer) {
        self.view.bringSubview(toFront: sender.view!)
    
        print("moving...")
        
        //let location = sender.location(in: view)
        // User tapped at the point above. Do something with that if you want.
    }
    
    func handleTapDelete(_ sender: UITapGestureRecognizer) {
        print("deleted!")
    }
    
    func handlePan(_ sender: UIPanGestureRecognizer) {
        print("pan")
    }
    
    func handlePinch(_ sender: UIPinchGestureRecognizer) {
        print("pinch")
    }
    
    func handleRotate(_ sender: UIRotationGestureRecognizer) {
        print("rotate")
    }
    
    func handleLongPress(_ sender: UIPinchGestureRecognizer) {
        print("long press")
    }
    
    // MARK: UIGestureRecognizerDelegate
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        //print("simultaneously")
        
        // documentation/uikit/touches_presses_and_gestures/coordinating_multiple_gesture_recognizers/allowing_the_simultaneous_recognition_of_multiple_gestures
//        if gestureRecognizer.view != self.yellowView &&
//            gestureRecognizer.view != self.cyanView &&
//            gestureRecognizer.view != self.magentaView {
//            return false
//        }

        
        if gestureRecognizer.view != otherGestureRecognizer.view {
            return false
        }

        if gestureRecognizer is UILongPressGestureRecognizer ||
            otherGestureRecognizer is UILongPressGestureRecognizer {
            return false
        }
        
        return true
    }


}

