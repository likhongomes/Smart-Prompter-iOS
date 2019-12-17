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
            
            var dateComponents2 = dateComponents
            dateComponents2.addAMinute()
            print("first time \(dateComponents.hour):\(dateComponents.minute) second time \(dateComponents2.hour):\(dateComponents2.minute)")
            let calendarTrigger2 = UNCalendarNotificationTrigger(dateMatching: dateComponents2, repeats: true)
            
            let firstRequest = UNNotificationRequest(identifier: "Identifier", content: content, trigger: calendarTrigger)
            let repeatRequest = UNNotificationRequest(identifier: "repeatAlarm", content: content, trigger: calendarTrigger2)
    
            UNUserNotificationCenter.current().add(firstRequest) { (error) in
                print("Notification Report \(error?.localizedDescription)")
            }
            
            UNUserNotificationCenter.current().add(repeatRequest) { (error) in
                print("Notification Report \(error?.localizedDescription)")
            }
            
            UNUserNotificationCenter.current().getDeliveredNotifications { (notifications) in
                print(notifications)
            }
            

        } else {
            // Fallback on earlier versions
            print("Notifcation not pushed")
        }
        
    }

}
