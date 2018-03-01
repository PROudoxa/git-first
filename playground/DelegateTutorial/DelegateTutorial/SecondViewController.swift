//
//  SecondViewController.swift
//  DelegateTutorial
//
//  Created by Alex Voronov on 26.08.17.
//  Copyright © 2017 Alex&V. All rights reserved.
//

import UIKit

protocol DataEnteredDelegate {
    func userDidEtnterInformation(info: NSString)
}

class SecondViewController: UIViewController {

    @IBOutlet var dataTextField: UITextField!
    
    var delegate: DataEnteredDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SendData(_ sender: Any) {
        if (delegate != nil) {
            let information: String = dataTextField.text!
            delegate!.userDidEtnterInformation(info: information as NSString)
            
            self.navigationController?.popViewController(animated: true)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
