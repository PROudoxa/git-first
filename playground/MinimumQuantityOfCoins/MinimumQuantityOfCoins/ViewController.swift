//
//  ViewController.swift
//  MinimumQuantityOfCoins
//
//  Created by Alex Voronov on 08.09.16.
//  Copyright © 2016 Alex&V. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
   @IBOutlet weak var quantityDollarsLabel: UILabel!
   @IBOutlet weak var sumTextField: UITextField!
   @IBOutlet weak var quantityCentsLabel: UILabel!
   @IBOutlet weak var quantityCoinsLabel: UILabel!
   @IBOutlet weak var coinsListLabel: UILabel!
   @IBOutlet weak var resultsTextVie: UITextView!
   
   var coinsCounter: Int8 = 0
   let coinsValues: [Int8] = [50, 25, 10, 5, 2, 1]
   var dropValue = true
   var dotIsPlaced = false
   
   let minCoins = MinimumQuantityOfCoins(sum: 38.32)

   override func viewDidLoad() {
      super.viewDidLoad()
      sumTextField.addTarget(self, action: #selector(ViewController.textFieldTouchDown), for: UIControlEvents.touchDown)
      sumTextField.addTarget(self, action: #selector(ViewController.textFieldAllEditingEvents), for: UIControlEvents.allEditingEvents)

      refresh()
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
   }
   
   func textFieldTouchDown() {
      if dropValue {
         sumTextField.text = ""
         sumTextField.placeholder = "0"
      }
   }
   
   func textFieldAllEditingEvents() {
      dropValue = false
   }
   
   func refresh() {
      sumTextField.text = ""
      sumTextField.placeholder = "type sum here..."
      quantityDollarsLabel.text = ".. dollars"
      quantityCentsLabel.text = ".. cents"
      quantityCoinsLabel.text = ".. coins"
      coinsListLabel.text = "used coins (.. , .., ...)"
      resultsTextVie.text = "Dollars: __\nCents: __\nCoins: __\nUsed coins: __"
   }

   @IBAction func computeButton(_ sender: UIButton) {
      minCoins.sum = Float((sumTextField.text! as NSString).floatValue)
      minCoins.checkSum()
      minCoins.countsDollars()
      quantityDollarsLabel.text = ("\(minCoins.dollars) dollars")
      quantityCentsLabel.text = "\(minCoins.cents) cents"
      minCoins.countsMinimum(minCoins.rest)
      quantityCoinsLabel.text = "\(minCoins.coinsCounter) items was used"
      coinsListLabel.text = "Coins: \(minCoins.usedCoins)"
      resultsTextVie.text = "Dollars: \(minCoins.dollars)\nCents: \(minCoins.cents)\nCoins: \(minCoins.coinsCounter)\nUsed coins: \(minCoins.usedCoins)"
      //sumTextField.text = ""
      sumTextField.endEditing(true)
      dropValue = true
   }
   
   @IBAction func viewTapped(_ sender: AnyObject) {
      let restore = dropValue
      sumTextField.resignFirstResponder()
      dropValue = restore
   }

}

