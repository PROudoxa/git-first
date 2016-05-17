//
//  ViewController.swift
//  firstApp
//
//  Created by Алексей on 13.05.16.
//  Copyright © 2016 Алексей. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let tipCalc = CalculatorModel(total: 33.25, taxPct: 0.06)
    
    func refreshUI() {
        totalTextField?.text = String(format: "%0.2f", tipCalc.total)
        taxPctSlider?.value = Float(tipCalc.taxPct) * 100.0
        taxPctLabel?.text = "Tax Percetage (\(Int((taxPctSlider?.value)!))!%)"
        resultsTextView?.text = ""
    }
    
    @IBOutlet var totalTextField: UITextField?
    @IBOutlet var taxPctSlider: UISlider?
    @IBOutlet var taxPctLabel: UILabel?
    @IBOutlet var resultsTextView: UITextView?
    
    @IBAction func calculateTapped(sender : AnyObject) {
        tipCalc.total = Double(((totalTextField?.text)! as NSString).doubleValue)
        let possibleTips = tipCalc.returnPossibleTips()
        var results = ""
        for (tipPct, tipValue) in possibleTips {
            results += "\(tipPct)%: \(tipValue)\n"
        }
        resultsTextView?.text = results
    }
    
    @IBAction func taxPercentageChanged(sender : AnyObject) {
        tipCalc.taxPct = Double((taxPctSlider?.value)!) / 100.0
        refreshUI()
    }
    
    @IBAction func viewTapped(sender : AnyObject) {
        totalTextField?.resignFirstResponder()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

