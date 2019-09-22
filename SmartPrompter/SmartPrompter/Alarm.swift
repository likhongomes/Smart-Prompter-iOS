//
//  Alarm.swift
//  SmartPrompter
//
//  Created by Likhon Gomes on 9/19/19.
//  Copyright © 2019 Likhon Gomes. All rights reserved.
//

import Foundation
import GRDB

class Alarm: PersistableRecord, Codable, FetchableRecord {
    
    var id:Int?
    var label:String?
    var date:String?
    var time:String?
    var active:Bool?
    
    func encode(to container: inout PersistenceContainer) {
        container["label"] = label
        container["date"] = date
        container["time"] = time
        container["active"] = active
    }
    
    init(){}
    
    init(label:String, date:String, time:String, active:Bool) {
        self.label = label
        self.date = date
        self.time = time
        self.active = active
    }
}

class AlarmDB{
    
    init() {
        _ = try! dbQueue.write { db in
            // Create database table
            try db.create(table: "Alarm", ifNotExists: true) { t in
                t.autoIncrementedPrimaryKey("id")
                t.column("label", .text).notNull()
                t.column("date", .date).notNull()
                t.column("time", .datetime).notNull()
                t.column("active", .boolean).notNull()
                print("alarm table created")
            }
        }
    }
}
