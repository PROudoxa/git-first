//
//  TableViewController.swift
//  ReadFromFile
//
//  Created by Alex Voronov on 18.12.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var textArray = [String()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        readFromFile()
    }
    
    func readFromFile() {
        if let path = Bundle.main.path(forResource: "text", ofType: "txt") {
            if let text = try? String(contentsOfFile: path) {
                textArray = text.components(separatedBy: "\n\n")
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "cell number \(indexPath.row)"

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationVC = segue.destination as! ViewController
                destinationVC.textForTextView = textArray[indexPath.row]
            }
        }
    }

}
