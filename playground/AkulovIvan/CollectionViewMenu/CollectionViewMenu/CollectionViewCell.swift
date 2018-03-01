//
//  CollectionViewCell.swift
//  CollectionViewMenu
//
//  Created by Alex Voronov on 01.12.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor =  isHighlighted ? #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            label.textColor =  isHighlighted ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupViews() {
        addSubview(label)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": label]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": label]))
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 5
        layer.masksToBounds = true
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
