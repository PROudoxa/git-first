//
//  SecondViewController.swift
//  GCD_Akulov
//
//  Created by Alex Voronov on 16.12.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var imageURL: NSURL?
    var image: UIImage? {
        get { return imageView.image }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
        }
    }
    
    func fetchImage() {
        imageURL = NSURL(string: "https://upload.wikimedia.org/wikipedia/commons/0/07/Huge_ball_at_Vilnius_center.jpg")
        
        if let url = imageURL {
            self.activityIndicator.startAnimating()
            
            let concurrentQueue = DispatchQueue(label: "com.concurrent.queue", attributes: .concurrent)
            
            concurrentQueue.async {
                let imageData = NSData(contentsOf: url as URL)
                
                DispatchQueue.main.async {
                    if imageData != nil {
                        self.image = UIImage(data: imageData as! Data)
                    } else {
                        self.image = nil
                    }
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchImage()

        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            let alertController = UIAlertController(title: "Зарегистрированы?", message: "Введите Ваш логин и пароль", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "ОК", style: .default, handler: nil)
            let cancelAction = UIAlertAction(title: "Отмена", style: .default, handler: nil)
            
            alertController.addAction(okAction)
            alertController.addAction(cancelAction)
            
            alertController.addTextField { (usernameTF) in
                usernameTF.placeholder = "Ваш логин"
            }
            alertController.addTextField { (passwordTF) in
                passwordTF.placeholder = "Ваш пароль"
                passwordTF.isSecureTextEntry = true
            }
            
            self.present(alertController, animated: true, completion: nil)
        })
    }

}
