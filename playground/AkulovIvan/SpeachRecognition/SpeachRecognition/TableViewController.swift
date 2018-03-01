//
//  TableViewController.swift
//  SpeachRecognition
//
//  Created by Alex Voronov on 08.12.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let cellId = "Cell"
    let segueId = "showWordSegue"
    let words = [ ("hello", "he'lo, he'lo"),
                  ("think", "THiNGK"),
                  ("chemistry", "'kemestri"),
                  ("whole", "hol") ]

    var selectedWord = ("", "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = words[indexPath.row].0
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedWord = words[indexPath.row]
        //performSegue(withIdentifier: segueId, sender: nil)
        return indexPath
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueId {
            if let destinationVC = segue.destination as? WordViewController {
                destinationVC.word = selectedWord
            }
        }
    }
 

}
