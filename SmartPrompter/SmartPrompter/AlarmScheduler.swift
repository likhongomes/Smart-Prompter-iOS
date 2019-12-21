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
            
            
            
//            let calendarTrigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
//            let firstRequest = UNNotificationRequest(identifier: "Identifier", content: content, trigger: calendarTrigger)
//            UNUserNotificationCenter.current().add(firstRequest) { (error) in
//                print("Notification Report \(error?.localizedDescription)")
//            }

            
            UNUserNotificationCenter.current().getDeliveredNotifications { (notifications) in
                print(notifications)
            }
            
            var x = 0
            var dateComponents2 = dateComponents
            while (x<5){
                print("first time \(dateComponents.hour):\(dateComponents.minute) second time \(dateComponents2.hour):\(dateComponents2.minute)")
                let calendarTrigger2 = UNCalendarNotificationTrigger(dateMatching: dateComponents2, repeats: true)
                let repeatRequest = UNNotificationRequest(identifier: "\(content.userInfo["title"]!)\(x)", content: content, trigger: calendarTrigger2)
                
                UNUserNotificationCenter.current().add(repeatRequest) { (error) in
                    print("Notification Report \(error?.localizedDescription)")
                }
                dateComponents2.addAMinute()
                x += 1
            }

            

        } else {
            // Fallback on earlier versions
            print("Notifcation not pushed")
        }
        
    }

}
