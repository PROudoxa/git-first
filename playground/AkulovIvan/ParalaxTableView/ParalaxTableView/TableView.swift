//
//  TableView.swift
//  ParalaxTableView
//
//  Created by Alex Voronov on 29.11.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class TableView: UITableView {

    @IBOutlet weak var heightConstraint: NSLayoutConstraint!

    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let header = tableHeaderView else { return }
        
        let offsetY = -contentOffset.y
        //print(offsetY)
        heightConstraint.constant = max(header.bounds.height, header.bounds.height + offsetY)
    }

}
