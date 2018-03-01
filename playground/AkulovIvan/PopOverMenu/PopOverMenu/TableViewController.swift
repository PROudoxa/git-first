//
//  TableViewController.swift
//  PopOverMenu
//
//  Created by Alex Voronov on 23.01.18.
//  Copyright © 2018 Alex Voronov. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {


    let arr = ["first", "second", "third", "fourth", "fifth", "sixth", "seventh"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.isScrollEnabled = false
    }
    
    override func viewWillLayoutSubviews() {
        preferredContentSize = CGSize(width: 250, height: tableView.contentSize.height)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = arr[indexPath.row]
        
        return cell
    }

}
