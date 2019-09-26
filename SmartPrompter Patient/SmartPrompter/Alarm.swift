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
    var active:Int?
    
    func encode(to container: inout PersistenceContainer) {
        container["label"] = label
        container["date"] = date
        container["time"] = time
        container["active"] = active
    }
    
    init(){}
    
    init(label:String, date:String, time:String, active:Int) {
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
                t.column("active", .integer).notNull()
                print("alarm table created")
            }
        }
    }
    
    func insert(user:Alarm) {
        try! dbQueue.write { db in
            try! user.insert(db)
        }
    }
    
    func getAll() -> [Alarm] {
        
        //    let dbQueue = try! DatabaseQueue(path: pathToDatabase.absoluteString)
        var allAlarm = [Alarm]()
        try! dbQueue.read { db in
            allAlarm = try! Alarm.fetchAll(db)
            sleep(1)
        }
        return allAlarm
    }
    
    func getActiveAlarms() -> [Alarm] {
        var presenters = Array<Alarm>()
        try! dbQueue.read { db in
            presenters = try Alarm.fetchAll(db, sql: "SELECT * FROM Alarm WHERE active = ?", arguments: [1])
        }
        return presenters
    }
    
    func getInactiveAlarms() -> [Alarm] {
        var presenters = Array<Alarm>()
        try! dbQueue.read { db in
            presenters = try Alarm.fetchAll(db, sql: "SELECT * FROM Alarm WHERE active = ?", arguments: [0])
        }
        return presenters
    }
    
}
