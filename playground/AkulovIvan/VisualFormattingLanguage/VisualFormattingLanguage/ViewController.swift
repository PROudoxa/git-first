//
//  ViewController.swift
//  VisualFormattingLanguage
//
//  Created by Alex Voronov on 14.12.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let label1 = UILabel()
        label1.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        label1.text = "I'm label 1"
        
        let label2 = UILabel()
        label2.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        label2.text = "I'm label 2"
        
        let labels = [label1, label2]
        
        for label in labels {
            label.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(label)
        }
        let viewsDictionary = ["label1" : label1, "label2" : label2]
        let metrics = ["labelHeight" : 100, "labelWidth" : self.view.bounds.size.width / 3 - 10, "topMargin": self.view.bounds.size.height / 2 - 50]
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(topMargin)-[label1(labelHeight)]|", options: [], metrics: metrics, views: viewsDictionary))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(topMargin)-[label2(==100)]|", options: [], metrics: metrics, views: viewsDictionary))
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[label1(labelWidth)]-(100)-[label2(labelWidth@999)]-|", options: [], metrics: metrics, views: viewsDictionary))
    }

}

