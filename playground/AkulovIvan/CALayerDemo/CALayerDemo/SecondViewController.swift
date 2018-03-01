//
//  SecondViewController.swift
//  CALayerDemo
//
//  Created by Ivan Akulov on 07/12/2016.
//  Copyright © 2016 Ivan Akulov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, CAAnimationDelegate {
    
    var shapeLayer: CAShapeLayer! {
        didSet {
            shapeLayer.lineWidth = 20
            shapeLayer.fillColor = nil
            shapeLayer.strokeEnd = 0.0
            
            let color = UIColor.getRandomColor()
            //let color = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1).cgColor
            shapeLayer.strokeColor = color.cgColor
        }
    }
    
    override func viewDidLayoutSubviews() {
        configShapeLayer(shapeLayer)
    }
    
    func configShapeLayer(_ shapeLayer: CAShapeLayer) {
        shapeLayer.frame = view.bounds
        let path = UIBezierPath()
        let center = CGPoint(x: imageView.frame.maxX - imageView.bounds.width / 2, y: imageView.frame.maxY - imageView.bounds.height / 2)
        let radius: CGFloat = imageView.bounds.width / 2
        let startAngle: CGFloat = 0.0
        let endAngle: CGFloat = CGFloat(M_PI * 2) // CGFloat(M_PI_2)
        
        path.addArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        shapeLayer.path = path.cgPath
    }
    
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = imageView.bounds.height / 2
            imageView.layer.masksToBounds = true
            imageView.layer.borderWidth = 8
            imageView.layer.borderColor = UIColor.blue.cgColor
        }
    }
    
    @IBOutlet weak var button: UIButton! {
        didSet {
            button.layer.shadowRadius = 10
            button.layer.shadowOffset = CGSize(width: 2, height: 5)
            button.layer.shadowOpacity = 0.7
            button.layer.shadowColor = UIColor.blue.cgColor
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        shapeLayer = CAShapeLayer()
        view.layer.addSublayer(shapeLayer)
    }
    
    @IBAction func takeTheCapTapped(_ sender: UIButton) {
        shapeLayer.strokeColor = UIColor.getRandomColor().cgColor
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 2
        
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.fillMode = kCAFillModeBoth
        animation.isRemovedOnCompletion = false
        
        animation.delegate = self
        
        shapeLayer.add(animation, forKey: nil)
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag {
            print("finished!")
        }
    }

    
}

extension UIColor {
    static func getRandomColor() -> UIColor {
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        print("red: \(red), green: \(green), blue: \(blue)")
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
