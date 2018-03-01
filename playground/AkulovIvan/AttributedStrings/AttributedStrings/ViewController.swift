//
//  ViewController.swift
//  AttributedStrings
//
//  Created by Alex Voronov on 03.01.18.
//  Copyright © 2018 Alex Voronov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var textView: UITextView! {
        didSet {
            textView.delegate = self
        }
    }
    
    @IBOutlet weak var label: UILabel!
    

    func textViewDidChangeSelection(_ textView: UITextView) {
        //let font = UIFont.systemFont(ofSize: 20, weight: 0.6)
        let font = UIFont(name: "DevanagariSangamMN", size: 17)?.italic()
        
        let color = UIColor(red: 0.362, green: 0.871, blue: 0.802, alpha: 1.0)
        let attributes = [NSFontAttributeName: font, NSBackgroundColorAttributeName: color]
        let attributedString = NSMutableAttributedString(string: textView.text)
        attributedString.addAttributes(attributes, range: textView.selectedRange)
        
        label.attributedText = attributedString
    }

}

extension UIFont {
    
    func withTraits(traits: UIFontDescriptorSymbolicTraits) -> UIFont {
        let descriptor = fontDescriptor.withSymbolicTraits(traits)
        return UIFont(descriptor: descriptor!, size: 0) //crashs the app if font does not have appropriate attribute
    }
    
    func bold() -> UIFont {
        return withTraits(traits: .traitBold)
    }
    
    func italic() -> UIFont {
        return withTraits(traits: .traitItalic)
    }
}
