//
//  ViewController.swift
//  FunnyRectangles
//
//  Created by Alex Voronov on 16.04.18.
//  Copyright © 2018 Alex Voronov. All rights reserved.
//

import UIKit

protocol DesktopBackgroundImageDelegate: class {
    func setBackgroundImage(imageName: String)
}

class DesktopViewController: UIViewController {

    // MARK: Properties
    let settingsController = SettingsViewController()
    var widthLimit: CGFloat {
        get {
            let restored = CGFloat(UserDefaults.standard.value(forKey: settingsController.widthLimitKey) as? Float ?? 100.0)
            return restored
        }
        //set {}
    }
    
    var heightLimit: CGFloat {
        get {
            let restored = CGFloat(UserDefaults.standard.value(forKey: settingsController.heightLimitKey) as? Float ?? 100.0)
            return restored
        }
        //set {}
    }
    
    var allowedCreating = true
    var tag = 1
    
    var currentRect = CGRect.zero
    lazy var currentRectView = UIView(frame: CGRect.zero)
    
    //origin for currentRectView
    var startPoint = CGPoint(x: 100.0, y: 200.0)
    var currentOrigin = CGPoint.zero
    
    lazy var timer = Timer()
    let timeInterval: Double = 10.0
    
    
    // MARK: IBOutlets
    @IBOutlet weak var longPressGestureRecognizer: UILongPressGestureRecognizer!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var addRectButton: UIButton!
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rotateBackground() // for first launch VC
        
        addRectButton.layer.cornerRadius = 5.0
        
        /*// TODO: implement KVO or KVC
        self.widthLimit = CGFloat(UserDefaults.standard.value(forKey: settingsController.widthLimitKey) as? Float ?? 100.0)
        self.heightLimit = CGFloat(UserDefaults.standard.value(forKey: settingsController.heightLimitKey) as? Float ?? 100.0)
        
        print("widthLimit: \(widthLimit) heightLimit: \(heightLimit)") */
        
        //guard let rotatable: Bool = UserDefaults.standard.value(forKey: "rotatedBackground") as? Bool, rotatable else { return }
        
        runTimer()
    }
    
    deinit {
        self.timer.invalidate()
    }
}

// MARK: IBActions
extension DesktopViewController {
    
    @IBAction func addRectTapped(_ sender: UIButton) {
    // TODO: implement adding new rect
        //print("add tapped")
        
        let widthScreen = self.view.bounds.width
        let heightScreen = self.view.bounds.height
        
        var randX = CGFloat.randomFloat() * widthScreen
        var randY = CGFloat.randomFloat() * heightScreen
        
        self.startPoint = CGPoint(x: randX, y: randY)
        
        randX = CGFloat.randomFloat() * widthScreen
        randY = CGFloat.randomFloat() * heightScreen
        
        let diagonalPoint = CGPoint(x: randX, y: randY)

        
        initializeRectangle()
        configureRectangle(with: diagonalPoint, durationAnimation: 1.0)
        saveRectangle()
    }
    
    @IBAction func handleDeskLongPress(_ sender: UILongPressGestureRecognizer) {
        
        guard allowedCreating else { allowedCreating = true; return } // next touch on desktop allows creating rect
                                                                      // after touch(and canceling) on existing rect(s)
        switch sender.state {
        case .began:
            
            self.startPoint = sender.location(in: sender.view)
            initializeRectangle()
            
        case .changed:
            
            let newPoint = sender.location(in: self.view)
            configureRectangle(with: newPoint, durationAnimation: 0.2)
            
        case .ended:
            
            saveRectangle()
        
        default:
            print("default switch")
        }
    }
}

// MARK: gestures
private extension DesktopViewController {
    
