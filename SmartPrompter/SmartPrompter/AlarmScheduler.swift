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
        if #available(iOS 10.0, *) {
            let content = UNMutableNotificationContent()
            content.title = title
            //content.subtitle = "Water the dog"
            //content.body = "Body"
            content.categoryIdentifier = "alarm"
            content.sound = UNNotificationSound.default
            content.badge = 1
            content.sound = UNNotificationSound.init(named: UNNotificationSoundName(rawValue: "recording.m4a"))
            content.userInfo = ["FirebaseID":id,"title":title, "hour":dateComponents.hour, "minute":dateComponents.minute,"day":dateComponents.day,"month":dateComponents.month,"year":dateComponents.year]
            
            UNUserNotificationCenter.current().getDeliveredNotifications { (notifications) in
                print(notifications)
            }
            var x = 0
            var dateComponents2 = dateComponents
            while (x<5){
                print("first time \(dateComponents.hour):\(dateComponents.minute) second time \(dateComponents2.hour):\(dateComponents2.minute)")
                let calendarTrigger2 = UNCalendarNotificationTrigger(dateMatching: dateComponents2, repeats: false)
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
    
    func scheduleIntervalNotification(title:String, id:String?){
        
        if #available(iOS 10.0, *) {
            let content = UNMutableNotificationContent()
            content.title = title
            content.categoryIdentifier = "alarm"
            content.sound = UNNotificationSound.default
            content.badge = 1
            content.userInfo = ["FirebaseID":id,"title":title]
            
            
            
            
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: (5*60), repeats: false)
            let request = UNNotificationRequest(identifier: "delayedAlarm", content: content, trigger: trigger)
            
            //let calendarTrigger2 =
            //let repeatRequest = UNNotificationRequest(identifier: "\(content.userInfo["title"]!)\(x)", content: content, trigger: calendarTrigger2)
            
            UNUserNotificationCenter.current().add(request) { (error) in
                if(error?.localizedDescription != nil){
                    print("Pushed notification \(content.title)")
                }
                //print("Notification Report \(error?.localizedDescription)")
            }
            
        }
        
    }

}
