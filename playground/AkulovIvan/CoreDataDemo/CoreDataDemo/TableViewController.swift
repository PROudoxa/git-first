//
//  TableViewController.swift
//  CoreDataDemo
//
//  Created by Alex Voronov on 20.12.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    
    var toDoItems: [Task] = []

    @IBAction func addTask(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add task",  message: "you can add task here", preferredStyle: UIAlertControllerStyle.alert)
        
        let ok = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default) { action in
            let textField = alert.textFields?[0]
            self.saveTask(taskToDo: (textField?.text)!)
            //self.toDoItems.insert((textField?.text)!, at: 0)
            self.tableView.reloadData()
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil)
        alert.addTextField { textField in
        }

        alert.addAction(ok)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    func saveTask(taskToDo: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Task", in: context)
        
        let taskObject = NSManagedObject(entity: entity!, insertInto: context) as! Task
        taskObject.taskToDo = taskToDo
        
        do {
            try context.save()
            //toDoItems.insert(taskObject, at: 0)
            toDoItems.append(taskObject)
            print("Saved!")
        } catch {
            print(error.localizedDescription)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        
        do {
            toDoItems = try context.fetch(fetchRequest)
        } catch {
            print(error.localizedDescription)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.singleLineEtched
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let task = toDoItems[indexPath.row]
        cell.textLabel?.text = task.taskToDo

        return cell
    }

}
