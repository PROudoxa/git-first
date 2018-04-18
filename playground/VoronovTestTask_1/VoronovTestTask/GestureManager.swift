////
////  GestureManager.swift
////  VoronovTestTask
////
////  Created by Alex Voronov on 15.04.18.
////  Copyright © 2018 Alex Voronov. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//class GestureManager {
//    
//    
//    init() {}
//    
//    func getAllGestureRecognizers() -> [UIGestureRecognizer] {
//        
//        let arr = [
//            setTapGestureToMove(),
//            setTapGestureToDelete(),
//            setPanGesture(),
//            setPinchGesture(),
//            setRotateGesture(),
//            setLongPressGesture()  ]
//        
//        return arr
//    }
//    
//
//    // MARK: set gesture recognizers
//    
//    func setTapGestureToMove() -> UITapGestureRecognizer {
//        
//        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapToMove(_:)))
//        tapRecognizer.numberOfTapsRequired = 1
//        
//        return tapRecognizer
//    }
//    
//    func setTapGestureToDelete() -> UITapGestureRecognizer {
//        
//        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapDelete(_:)))
//        tapRecognizer.numberOfTapsRequired = 2
//        
//        return tapRecognizer
//    }
//    
//    func setPanGesture() -> UIPanGestureRecognizer {
//        
//        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
//        
//        return panRecognizer
//    }
//    
//    func setPinchGesture() -> UIPinchGestureRecognizer {
//        
//        let pinchRecognizer = UIPinchGestureRecognizer (target: self, action: #selector(handlePinch(_:)))
//        
//        return pinchRecognizer
//    }
//    
//    func setRotateGesture() -> UIRotationGestureRecognizer {
//        
//        let rotateRecognizer = UIRotationGestureRecognizer (target: self, action: #selector(handleRotate(_:)))
//        
//        return rotateRecognizer
//    }
//    
//    func setLongPressGesture() -> UILongPressGestureRecognizer {
//        
//        let longPressRecognizer = UILongPressGestureRecognizer (target: self, action: #selector(handleLongPress(_:)))
//        
//        return longPressRecognizer
//    }
//    
//    
//    
//    // MARK: handle gesture recognizers
//    
//    @objc func handleTapToMove(_ sender: UITapGestureRecognizer) {
//        //self.view.bringSubview(toFront: sender.view!)
//        
//        print("moving...")
//        
//        //let location = sender.location(in: view)
//        // User tapped at the point above. Do something with that if you want.
//    }
//    
//    @objc func handleTapDelete(_ sender: UITapGestureRecognizer) {
//        print("deleted!")
//    }
//    
//    @objc func handlePan(_ sender: UIPanGestureRecognizer) {
//        print("pan")
//    }
//    
//    @objc func handlePinch(_ sender: UIPinchGestureRecognizer) {
//        print("pinch")
//    }
//    
//    @objc func handleRotate(_ sender: UIRotationGestureRecognizer) {
//        print("rotate")
//    }
//    
//    @objc func handleLongPress(_ sender: UIPinchGestureRecognizer) {
//        print("long press")
//    }
//    
//    // MARK: UIGestureRecognizerDelegate
//    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
//        //print("simultaneously")
//        return true
//    }
//
//
//}
//
