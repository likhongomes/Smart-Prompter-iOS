# AppDelegate

``` swift
@available(iOS 10.0, *) @UIApplicationMain class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate
```

## Inheritance

`UIApplicationDelegate`, `UIResponder`, `UNUserNotificationCenterDelegate`

## Properties

### `window`

``` swift
var window: UIWindow?
```

## Methods

### `application(_:didFinishLaunchingWithOptions:)`

``` swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
```

### `application(_:performFetchWithCompletionHandler:)`

Background fetch function. Tries the fetch data when the app is in background

``` swift
func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void)
```

#### Parameters

  - application: The current application
  - completionHandler: checks whether new data has been fetched

### `applicationWillResignActive(_:)`

``` swift
func applicationWillResignActive(_ application: UIApplication)
```

### `applicationDidEnterBackground(_:)`

``` swift
func applicationDidEnterBackground(_ application: UIApplication)
```

### `applicationWillEnterForeground(_:)`

``` swift
func applicationWillEnterForeground(_ application: UIApplication)
```

### `applicationDidBecomeActive(_:)`

``` swift
func applicationDidBecomeActive(_ application: UIApplication)
```

### `applicationWillTerminate(_:)`

``` swift
func applicationWillTerminate(_ application: UIApplication)
```

### `application(_:didRegisterForRemoteNotificationsWithDeviceToken:)`

``` swift
func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data)
```

### `application(_:didFailToRegisterForRemoteNotificationsWithError:)`

``` swift
func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error)
```

### `setupDatabase(_:)`

Sets up the internal swl database which is currently not in use

``` swift
private func setupDatabase(_ application: UIApplication) throws
```

### `registerForPushNotifications()`

Registers the app for push notification

``` swift
func registerForPushNotifications()
```

### `getNotificationSettings()`

Gets the notification settings for  local notification

``` swift
func getNotificationSettings()
```

### `userNotificationCenter(_:willPresent:withCompletionHandler:)`

``` swift
@available(iOS 10.0, *) func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void)
```

### `userNotificationCenter(_:didReceive:withCompletionHandler:)`

``` swift
@available(iOS 10.0, *) func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void)
```

### `downloadNotificationSound()`

Download the custom notifcation sound that's to be used

``` swift
func downloadNotificationSound()
```
