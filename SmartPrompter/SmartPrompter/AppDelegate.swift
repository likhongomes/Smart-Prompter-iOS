//
//  AppDelegate.swift
//  SmartPrompter
//
//  Created by Likhon Gomes on 9/5/19.
//  Copyright © 2019 Likhon Gomes. All rights reserved.
//

import UIKit
import GRDB
import CoreData
import UserNotifications
import Firebase
import FirebaseDatabase
import FirebaseAnalytics
import FirebaseStorage

var dbQueue: DatabaseQueue!
let alarmDB = AlarmDB()
var activeAlarm = [Alarm]()
var inactiveAlarm = [Alarm]()
var ref: DatabaseReference!
let userID = Auth.auth().currentUser?.uid
let scheduler = AlarmScheduler()
let fUtil = FirebaseUtil()


var totalTask = Double()
var completedTask = Double()



@available(iOS 10.0, *)
@UIApplicationMain
/// Main fuction of the whole app, it decides which viewcontroller to present firstt when the app launches. Checks wether the user is logged and presents viewcontroller based on that
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?
    //var dbQueue: DatabaseQueue!
    //let alarmDB = AlarmDB()
    
    //let notificationCenter = UNUserNotificationCenter.current()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        completedTask = 0
        totalTask = 0
        UNUserNotificationCenter.current().delegate = self
        
        FirebaseApp.configure()
        ref = Database.database().reference()
        try! setupDatabase(application)
        activeAlarm = alarmDB.getActiveAlarms()
        inactiveAlarm = alarmDB.getInactiveAlarms()
        print("activeAlarm Count \(activeAlarm.count)")
        
        window = UIWindow(frame: UIScreen.main.bounds)
        //let rootView = ViewController()
        
        if Auth.auth().currentUser != nil {
          self.window?.rootViewController = MainVC()
            
        } else {
          self.window?.rootViewController = SignInVC()
        }
        
        window?.makeKeyAndVisible()
        registerForPushNotifications()
        //getNotificationSettings()
        //fetchFromFirebase()
        
        downloadNotificationSound()
        
        let fileManager = FileManager.default
        let soundsDirectoryURL = fileManager.urls(for: .libraryDirectory, in: .userDomainMask).first!.appendingPathComponent("Sounds")
        //attempt to create the folder
        do {
            try fileManager.createDirectory(atPath: soundsDirectoryURL.path,
                                            withIntermediateDirectories: true, attributes: nil)
        } catch let error as NSError {
            print("Error: \(error.localizedDescription)")
        }
        
        
        
        
        application.setMinimumBackgroundFetchInterval(UIApplication.backgroundFetchIntervalMinimum)
        return true
    }
    
    /// Background fetch function. Tries the fetch data when the app is in background
    /// - Parameters:
    ///   - application: The current application
    ///   - completionHandler: checks whether new data has been fetched
    func application(_ application: UIApplication,
                     performFetchWithCompletionHandler completionHandler:
                     @escaping (UIBackgroundFetchResult) -> Void) {
        let count = activeAlarm.count
        
        //fetchFromFirebase()
        if(count == activeAlarm.count){
            completionHandler(.noData)
        } else if (count != activeAlarm.count){
            completionHandler(.newData)
        } else {
            completionHandler(.failed)
        }
       
        print("Refreshing in the background")
        completionHandler(.newData)
    }
    
    
  

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        print("came to foreground")
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
    
    func application(
        _ application: UIApplication,
        didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
        ) {
        let tokenParts = deviceToken.map { data in String(format: "%02.2hhx", data) }
        let token = tokenParts.joined()
        print("Device Token: \(token)")
    }
    
    func application(
        _ application: UIApplication,
        didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Failed to register: \(error)")
    }
    
    ///Sets up the internal swl database which is currently not in use
    private func setupDatabase(_ application: UIApplication) throws {
        let databaseURL = try FileManager.default
            .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appendingPathComponent("SmartPrompter.sqlite")
        dbQueue = try AppDatabase.openDatabase(atPath: databaseURL.path)
        print("DB Path\(dbQueue.path)")
        // Be a nice iOS citizen, and don't consume too much memory
        // See https://github.com/groue/GRDB.swift/blob/master/README.md#memory-management
        dbQueue.setupMemoryManagement(in: application)
    }
    
    ///Registers the app for push notification
    func registerForPushNotifications() {
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current() // 1
                .requestAuthorization(options: [.alert, .sound, .badge]) { // 2
                    granted, error in
                    print("Permission granted: \(granted)") // 3
            }
        } else {
            // Fallback on earlier versions
        }
    }
    
    
    ///Gets the notification settings for  local notification
    func getNotificationSettings() {
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().getNotificationSettings { settings in
                print("Notification settings: \(settings)")
            }
        } else {
            // Fallback on earlier versions
        }
    }
    


    
    
    // This function will be called when the app receive notification
    @available(iOS 10.0, *)
       func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
           print("Will present")
           
         // show the notification alert (banner), and with sound
         completionHandler([.alert, .sound])
       }
         
       // This function will be called right after user tap on the notification
    @available(iOS 10.0, *)
       func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
           let application = UIApplication.shared
           if(application.applicationState == .active){
             print("user tapped the notification bar when the app is in foreground")
             
           }
           
           if(application.applicationState == .inactive)
           {
             
           }
           
         // tell the app that we have finished processing the user’s action / response
         completionHandler()
       }

    ///Download the custom notifcation sound that's to be used
    func downloadNotificationSound(){
        
        let fileManager = FileManager.default
        let soundsDirectoryURL = fileManager.urls(for: .libraryDirectory, in: .userDomainMask).first!.appendingPathComponent("Sounds")
        //attempt to create the folder
        do {
            try fileManager.createDirectory(atPath: soundsDirectoryURL.path,
                                            withIntermediateDirectories: true, attributes: nil)
        } catch let error as NSError {
            print("Error: \(error.localizedDescription)")
        }
        
        
        //let islandRef = Storage.storage().reference().child("\(userID!)/\(alarm.label!)")
        let islandRef = Storage.storage().reference().child("\(userID!)").child("audio").child("/patientCall.m4a")

        
        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        //islandRef.write(toFile: getDocumentsDirectory().appendingPathComponent("recording.m4a")){ url, error in
        islandRef.write(toFile: soundsDirectoryURL.appendingPathComponent("recording.m4a")){ url, error in
            print("audio file directory \(getDocumentsDirectory().appendingPathComponent("recording.m4a"))")
        //islandRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
          if let error = error {
            // Uh-oh, an error occurred!
            print("downloading image \(error)")
          } else {
            print("worked")
            // Data for "images/island.jpg" is returned
            //let image = UIImage(data: data!)
            //self.imageView.image = image
          }
        }
    }

    
}

///Get the document directory
func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}

@available(iOS 11.0, *)
extension UIDevice {
    ///Checks if the current phone has a notch
    var hasNotch: Bool {
        let bottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
        return bottom > 0
    }
}


