//
//  ViewController.swift
//  HideKeyboard
//
//  Created by Alex Voronov on 22.11.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerForKeyboardNotifications()
    }
    
    deinit {
        removeKeyboardNotifications()
    }
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(contentIsGoingUp), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(contentIsGoingDown), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func removeKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    func contentIsGoingUp(_ notification: Notification) {
        let userInfo = notification.userInfo
        let keyboardFrameSize = (userInfo?[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardHeight = keyboardFrameSize.height
        scrollView.contentOffset = CGPoint(x: 0, y: keyboardHeight)
    }
    
    func contentIsGoingDown() {
        scrollView.contentOffset = CGPoint.zero
    }

    @IBAction func hideButtonTapped(_ sender: UIButton) {
        firstTextField.resignFirstResponder()
        secondTextField.resignFirstResponder()
    }
// does not work here...why?
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.view.endEditing(true)
//    }
}

