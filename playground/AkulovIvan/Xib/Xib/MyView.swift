//
//  MyView.swift
//  Xib
//
//  Created by Alex Voronov on 09.12.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

//@IBDesignable class MyView: UIView {
class MyView: UIView {

    @IBOutlet weak var myLabel: UILabel!

    @IBInspectable var textLabelText: String {
        get {
            if let text = myLabel.text {
                return text
            } else {
                return "DefaultLabelText"
            }
        }
        
        set(textLabelText) {
            myLabel.text = textLabelText
        }
    }
    
    var view: UIView!
    var nibName: String = "MyView"

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func loadFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return view
    }
    
    func setup() {
        view = loadFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(view)
    }
    
    
    
}
