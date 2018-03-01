//
//  Button.swift
//  DesignableButton
//
//  Created by Alex Voronov on 22.11.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

@IBDesignable

class Button: UIButton {

    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }

    @IBInspectable var borderRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = borderRadius
        }
    }

    @IBInspectable var shadowOffSet: CGSize = CGSize() {
        didSet {
            self.layer.shadowOffset = shadowOffSet
        }
    }

    @IBInspectable var shadowOpacity: Float = 0.0 {
        didSet {
            self.layer.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 0.0 {
        didSet {
            self.layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable var shadowColor: UIColor = .clear {
        didSet {
            self.layer.shadowColor = shadowColor.cgColor
        }
    }
}
