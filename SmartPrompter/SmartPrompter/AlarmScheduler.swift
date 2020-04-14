//
//  AlarmScheduler.swift
//  SmartPrompter
//
//  Created by Likhon Gomes on 11/11/19.
//  Copyright © 2019 Likhon Gomes. All rights reserved.
//

import Foundation
import NotificationCenter

///Alarm scheduling class to schedule alarm
class AlarmScheduler {
    
    /// Function to schedule alarm for the first time after doanloaded from Firebase. Simply call this function and it will push the alarm to the OS notification center
    /// - Parameters:
    ///   - title: alarm identifier string
    ///   - dateComponents: The date of the alarm when it should be triggered
    ///   - id: Firebase ID fetched from firebase just tracking the alarm data
    func scheduleNotification(title:String, dateComponents:DateComponents, id:String?) {
        if #available(iOS 10.0, *) {
            let content = UNMutableNotificationContent()
            content.title = title
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
    
    
    /// Reschedule alam once the the alarm is delayed
    /// - Parameters:
    ///   - title: alarm identifier string
    ///   - id: Firebase ID fetched from firebase just tracking the alarm data
    public func rescheduleNotification(title:String, id:String?){
        
        var x = 0
        while (x<5){
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["\(title)\(x)"])
            UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: ["\(title)\(x)"])
            print("cancelling notification \(title)\(x)")
            x+=1
        }
        
        
        if #available(iOS 10.0, *) {
            let content = UNMutableNotificationContent()
            content.title = title
            content.categoryIdentifier = "alarm"
            content.sound = UNNotificationSound.default
            content.badge = 1
            content.sound = UNNotificationSound.init(named: UNNotificationSoundName(rawValue: "recording.m4a"))

            
            var x = 0
            while(x<5){
                let time = TimeInterval((5+x)*60)
                print("time \(time)")
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: false)
                let request = UNNotificationRequest(identifier: "delayedAlarm\(x)", content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request) { (error) in
                    if(error?.localizedDescription != nil){
                        print("Pushed notification \(content.title)\(x)")
                    }
                }
                
                x += 1
            }
            
            
            
        }
        
    }
    
    
    /// Request OS to remove notification from pending list and clear the notification list already delivered
    /// - Parameter title: Alarm identifier string
    func clearNotifications(title:String){
        var x = 0
        while (x<5){
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["\(title)\(x)"])
            UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: ["\(title)\(x)"])
            print("cancelling notification \(title)\(x)")
            x+=1
        }
    }

}
