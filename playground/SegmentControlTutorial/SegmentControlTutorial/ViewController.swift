//
//  ViewController.swift
//  SegmentControlTutorial
//
//  Created by Алексей on 25.05.16.
//  Copyright © 2016 Alex&V. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var thirdImage: UIImageView!
    
    @IBAction func indexChanged(sender: UISegmentedControl) {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            textLabel.text = "America has selected"
            firstView.hidden = true
            secondView.hidden = false
            thirdView.hidden = false
        case 1:
            textLabel.text = "Europe has selected"
            firstView.hidden = false
            secondView.hidden = true
            thirdView.hidden = false
        case 2:
            textLabel.text = "All countries have selected"
            firstView.hidden = false
            secondView.hidden = false
            thirdView.hidden = true
        default:    break
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Shows emblem image -----------
        let url: String? = "https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Lesser_Coat_of_Arms_of_Ukraine.svg/100px-Lesser_Coat_of_Arms_of_Ukraine.svg.png" // is waiting for the url from Resources
        if let a = url {
            let imgURL: NSURL? = NSURL(string: a)
            if let url2 = imgURL {
                let imgData: NSData? = NSData(contentsOfURL: url2)
                if let url3 = imgData {
                    firstImage.image = UIImage(data: url3)
                }
            }
        } // ----------------------------
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
