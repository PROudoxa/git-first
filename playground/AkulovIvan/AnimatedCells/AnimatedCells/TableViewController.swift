//
//  TableViewController.swift
//  AnimatedCells
//
//  Created by Alex Voronov on 18.12.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let array = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = array[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        /* variant 1
        let degree: Double = 90
        let rotationAngle = CGFloat(degree * M_PI / 180)
        let rotationTransform = CATransform3DMakeRotation(rotationAngle, 0, 1, 0)
        cell.layer.transform = rotationTransform
        
        UIView.animate(withDuration: 1 * Double(indexPath.row / 2), delay: 0.2 * Double(indexPath.row), options: .curveEaseInOut, animations: {
            cell.layer.transform = CATransform3DIdentity
        })
         */
        
//        /* variant 2
        let translation = CATransform3DTranslate(CATransform3DIdentity, -500, 400, 0)
        cell.layer.transform = translation
        
        UIView.animate(withDuration: 2, delay: 0.2 * Double(indexPath.row), options: .curveEaseInOut, animations: {
          cell.layer.transform = CATransform3DIdentity
        })
//         */
    }
}
