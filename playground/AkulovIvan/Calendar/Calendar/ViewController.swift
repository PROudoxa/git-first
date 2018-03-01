//
//  ViewController.swift
//  Calendar
//
//  Created by Alex Voronov on 22.02.18.
//  Copyright © 2018 Alex Voronov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dayTF: UITextField!
    @IBOutlet weak var monthTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func getToKnowTapped(_ sender: UIButton) {
        
        guard let dayInt = Int(dayTF.text!), let monthInt = Int(monthTF.text!), let yearInt = Int(yearTF.text!) else { return }
        
        guard 1 <= dayInt, dayInt <= 31,
              1 <= monthInt, monthInt <= 12,
              1900 <= yearInt, yearInt < 3000       else {
            
            showAlertAndChangeResultLabel(title: "Error", message: "Please retype data")
            return
        }
        
        var dateComponents = DateComponents()
        //dateComponents.day = dayInt
        dateComponents.month = monthInt
        dateComponents.year = yearInt
        
        let calendar = Calendar.current
        
        var date = calendar.date(from: dateComponents)
        
        guard date != nil else { return }
        
        let rangeOfDays = calendar.range(of: .day, in: .month, for: date!)
        if dayInt > (rangeOfDays?.count)! {
            showAlertAndChangeResultLabel(title: "Sorry", message: "There are less days in this month")

        } else {
            dateComponents.day = dayInt
            date = calendar.date(from: dateComponents)!
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE"
            
            let dayOfWeek = dateFormatter.string(from: date!)
            
            resultLabel.text = dayOfWeek
        }
        
    }
    
    func showAlertAndChangeResultLabel(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .cancel)
        alertController.addAction(ok)
        present(alertController, animated: true)
        
        resultLabel.text = "- - - -"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

