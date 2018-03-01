//
//  View.swift
//  MaskDemo
//
//  Created by Alex Voronov on 26.02.18.
//  Copyright © 2018 Alex Voronov. All rights reserved.
//

import UIKit

@IBDesignable
class View: UIView {
    
    private var size = CGSize()
    @IBInspectable var cornerRadiiSize: CGFloat = 0 {
        didSet {
            size = CGSize(width: cornerRadiiSize, height: cornerRadiiSize)
        }
    }
    
    override func prepareForInterfaceBuilder() {
        setNeedsLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .bottomRight], cornerRadii: size).cgPath
        layer.mask = shapeLayer
    }

}
