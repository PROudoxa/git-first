//
//  headerTableView.swift
//  Sities&Countries
//
//  Created by Алексей on 26.05.16.
//  Copyright © 2016 Alex&V. All rights reserved.
//

import UIKit

class HeaderSegment: UIView {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBAction func indexChanged(sender: UISegmentedControl) {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            textLabel.text = "America has selected"
        case 1:
            textLabel.text = "Europe has selected"
        case 2:
            textLabel.text = "All countries have selected"
        default:    break
        }
    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "ViewForSegment", bundle: nil).instantiateWithOwner(nil, options: nil)[0] as! UIView
    }
    

    
}

