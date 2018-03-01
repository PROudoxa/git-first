//
//  ViewController.swift
//  SwipeCell
//
//  Created by Alex Voronov on 03.01.18.
//  Copyright © 2018 Alex Voronov. All rights reserved.
//

import UIKit
import SWTableViewCell

class TableViewController: UITableViewController, SWTableViewCellDelegate {
    
    var lub: NSMutableArray = [] // leftUtilityButtons
    var rub: NSMutableArray = [] // rightUtilityButtons
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func fillArrays() {
        let _rub = NSMutableArray()
        _rub.sw_addUtilityButton(with: .red, title: "Red")
        _rub.sw_addUtilityButton(with: .orange, title: "Orange")
        rub = _rub
        
        let _lub = NSMutableArray()
        _lub.sw_addUtilityButton(with: .green, title: "green")
        _lub.sw_addUtilityButton(with: .blue, title: "blue")
        lub = _lub
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SWTableViewCell

        fillArrays()
        cell.leftUtilityButtons = lub as [AnyObject]
        cell.rightUtilityButtons = rub as [AnyObject]
        cell.delegate = self
        
        cell.textLabel?.text = "This is cell at \(indexPath.row) row"
        if indexPath.row == 3 {
            cell.showRightUtilityButtons(animated: true)
        } else if indexPath.row == 5 {
            cell.showLeftUtilityButtons(animated: true)
        }
        return cell
    }
    
    func swipeableTableViewCell(_ cell: SWTableViewCell!, didTriggerLeftUtilityButtonWith index: Int) {
        switch index {
            case 0:  print("0L")
            case 1:  print("1L")
            default: print("default left")
        }
    }
    
    func swipeableTableViewCell(_ cell: SWTableViewCell!, didTriggerRightUtilityButtonWith index: Int) {
        switch index {
            case 0:  print("0R")
            case 1:  print("1R")
            default: print("default right")
        }
    }
    
    func swipeableTableViewCell(_ cell: SWTableViewCell!, scrollingTo state: SWCellState) {
        let swipe = state.rawValue == 1 ? "left" : "right"
        print(swipe)
    }
    
//    func swipeableTableViewCellShouldHideUtilityButtons(onSwipe cell: SWTableViewCell!) -> Bool {
//        let ss = cell.index(ofAccessibilityElement: 3)
//        print(ss)
//        
//        if ss == 9223372036854775807 {
//            return true
//        }
//        return false
//    }
    
    func swipeableTableViewCell(_ cell: SWTableViewCell!, canSwipeTo state: SWCellState) -> Bool {
//        if state.rawValue == 1 {
//            return false
//        }
        return true
    }
    
    func swipeableTableViewCellDidEndScrolling(_ cell: SWTableViewCell!) {
        print("swipeableTableViewCellDidEndScrolling")
    }

}


//extension TableViewController: SWTableViewCellDelegate {
//    
//}

