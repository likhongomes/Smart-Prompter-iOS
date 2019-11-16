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
            
            //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
            let calendarTrigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
            let firstRequest = UNNotificationRequest(identifier: "Identifier", content: content, trigger: calendarTrigger)
            print("Notification 1 time \(dateComponents.minute!)")
            UNUserNotificationCenter.current().add(firstRequest) { (error) in
                print(error as Any)
            }
            
            
            var dateComponents2 = dateComponents
            dateComponents2.minute! += 1
            let calendarTrigger2 = UNCalendarNotificationTrigger(dateMatching: dateComponents2, repeats: true)
                    let firstRequest2 = UNNotificationRequest(identifier: "Identifier1", content: content, trigger: calendarTrigger2)
            print("Notification 2 time \(dateComponents2.minute!)")
            UNUserNotificationCenter.current().add(firstRequest2) { (error) in
                print(error as Any)
            }

            
            
            print("Scheduled Notification \(dateComponents.minute!)")
            
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