    // MARK: Timer
    func runTimer() {
        
        // TODO: implement KVO / KVC
        guard let rotatable: Bool = UserDefaults.standard.value(forKey: "rotatedBackground") as? Bool, rotatable else {
            //self.timer.invalidate()
            return
        }
        guard rotatable else { return }

        self.timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self,   selector: (#selector(self.rotateBackground)), userInfo: nil, repeats: true)
        
        //return timer
    }
    // MARK: func for handling pinch
    func _mode(_ sender: UIPinchGestureRecognizer) -> String {
        
        //        // very important:
        //        if sender.numberOfTouches < 2 {
        //            print("avoided an obscure crash!!")
        //            return ""
        //        }
        
        let A = sender.location(ofTouch: 0, in: sender.view)
        let B = sender.location(ofTouch: 1, in: sender.view)
        
        let xD = fabs( A.x - B.x )
        let yD = fabs( A.y - B.y )
        if (xD == 0) { return "V" }
        if (yD == 0) { return "H" }
        let ratio = xD / yD
        // print(ratio)
        if (ratio > 2) { return "H" }
        if (ratio < 0.5) { return "V" }
        return "D"
    }
    
    @objc func rotateBackground() {
        
        //guard let rotatable: Bool = UserDefaults.standard.value(forKey: "rotatedBackground") as? Bool, rotatable else { return }
        
        let imageManager = ImageManager()
        
        imageManager.delegate = self
        imageManager.changeBackground(firstTime: true)
    }
    
    func configureRectangle(with newPoint: CGPoint, durationAnimation: Double)  {
        
        // new point position relatively origin
        let incrementX = newPoint.x - self.startPoint.x
        let incrementY = newPoint.y - self.startPoint.y
        
        // point is in (bottom + right) quarter
        if (incrementX >= 0) && (incrementY > 0) {
            bottomRightCorner(replacedBy: newPoint, duration: durationAnimation)
        }
        
        // new point is in (top + right) quarter
        if (incrementX >= 0) && (incrementY < 0) {
            topRightCorner(replacedBy: newPoint, incrementX: incrementX, incrementY: incrementY, duration: durationAnimation)
        }
        
        // new point is in (bottom + left) quarter
        if (incrementX < 0) && (incrementY >= 0) {
            bottomLeftCorner(replacedBy: newPoint, incrementX: incrementX, incrementY: incrementY, duration: durationAnimation)
        }
        
        // new point is in (top + left) quarter
        if (incrementX < 0) && (incrementY <= 0) {
            topLeftCorner(replacedBy: newPoint, incrementX: incrementX, incrementY: incrementY, duration: durationAnimation)
        }
    }
    
    // MARK: creating rectangles
    
    func initializeRectangle() {
        
        self.currentOrigin = self.startPoint
        
        self.currentRect = CGRect(origin: self.startPoint, size: CGSize())
        self.currentRectView = UIView(frame: currentRect)
        
        self.currentRectView.backgroundColor = .blue
        self.view.addSubview(currentRectView)
    }
    
    func bottomRightCorner(replacedBy newPoint: CGPoint, duration: Double) {
        let incrementX = newPoint.x - self.currentOrigin.x
        let incrementY = newPoint.y - self.currentOrigin.y
        
        UIView.animate(withDuration: duration, animations: {
            self.currentRectView.frame.size.width = incrementX
            self.currentRectView.frame.size.height = incrementY
        })
    }
    
    func topRightCorner(replacedBy newPoint: CGPoint, incrementX: CGFloat, incrementY: CGFloat, duration: Double) {
        self.currentOrigin.y = newPoint.y
        
        UIView.animate(withDuration: duration, animations: {
            self.currentRectView.frame.origin = self.currentOrigin
            self.currentRectView.frame.size.width = incrementX
            self.currentRectView.frame.size.height = -incrementY
        })
    }
    
    func bottomLeftCorner(replacedBy newPoint: CGPoint, incrementX: CGFloat, incrementY: CGFloat, duration: Double) {
        self.currentOrigin.x = newPoint.x
        
        UIView.animate(withDuration: duration, animations: {
            self.currentRectView.frame.origin.x = self.currentOrigin.x
            self.currentRectView.frame.size.width = -incrementX
            self.currentRectView.frame.size.height = incrementY
        })
    }
    
    func topLeftCorner(replacedBy newPoint: CGPoint, incrementX: CGFloat, incrementY: CGFloat, duration: Double) {
        self.currentOrigin = newPoint
        
        UIView.animate(withDuration: duration, animations: {
            self.currentRectView.frame.origin = self.currentOrigin
            self.currentRectView.frame.size.width = -incrementX
            self.currentRectView.frame.size.height = -incrementY
        })
    }
    
    func saveRectangle() {
        
        if (self.currentRectView.frame.width > self.widthLimit) && (self.currentRectView.frame.height > self.heightLimit) {
            
            self.currentRectView.backgroundColor = .randomColor()
            self.currentRectView.tag = self.tag
            self.tag += 1
            
            let recognizers: [UIGestureRecognizer] = self.setGestureRecognizers()
            
            // Separates one and two taps gestures
            if recognizers.count >= 2 {
                recognizers[0].require(toFail: recognizers[1])
            }
            
            for recognizer in recognizers {
                self.currentRectView.addGestureRecognizer(recognizer)
                self.longPressGestureRecognizer.require(toFail: recognizer)
            }
            
            currentRectView.removeGestureRecognizer(longPressGestureRecognizer)
            self.view.bringSubview(toFront: logoImageView)
            self.view.bringSubview(toFront: addRectButton)

        } else {

            if (currentRectView.frame.width > 5.0) || (currentRectView.frame.height > 5.0) {
                
                let savedAlertState: Bool? = UserDefaults.standard.value(forKey: settingsController.showAlertKey) as? Bool
                
                let showingAllowed = savedAlertState ?? true
                
                showingAllowed ? showAlertAndRemoveView(poorView: self.currentRectView) : animatedRemoving(poorView: self.currentRectView)
                
            } else {
                // prevents appearing alert in case missclick(misstouch)
                self.currentRectView.removeFromSuperview()
            }
        }
    }
    
    func showAlertAndRemoveView(poorView: UIView) {
        
        let message = "Sorry, that rect was...\ntoo little (\(Int(currentRectView.frame.width)) x \(Int(currentRectView.frame.height)))\nlimits: (\(Int(widthLimit)) x \(Int(heightLimit)))"
        
        let alertController = UIAlertController(title: "Oops...", message: message, preferredStyle: .alert)
        
        let okTitle = "Ok :("
        let okAction = UIAlertAction(title: okTitle, style: .cancel, handler: { (okAction) in
            
            if okAction.title == okTitle {
                
                self.animatedRemoving(poorView: poorView)
            }
        })
        
        alertController.addAction(okAction)
        
        present(alertController, animated: true)
    }
    
    func animatedRemoving(poorView: UIView) {
        
        UIView.animate(withDuration: 0.9, animations: {
            
            poorView.frame = CGRect.zero
            
        }, completion: { (flag) in
            
            poorView.removeFromSuperview()
            //print("finished! - \(flag)")
        })
    }
    
    // MARK: handle gestures
    @objc func handleTapToHighlight(_ sender: UITapGestureRecognizer) {
        self.view.bringSubview(toFront: sender.view!)
        self.view.bringSubview(toFront: logoImageView)
        self.view.bringSubview(toFront: addRectButton)

        //print("one tap...")
        //print("tag: \(String(describing: sender.view?.tag))")
    }
    
    @objc func handleTapDelete(_ sender: UITapGestureRecognizer) {
        
        guard let deletedRect = sender.view else { return }
        
        self.view.bringSubview(toFront: deletedRect)
        
        let message = "Are you sure you want to kill it?"
        
        let alertController = UIAlertController(title: "Removing", message: message, preferredStyle: .alert)
        
        let cancelTitle = "Cancel"
        let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel)
        
        let okTitle = "Yes!"
        let okAction = UIAlertAction(title: okTitle, style: .default, handler: { (okAction) in
            
            if okAction.title == okTitle {
                
                deletedRect.gestureRecognizers?.forEach(deletedRect.removeGestureRecognizer)
                self.animatedRemoving(poorView: deletedRect)
            }
        })
        
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        
        present(alertController, animated: true)
    }
    
