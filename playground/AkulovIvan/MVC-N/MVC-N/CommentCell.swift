//
//  CommentCell.swift
//  MVC-N
//
//  Created by Alex Voronov on 19.12.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit


class CommentCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    func configure(with comment: Comment) {
        self.label.text = comment.name
        self.textView.text = comment.body
    }
}
