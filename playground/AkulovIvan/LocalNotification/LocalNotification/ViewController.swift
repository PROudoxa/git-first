//
//  ViewController.swift
//  LocalNotification
//
//  Created by Alex Voronov on 29.12.17.
//  Copyright © 2017 Alex Voronov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sendNotification() {
        UIApplication.shared.applicationIconBadgeNumber += 1

        let notification = UILocalNotification()
        notification.alertTitle = "alert title"
        //notification.alertBody = "alert body"
        
if (textField.text == nil || textField.text == "") {
        notification.alertBody = "body"
} else {
    notification.alertBody = textField.text
}
        
        notification.alertAction = "run the app"
        notification.fireDate = NSDate(timeIntervalSinceNow: 5) as Date
        //UIApplication.sharedApplication.sheduleLocalNotification(notification)
        UIApplication.shared.scheduledLocalNotifications?.append(notification)
    }

    @IBAction func sendNotificationPressed(_ sender: UIButton) {
        sendNotification()
        print("notification will appear in 5 seconds")
    }

}

