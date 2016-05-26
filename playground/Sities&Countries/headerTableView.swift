//
//  headerTableView.swift
//  Sities&Countries
//
//  Created by Алексей on 26.05.16.
//  Copyright © 2016 Alex&V. All rights reserved.
//

import UIKit

class HeaderSegment: UIView {
    
    var toGetResources: Resources? = nil
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    var referanceOnTableView: UITableView? = nil
    
    @IBAction func indexChanged(sender: UISegmentedControl) {
        switch segmentControl.selectedSegmentIndex {
            case 0:
                textLabel.text = "America has selected"
                toGetResources = ResourcesAmerica()
                referanceOnTableView?.reloadData()
                print("america")

            case 1:
                textLabel.text = "Europe has selected"
                toGetResources = ResourcesEurope()
                referanceOnTableView?.reloadData()
                print("europe")

//            case 2:
//                textLabel.text = "All countries have selected"
            // склеить два массива и присвоить ссылку.
                default:    break
        }
    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "ViewForSegment", bundle: nil).instantiateWithOwner(nil, options: nil)[0] as! UIView
    }
    

    
}

