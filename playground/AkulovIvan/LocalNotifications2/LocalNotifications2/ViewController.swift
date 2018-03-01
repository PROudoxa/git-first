//
//  ViewController.swift
//  LocalNotifications2
//
//  Created by Alex Voronov on 29.01.18.
//  Copyright © 2018 Alex Voronov. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    let notificationIdentifier = "MyUniqueIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    func sheduleNotification(inSeconds seconds: TimeInterval, completion: (Bool) -> ()) {
        
        removeNotifications(withIdentifiers: [self.notificationIdentifier])
        
        let date = Date(timeIntervalSinceNow: seconds)
        print(Date())
        print(date)
        
        let content = UNMutableNotificationContent()
        content.title = "Title"
        content.subtitle = "Subtitle"
        content.body = "Body"
        content.badge = 1
        content.sound = UNNotificationSound.default()
        
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents([.month, .day, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        let request = UNNotificationRequest(identifier: self.notificationIdentifier, content: content, trigger: trigger)
        
        let center = UNUserNotificationCenter.current()
        center.add(request, withCompletionHandler: nil)
    }
    
    func removeNotifications(withIdentifiers identifiers: [String]) {
        let center = UNUserNotificationCenter.current()
        center.removePendingNotificationRequests(withIdentifiers: identifiers)
    }
    
    @IBAction func sendNotificationTapped(sender: UIButton) {
        sheduleNotification(inSeconds: 5) { (success) in
            success ? print("We sent it") : print("Failed")
        }
    }


    deinit {
        removeNotifications(withIdentifiers: [self.notificationIdentifier])
    }
}

