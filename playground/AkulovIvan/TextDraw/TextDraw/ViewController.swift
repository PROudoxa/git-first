//
//  ViewController.swift
//  TextDraw
//
//  Created by Alex Voronov on 31.12.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let text: NSString = "Some text"
        
        let newImage = textToImage(text: text, toImage: imageView.image!, atPoint: CGPoint(x: 20, y: imageView.frame.height - 40))
        imageView.image = newImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textToImage(text: NSString, toImage image: UIImage, atPoint point: CGPoint) -> UIImage {
        let textColor = UIColor.red
        let textFont = UIFont(name: "Helvetica Bold", size: 20)
        
        let scale = UIScreen.main.scale
        
        UIGraphicsBeginImageContextWithOptions(image.size, false, scale)
        
        let textFontAttributes = [
            NSFontAttributeName: textFont as Any,
            NSForegroundColorAttributeName: textColor
        ] as [String: Any]
        
        image.draw(in: CGRect(origin: CGPoint.zero, size: image.size))
        
        let rect = CGRect(origin: point, size: image.size)
        text.draw(in: rect, withAttributes: textFontAttributes)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }

}






