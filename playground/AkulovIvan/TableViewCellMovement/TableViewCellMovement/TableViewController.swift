//
//  TableViewController.swift
//  TableViewCellMovement
//
//  Created by Alex Voronov on 14.12.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var array = ["first row", "second row", "third row", "fourth row", "fifth row", "sixth row"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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

    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let elementToMove = array[fromIndexPath.row]
        array.remove(at: fromIndexPath.row)
        array.insert(elementToMove, at: to.row)
        print(array)
    }

    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    @IBAction func editTapped(_ sender: UIBarButtonItem) {
        self.isEditing = true //!self.isEditing
    }
}
