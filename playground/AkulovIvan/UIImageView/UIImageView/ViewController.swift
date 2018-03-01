//
//  ViewController.swift
//  UIImageView
//
//  Created by Alex Voronov on 30.12.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageViewTop: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let imageView = UIImageView(frame: CGRect(x: 0, y: self.view.frame.size.height / 2, width: self.view.bounds.width, height: self.view.bounds.height / 2 ))
        imageView.image = UIImage(named: "cat")
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = UIColor.green
        
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false


        let metrics = ["imageViewHeight" : view.frame.size.height / 2, "imageViewWidth": view.frame.size.width - 10]
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[view]-(<=0)-[imageView(imageViewWidth)]", options: NSLayoutFormatOptions.alignAllCenterY, metrics: metrics, views: ["view": view, "imageView": imageView, "imageViewTop": imageViewTop]))
        //view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(-4)-[imageViewTop][imageView(imageViewHeight)]|", options: NSLayoutFormatOptions.alignAllCenterX, metrics: metrics, views: ["view": view, "imageView": imageView, "imageViewTop": imageViewTop]))
        let ss = view.subviews.count
        
        print(ss)
        
        for subview in view.subviews {
            print(subview.description)
            print(subview)
            print("---------------")
        }
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[imageViewTop]-imageViewHeight-[imageView(imageViewHeight)]|", options: NSLayoutFormatOptions.alignAllCenterX, metrics: metrics, views: ["view": view, "imageView": imageView, "imageViewTop": imageViewTop]))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