    @objc func handlePan(_ sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: self.view)
        if let view = sender.view {
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        }
        
        sender.setTranslation(CGPoint.zero, in: self.view)
        
        self.view.bringSubview(toFront: logoImageView)
        self.view.bringSubview(toFront: addRectButton)
    }
    
    @objc func handlePinch(_ sender: UIPinchGestureRecognizer) {
        
        let mode = _mode(sender)
        
        // vertical scaling
        if mode == "V" {
            sender.view?.transform = (sender.view?.transform.scaledBy(x: 1.0, y: sender.scale))!
            sender.scale = 1.0
        }
        
        // horizontal scaling
        if mode == "H" {
            sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: 1.0))!
            sender.scale = 1.0
        }
        
        // diagonal scaling
        if mode == "D" {
            sender.view?.transform = (sender.view?.transform.scaledBy(x: 1.0 + (sender.scale - 1.0) / 2, y: 1.0 + (sender.scale - 1.0) / 2))!
            sender.scale = 1.0
        }
        
        // TODO: add some fun feature in future
        let vel = sender.velocity
        if vel < 0 {
            //print("you're squeezing the screen!")
        }
    }
    
    @objc func handleRotate(_ sender: UIRotationGestureRecognizer) {
        
        var lastRotation = CGFloat()
        
        if(sender.state == UIGestureRecognizerState.ended){
            lastRotation = 0.0;
        }
        let rotation = 0.0 - (lastRotation - sender.rotation)
        let currentTrans = sender.view?.transform
        let _ = currentTrans!.rotated(by: rotation) // newTrans
        sender.view?.transform = CGAffineTransform(rotationAngle: sender.rotation) //newTrans
        lastRotation = sender.rotation

//        if let view = sender.view {
//            view.transform = CGAffineTransform(rotationAngle: sender.rotation)
//        }
    }
    
    @objc func handleLongPress(_ sender: UIPinchGestureRecognizer) {
        
        if sender.state == .began {
            
        } else if sender.state == .changed {
            
        } else if sender.state == .ended {
            sender.view?.backgroundColor = .randomColor()
        }
    }
    
    func setGestureRecognizers() -> [UIGestureRecognizer] {
        return [
            setTapGestureToMove(),
            setTapGestureToDelete(),
            setPanGesture(),
            setPinchGesture(),
            setRotateGesture(),
            setLongPressGesture() ]
    }
    
    // MARK: set gestures
    func setTapGestureToMove() -> UITapGestureRecognizer {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapToHighlight(_:)))
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
}

// MARK: UIGestureRecognizerDelegate
extension DesktopViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if gestureRecognizer == longPressGestureRecognizer {
            print("out") // FIXME: never goes here
            allowedCreating = true
            
            return true
        }
        
        //print("point is in rect")
        //disallow creating new rect if finger is on one of existing rectangles
        allowedCreating = false
        
        return false
    }
    
    /*
    // MARK: not in use now but maybe in future :)
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let currentPoint = touch.location(in: self.view)
            print("touchesBegan: \(currentPoint)")
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let currentPoint = touch.location(in: self.view)
            print("touchesMoved: \(currentPoint)")
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let currentPoint = touch.location(in: self.view)
            print("touchesEnded: \(currentPoint)")
        }
    } */
}

// MARK: DesktopBackgroundImageDelegate
extension DesktopViewController: DesktopBackgroundImageDelegate {

    func setBackgroundImage(imageName: String) {
        self.backgroundImageView.image = UIImage(named: imageName)
    }
}

// MARK: other extensions
extension CGFloat {
    static func randomFloat() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func randomColor() -> UIColor {
        return UIColor(red:   .randomFloat(), green: .randomFloat(), blue:  .randomFloat(), alpha: 1.0)
    }
}
