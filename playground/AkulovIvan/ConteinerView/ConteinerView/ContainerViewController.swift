//
//  ConteinerViewController.swift
//  ConteinerView
//
//  Created by Alex Voronov on 24.01.18.
//  Copyright © 2018 Alex Voronov. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    var vc : UIViewController!
    var segueIdentifier : String!
    var lastViewController: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segueIdentifierReceivedFromParent(button: "buttonOne")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func segueIdentifierReceivedFromParent(button: String){
        if button == "buttonTwo"
        {
            
            self.segueIdentifier = "first"
            self.performSegue(withIdentifier: self.segueIdentifier, sender: nil)
            
        }
        else if button == "buttonOne"
        {
            
            self.segueIdentifier = "second"
            self.performSegue(withIdentifier: self.segueIdentifier, sender: nil)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier{
            //Avoids creation of a stack of view controllers
            if lastViewController != nil{
                lastViewController.view.removeFromSuperview()
            }
            //Adds View Controller to Container "first" or "second"
            vc = segue.destination
            self.addChildViewController(vc)
            vc.view.frame = CGRect(x: 0,y: 0, width: self.view.frame.width,height: self.view.frame.height)
            self.view.addSubview(vc.view)
            vc.didMove(toParentViewController: self)
            lastViewController = vc
            
        }
    }

}
