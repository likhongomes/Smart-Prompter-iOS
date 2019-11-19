//
//  AlarmScheduler.swift
//  SmartPrompter
//
//  Created by Likhon Gomes on 11/11/19.
//  Copyright © 2019 Likhon Gomes. All rights reserved.
//

import Foundation
import NotificationCenter


class AlarmScheduler {
    func scheduleNotification(title:String, dateComponents:DateComponents, id:String?) {
        
        //print("In the notif function")
        
        if #available(iOS 10.0, *) {
            let content = UNMutableNotificationContent()
            content.title = title
            //content.subtitle = "Water the dog"
            //content.body = "Body"
            content.categoryIdentifier = "alarm"
            content.sound = UNNotificationSound.default
            content.badge = 1
            content.userInfo = ["FirebaseID":id,"title":title, "hour":dateComponents.hour, "minute":dateComponents.minute,"day":dateComponents.day,"month":dateComponents.month,"year":dateComponents.year]
            
            //var dateComponents = DateComponents()
            //dateComponents.hour = 19
            //dateComponents.minute = 24
            print("scheduled alarm time \(dateComponents.hour) \(dateComponents.minute)")
            //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
            let calendarTrigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
            let intervalTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
            let firstRequest = UNNotificationRequest(identifier: "Identifier", content: content, trigger: calendarTrigger)
            let repeatRequest = UNNotificationRequest(identifier: "repeatAlarm", content: content, trigger: intervalTrigger)
    
            UNUserNotificationCenter.current().add(firstRequest) { (error) in
                print("Notification Report \(error as Any)")
            }
            
            UNUserNotificationCenter.current().getDeliveredNotifications { (notifications) in
                print(notifications)
            }
            
            /*
            UNUserNotificationCenter.current().add(repeatRequest) { (error) in
                print(error as Any)
            }*/

            //print("notification pushed")

        } else {
            // Fallback on earlier versions
            print("Notifcation not pushed")
        }
        
    }

}
