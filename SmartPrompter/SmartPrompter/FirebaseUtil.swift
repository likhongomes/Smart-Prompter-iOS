//
//  FirebaseUtil.swift
//  SmartPrompter
//
//  Created by Likhon Gomes on 11/11/19.
//  Copyright © 2019 Likhon Gomes. All rights reserved.
//

import Foundation
import Firebase

class FirebaseUtil {
    
    
    /// Fetch one particular firebase object using the given firebase ID. Returns a single alarm
    /// - Parameter firebaseID: The id of the element trying to fetch from firebase
    func fetchOneObject(firebaseID:String) -> Alarm {
        let singleAlarm = Alarm()
        let userID = Auth.auth().currentUser?.uid
        ref.child("Patients").child(userID!).child("Alarms").child("\(firebaseID)").observe(DataEventType.value) { (snapshot) in
        
          let value = snapshot.value as? NSDictionary
            
            singleAlarm.firebaseID = snapshot.key
            singleAlarm.active = value?["active"] as? Bool
            singleAlarm.hour = value?["scheduledHour"] as? Int
            singleAlarm.minute = value?["scheduledMinute"] as? Int
            singleAlarm.label = value?["label"] as? String
            
            
            if(singleAlarm.active == true){
                activeAlarm.append(singleAlarm)
            }
            
            var dateComponents = DateComponents()
            dateComponents.hour = singleAlarm.hour
            dateComponents.minute = singleAlarm.minute
            let scheduler = AlarmScheduler()
            scheduler.scheduleNotification(title: singleAlarm.label!, dateComponents: dateComponents, id:singleAlarm.firebaseID!)

            print("Printing snapshot \(snapshot)")

          }
        return singleAlarm
    }
        

    
    
    
}

