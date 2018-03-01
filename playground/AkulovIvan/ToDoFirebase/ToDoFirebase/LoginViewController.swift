//
//  ViewController.swift
//  ToDoFirebase
//
//  Created by Alex Voronov on 01.02.18.
//  Copyright © 2018 Alex Voronov. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    let segueIdentifier = "tasksSegue"
    var ref: DatabaseReference!
    
    @IBOutlet weak var warnLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference(withPath: "users")

        NotificationCenter.default.addObserver(self, selector: #selector(moveContentUpWhenKeyboardIsShown), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(moveContentDownWhenKeyboardIsHidden), name: NSNotification.Name.UIKeyboardDidHide, object: nil)
        
        warnLabel.isHidden = true
        //warnLabel.alpha = 0

        Auth.auth().addStateDidChangeListener { [weak self] (auth, user) in
            if user != nil {
                self?.performSegue(withIdentifier: self!.segueIdentifier, sender: nil)
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.emailTextField.text = ""
        self.passwordTextField.text = ""
    }
    
    func moveContentUpWhenKeyboardIsShown(notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        
        let kbFrameSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        // увеличить высоту контента+добавить возможность скролить
        (self.view as! UIScrollView).contentSize = CGSize(width: self.view.bounds.size.width , height: self.view.bounds.height + kbFrameSize.height)
        // чтобы индикатор скрола не заходил за клавиатуру
        (self.view as! UIScrollView).scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbFrameSize.height, right: 0)
        
        /*
        вариант(сырой) с поднятием контента
        https://medium.com/@dzungnguyen.hcm/autolayout-for-scrollview-keyboard-handling-in-ios-5a47d73fd023
        let distanceToBottom = self.view.frame.size.height - emailTextField.frame.origin.y - emailTextField.frame.size.height
        print("distance: " + String(describing: distanceToBottom))
        let collapseSpace = distanceToBottom - kbFrameSize.height
        print("collapseSpace: " + String(describing: collapseSpace))
        
        if collapseSpace < 20 {
            // no collapse
            return
        }
        (self.view as! UIScrollView).contentOffset = CGPoint(x: (self.view as! UIScrollView).contentOffset.x, y: collapseSpace + 10 - kbFrameSize.height) */
    }
    
    func moveContentDownWhenKeyboardIsHidden(notification: Notification) {
        (self.view as! UIScrollView).contentSize = CGSize(width: self.view.bounds.size.width , height: self.view.bounds.height)
    }

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        
        guard let email = self.emailTextField.text,
              let password = self.passwordTextField.text,
              email != "", password != ""
        else {
            displayWarningLabel(withText: "please fill the fields")
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (user, error) in
            if error != nil {
                self?.displayWarningLabel(withText: "error occured")
                return
            }
            
            if user != nil {
                self?.performSegue(withIdentifier: self!.segueIdentifier, sender: nil)
                return
            } else {
                self?.displayWarningLabel(withText: "Sorry, there is no user with email \(email)")
            }
        }
    }
    
    func displayWarningLabel(withText text: String) {
        
        warnLabel.text = text
        warnLabel.adjustsFontSizeToFitWidth = true
        warnLabel.lineBreakMode = .byTruncatingTail
        
        UIView.animate(withDuration: 3, delay: 0.2, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [.curveEaseInOut], animations: { [weak self] in
            self?.warnLabel.isHidden = false
            //self?.warnLabel.alpha = 1
        }) { [weak self] complete in
            self?.warnLabel.isHidden = true
            //self?.warnLabel.alpha = 0
        }
    }

    @IBAction func registerButtonTapped(_ sender: UIButton) {
        
        guard let email = self.emailTextField.text,
            let password = self.passwordTextField.text,
            email != "", password != ""
            else {
                displayWarningLabel(withText: "please fill the fields")
                return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] (user, error) in

            guard error == nil, user != nil else {
                print(error?.localizedDescription ?? "oops, error occured...")
                self?.displayWarningLabel(withText: error!.localizedDescription)
                return
            }
            
            let userRef = self?.ref.child(user!.uid)
            userRef?.setValue(["email": user!.email])

            print("Registration with email \(String(describing: user?.email)) - OK")
        }
    }
}












