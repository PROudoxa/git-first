//
//  ViewController.swift
//  ReadFromFile
//
//  Created by Alex Voronov on 18.12.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    var textForTextView = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.text = textForTextView
        automaticallyAdjustsScrollViewInsets = false
    }

}

