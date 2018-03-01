//
//  ViewController.swift
//  TableInViewController
//
//  Created by Alex Voronov on 15.12.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyNotesLabel: UILabel!
    
    var notes: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkIfEmptyNotesAndSetLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addNoteTapped(_ sender: UIBarButtonItem) {
        addNote()
        tableView.reloadData()
    }
    
    func addNote() {
        notes.append("note \(notes.count + 1)")
        checkIfEmptyNotesAndSetLabel()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell")! as UITableViewCell
        cell.textLabel?.text = notes[indexPath.row]
        
        return cell
    }
    
    func checkIfEmptyNotesAndSetLabel() {
        notes.isEmpty ? (emptyNotesLabel.isHidden = false) : (emptyNotesLabel.isHidden = true)
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        deleteNote(at: indexPath.row)
        tableView.reloadData()
    }
    
    func deleteNote(at index: Int) {
        notes.remove(at: index)
        checkIfEmptyNotesAndSetLabel()
    }

}

