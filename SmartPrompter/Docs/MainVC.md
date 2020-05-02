# MainVC

The main view controlller of the app. Users often see this view controller as a default. This is where all the alarms are fetched from firebase and alarm requests are made to the OS.

``` swift
class MainVC: UIViewController
```

## Inheritance

[`AlarmVCDelegate`](AlarmVCDelegate), `UITableViewDataSource`, `UITableViewDelegate`, `UIViewController`, `UNUserNotificationCenterDelegate`

## Properties

### `welcomeTextView`

``` swift
let welcomeTextView
```

### `clockLabel`

``` swift
let clockLabel
```

### `topBar`

``` swift
let topBar
```

### `timeLabel`

``` swift
let timeLabel
```

### `timer`

``` swift
var timer
```

### `date`

``` swift
var date
```

### `calendar`

``` swift
let calendar
```

### `dateFormatter`

``` swift
let dateFormatter
```

### `logoutButton`

``` swift
let logoutButton
```

### `refreshControl`

``` swift
var refreshControl
```

### `summaryLabel`

``` swift
let summaryLabel
```

### `ref`

``` swift
var ref: DatabaseReference!
```

### `alarmTable`

``` swift
let alarmTable
```

## Methods

### `reloadTableDelegate()`

``` swift
func reloadTableDelegate()
```

### `viewDidLoad()`

This is tha main function where all the important tasks are called, such as loading the UI, Fetching from firebase and loading data into array

``` swift
override func viewDidLoad()
```

### `updateTimeLabel()`

Updates the time label for the clock shown on screen. Also refreshes the table view after certain time period

``` swift
@objc func updateTimeLabel()
```

### `reloadTable()`

Reloads data in the table view

``` swift
@objc func reloadTable()
```

### `summaryLabelSetup()`

Sets up the summary label. This label shows how many alarms are remaining to be completed for the day.

``` swift
func summaryLabelSetup()
```

### `logoutButtonClicked()`

Logout button action. Logout the user from the app

``` swift
@objc func logoutButtonClicked()
```

### `fetchFromFirebase()`

Fetches data from firebase and loads them in an array to be supplied to table view

``` swift
func fetchFromFirebase()
```

### `tableView(_:numberOfRowsInSection:)`

Built in tablie view function. Determines how many rows to be shown in the table

``` swift
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
```

#### Parameters

  - tableView: table view class
  - section: number of rows

### `tableView(_:cellForRowAt:)`

Sorts out the data to be shown in each row of the table

``` swift
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
```

### `tableView(_:didSelectRowAt:)`

Action to be done when a row is tapped

``` swift
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
```

### `userNotificationCenter(_:willPresent:withCompletionHandler:)`

``` swift
@available(iOS 10.0, *) func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void)
```

### `userNotificationCenter(_:didReceive:withCompletionHandler:)`

``` swift
@available(iOS 10.0, *) func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void)
```

### `logoutButtonSetup()`

Sets up the size/location/shape and style of the logout button

``` swift
func logoutButtonSetup()
```

### `alarmTableSetup()`

Sets up the size/location/shape and style of the alarm table

``` swift
func alarmTableSetup()
```

### `topViewSetup()`

Sets up the size/location/shape and style of the top view

``` swift
func topViewSetup()
```

### `timeLabelSetup()`

Sets up the size/location/shape and style of the time label

``` swift
func timeLabelSetup()
```

### `welcomeTextViewSetup()`

Sets up the size/location/shape and style of the welcome text

``` swift
func welcomeTextViewSetup()
```

### `clockLabelSetup()`

Sets up the size/location/shape and style of the clock label

``` swift
func clockLabelSetup()
```

### `viewWillAppear(_:)`

Refreshes the data in the alarm table when the view is loaded

``` swift
override func viewWillAppear(_ animated: Bool)
```
