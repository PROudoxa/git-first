//
//  TableViewController.swift
//  NavigationBar
//
//  Created by Alex Voronov on 07.12.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setupNavigationBar() {
        //navigationController?.navigationBar.prefersLargeTitles = true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = indexPath.row.description + " row"
        return cell
    }
    
    var titleForLabelViewController = "title"
    var selectedCellIndexPath: IndexPath?
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        let ss = tableView.cellForRow(at: indexPath)?.textLabel?.text
        titleForLabelViewController = "\(String(describing: ss))"
        selectedCellIndexPath = indexPath
        return indexPath
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SecondVC" {
            let destinationVC = segue.destination as! ViewController
            let cellTitle = tableView.cellForRow(at: selectedCellIndexPath!)?.textLabel?.text
            destinationVC.labelText = cellTitle ?? titleForLabelViewController
            //destinationVC.labelText = titleForLabelViewController
        }
    }

}
