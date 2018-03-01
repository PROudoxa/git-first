//
//  TableViewController.swift
//  SpellChaker
//
//  Created by Alex Voronov on 06.12.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let wordVariations = ["магозин", "могозин", "магазин", "магазен"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return wordVariations.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = wordVariations[indexPath.row]
        cell.textLabel?.backgroundColor = UIColor.clear

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        
        if ifWordCorrect(word: (cell?.textLabel?.text)!) {
            cell?.backgroundColor = UIColor.green
        } else {
            cell?.backgroundColor = UIColor.red
        }
        tableView.reloadData()
    }
    
    func ifWordCorrect(word: String) -> Bool {
        
        let textChecker = UITextChecker()
        let checkRange = NSMakeRange(0, word.characters.count)
        let stringRange = textChecker.rangeOfMisspelledWord(in: word, range: checkRange, startingAt: 0, wrap: true, language: "ru")
        
        return stringRange.location == NSNotFound
    }
    
}
