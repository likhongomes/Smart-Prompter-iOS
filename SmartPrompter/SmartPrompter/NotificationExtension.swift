//
//  NotificationExtension.swift
//  SmartPrompter
//
//  Created by Likhon Gomes on 10/28/19.
//  Copyright © 2019 Likhon Gomes. All rights reserved.
//

import Foundation
import UserNotifications

class NotificationData: UNMutableNotificationContent{
    var alarmID = String()
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init() {
        super.init()
    }
}
