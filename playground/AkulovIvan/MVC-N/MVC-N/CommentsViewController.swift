//
//  ViewController.swift
//  MVC-N
//
//  Created by Alex Voronov on 19.12.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var comments = [Comment]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CommentNetworkService.getComments { (response) in
            self.comments = response.comments
            self.tableView.reloadData()
        }
        
//        NetworkService.shared.getData { (json) in
//            
//        }
    }

}

extension CommentsViewController: UITableViewDelegate {}

extension CommentsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CommentCell
        let comment = comments[indexPath.row]
        cell.configure(with: comment)
        
        //cell.textLabel?.text = "row " + String(indexPath.row)
        //cell.backgroundColor = UIColor.orange
        
        return cell
    }

}

