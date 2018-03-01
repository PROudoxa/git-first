//
//  SecondViewController.swift
//  CallbackApp3
//
//  Created by Alex Voronov on 04.02.18.
//  Copyright © 2018 Alex Voronov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {


    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var labelButton: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.text = ""
        
        // makes label clickable
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.labelSendDataTapped))
        labelButton.isUserInteractionEnabled = true
        labelButton.addGestureRecognizer(gesture)
    }
    
    var callback: ((String) -> ())?
    
    
    func labelSendDataTapped() {
        guard let text = textView.text, text != "" else {
            callback?("no data :(")
            navigationController?.popViewController(animated: true)
            return
        }
        callback?(text)
        navigationController?.popViewController(animated: true)
    }

}
