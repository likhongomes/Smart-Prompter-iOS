# AppDelegate

``` swift
@UIApplicationMain class AppDelegate: UIResponder, UIApplicationDelegate
```

## Inheritance

`UIApplicationDelegate`, `UIResponder`

## Properties

### `window`

``` swift
var window: UIWindow?
```

## Methods

### `application(_:didFinishLaunchingWithOptions:)`

main function of the app delegate

``` swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
```

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

``` swift
private func setupDatabase(_ application: UIApplication) throws
```

### `registerForPushNotifications()`

``` swift
func registerForPushNotifications()
```

### `fetchFromFirebase()`

``` swift
func fetchFromFirebase()
```
