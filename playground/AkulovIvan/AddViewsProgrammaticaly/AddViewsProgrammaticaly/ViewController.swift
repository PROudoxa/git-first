//
//  ViewController.swift
//  AddViewsProgrammaticaly
//
//  Created by Alex Voronov on 09.02.18.
//  Copyright © 2018 Alex Voronov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let rect1 = CGRect(x: 50, y: 100, width: 100, height: 200)
        let rect2 = CGRect(x: 100, y: 150, width: 100, height: 200)
        
        let view1 = UIView(frame: rect1)
        let view2 = UIView(frame: rect2)
        
        view1.translatesAutoresizingMaskIntoConstraints = false
        view2.translatesAutoresizingMaskIntoConstraints = false
        
        
        view1.backgroundColor = .orange
        view2.backgroundColor = .blue
        
        
        view.addSubview(view1)
        view.addSubview(view2)
        
    }



}

