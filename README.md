# SmartPrompter iOS 
## Dr Chiu Tan, Authors: Likhon Gomes, Sarah Lehman.

## Smart Prompter Caretaker App
This is a basic app that allows a caretaker to remotely set alarm to remind the patient they are taking care of to do certain tasks on specifically on time.

### Classes & ViewControllers

#### AppDelegate
The app delegate is the root class of the app. When the app is executed, the app delegate sets all of the configuration, all of the connections to the services used and run. In the app delegate I have declared all of the necessary variables and constants that are going to be universally accessible throughout the app, for example “userID:Auth.auth().currentUser?.uid” established connection with firebase and fetch’s the current userID that’s logged into the app.

'''swift
    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        let count = activeAlarm.count
        fetchFromFirebase()
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
'''
•	didFinishLaunchingWithOptions functions is the main function of the app, in this function I have specified the the app to show sign up page to show up if the user is logged out. If the user is already logged in, then the home screen is shown. Next in the same function I have called a function registerForPushNotification, which asks for permission from the user and enables push notification.
•	performFetchWithCompletionHandler function fetches data from the firebase server when the app is in background mode. The os lets the app to execute this function to fetch data from firebase. Whenever this function is run, the app has to let the OS know about its completions status using the completion handler. The OS sets the apps’ background execution priority based on the frequency of completion success from completion handler.
•	didRegisterForRemoteNotificationWithDeviceToken function registers the device with a device token for the app to deliver notifications.
•	didFailToRegisterForRemoteNotificationsWithError this function is executed if the app fails to register for notification.
•	setupDatabase this functions is used to setup GRDB database to store alarms in the phone’s persistent memory. It creates a connection in the apps documents folder and creates a file called “SmartPrompter.sqlite”. This is where the alarm data are stored, but currently it’s inactive because we shifted to firebase. I still kept this function just in case if we use it in future.
•	registerForPushNotifications function configures the notification type served by the app, for example, this functions sets the alert type, sound and the badge. If anyone wants to change the sound or anything related to push notifications, this is where they have to do it.
•	


## Smart Prompter Patient App

