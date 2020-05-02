# Alarm

``` swift
class Alarm: PersistableRecord, Codable, FetchableRecord
```

## Inheritance

`Codable`, `FetchableRecord`, `PersistableRecord`

## Initializers

### `init()`

``` swift
init()
```

### `init(label:hour:minute:year:month:day:active:)`

``` swift
init(label: String, hour: Int, minute: Int, year: Int, month: Int, day: Int, active: Bool)
```

## Properties

### `id`

``` swift
var id: Int?
```

### `firebaseID`

``` swift
var firebaseID: String?
```

### `label`

``` swift
var label: String?
```

### `year`

``` swift
var year: Int?
```

### `month`

``` swift
var month: Int?
```

### `day`

``` swift
var day: Int?
```

### `hour`

``` swift
var hour: Int?
```

### `minute`

``` swift
var minute: Int?
```

### `active`

``` swift
var active: Bool?
```

### `status`

``` swift
var status: String?
```

### `deleteRequest`

``` swift
var deleteRequest: String?
```

## Methods

### `encode(to:)`

``` swift
func encode(to container: inout PersistenceContainer)
```
# alarmDB

``` swift
let alarmDB
```
# AlarmScheduler

Alarm scheduling class to schedule alarm

``` swift
class AlarmScheduler
```

## Methods

### `scheduleNotification(title:dateComponents:id:)`

Function to schedule alarm for the first time after doanloaded from Firebase. Simply call this function and it will push the alarm to the OS notification center

``` swift
func scheduleNotification(title: String, dateComponents: DateComponents, id: String?)
```

#### Parameters

  - title: alarm identifier string
  - dateComponents: The date of the alarm when it should be triggered
  - id: Firebase ID fetched from firebase just tracking the alarm data

### `rescheduleNotification(title:id:)`

Reschedule alam once the the alarm is delayed

``` swift
public func rescheduleNotification(title: String, id: String?)
```

#### Parameters

  - title: alarm identifier string
  - id: Firebase ID fetched from firebase just tracking the alarm data

### `clearNotifications(title:)`

Request OS to remove notification from pending list and clear the notification list already delivered

``` swift
func clearNotifications(title: String)
```

#### Parameters

  - title: Alarm identifier string
# AlarmVC

The alarm view controller that is show after a row on the table is tapped

``` swift
class AlarmVC: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate
```

## Inheritance

`UIImagePickerControllerDelegate`, `UINavigationControllerDelegate`, `UIViewController`

## Properties

### `backButton`

``` swift
let backButton
```

### `saveButton`

``` swift
let saveButton
```

### `cancelButton`

``` swift
let cancelButton
```

### `deleteButton`

``` swift
let deleteButton
```

### `buttonStack`

``` swift
let buttonStack
```

### `alarmDetailsLabel`

``` swift
let alarmDetailsLabel
```

### `instructionLabel`

``` swift
let instructionLabel
```

### `dateLabel`

``` swift
let dateLabel
```

### `timeLabel`

``` swift
let timeLabel
```

### `alarmDelegate`

``` swift
var alarmDelegate: AlarmVCDelegate?
```

### `alarm`

``` swift
var alarm
```

### `alarmNameTextField`

``` swift
let alarmNameTextField
```

### `alarmDateTextField`

``` swift
let alarmDateTextField
```

### `alarmTimeTextField`

``` swift
let alarmTimeTextField
```

### `statusLabel`

``` swift
let statusLabel
```

### `statusStatusLabel`

``` swift
let statusStatusLabel
```

### `datePicker`

``` swift
let datePicker
```

### `timePicker`

``` swift
let timePicker
```

### `slider`

``` swift
let slider
```

### `pictureSlider`

``` swift
let pictureSlider
```

### `imageView`

``` swift
let imageView
```

### `notificationTitle`

``` swift
var notificationTitle: Any?
```

### `takenImageViewer`

``` swift
let takenImageViewer
```

### `alarmIndex`

``` swift
var alarmIndex
```

## Methods

### `viewDidLoad()`

Main function of the view controller, all the important UI and rest of the alarm meta data are downloaded here.

``` swift
override func viewDidLoad()
```

### `imageViewSetup()`

Sets up the size/location/shape and style of the imageview

``` swift
func imageViewSetup()
```

### `showDatePicker()`

Sets up the size/location/shape and style of the date picker

``` swift
func showDatePicker()
```

### `takenImageViewSetup()`

Sets up the size/location/shape and style of the imageview for take image

``` swift
func takenImageViewSetup()
```

### `showTimePicker()`

Sets up the size/location/shape and style of the time picker

``` swift
func showTimePicker()
```

### `donedatePicker()`

action when done button is tapped on date picker

``` swift
@objc func donedatePicker()
```

### `donetimePicker()`

action when done button is tapped on time picker

``` swift
@objc func donetimePicker()
```

### `cancelDatePicker()`

Action to cancel date picker and make it disappear

``` swift
@objc func cancelDatePicker()
```

### `changeValue(_:)`

Action when slider value is changed. Updates the current status of the alarm based on the direction of slide. If left, then add delay to the alarm. If right, update the data on firebase and prompt the user to the next step

``` swift
@objc func changeValue(_ sender: UISlider)
```

#### Parameters

  - sender: The slider object itself

### `changeValuePictureSlider(_:)`

Action when slider value is changed. Updates the current status of the alarm based on the direction of slide. If left, then add delay to the alarm. If right, update the data on firebase and prompt the user to the next step

``` swift
@objc func changeValuePictureSlider(_ sender: UISlider)
```

#### Parameters

  - sender: The slider object itself

### `imagePickerController(_:didFinishPickingMediaWithInfo:)`

Action when image picker is done picking image and returns it. It also uploads the image to firebase and updates the status of the alarm

``` swift
func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
```

### `alarmDateTextFieldSetup()`

Sets up the size/location/shape and style of the alarm date text field

``` swift
func alarmDateTextFieldSetup()
```

### `instructionLabelSetup()`

Sets up the size/location/shape and style of the instruction label

``` swift
func instructionLabelSetup()
```

### `alarmDetailsLabelSetup()`

Sets up the size/location/shape and style of the alarm details label

``` swift
func alarmDetailsLabelSetup()
```

### `alarmNameTextFieldSetup()`

Sets up the size/location/shape and style of the alarm name text field

``` swift
func alarmNameTextFieldSetup()
```

### `backButtonSetup()`

Sets up the size/location/shape and style of the back button

``` swift
func backButtonSetup()
```

### `backButtonClicked()`

Action for back button when clicked, takes the user back to the previous screen

``` swift
@objc func backButtonClicked()
```

### `statusStatusLabelSetup()`

Sets up the size/location/shape and style of the label for the status label

``` swift
func statusStatusLabelSetup()
```

### `sliderSetup()`

Sets up the size/location/shape and style of the slider

``` swift
func sliderSetup()
```

### `pictureSliderSetup()`

Sets up the size/location/shape and style of the slider

``` swift
func pictureSliderSetup()
```
# AlarmVCDelegate

``` swift
protocol AlarmVCDelegate
```

## Requirements

## reloadTableDelegate()

``` swift
func reloadTableDelegate()
```
# AppDatabase

A type responsible for initializing the application database.

``` swift
struct AppDatabase
```

See AppDelegate.setupDatabase()

## Methods

### `openDatabase(atPath:)`

Creates a fully initialized database at path

``` swift
static func openDatabase(atPath path: String) throws -> DatabaseQueue
```
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
# FirebaseUtil

``` swift
class FirebaseUtil
```

## Methods

### `fetchOneObject(firebaseID:)`

Fetch one particular firebase object using the given firebase ID. Returns a single alarm

``` swift
func fetchOneObject(firebaseID: String) -> Alarm
```

#### Parameters

  - firebaseID: The id of the element trying to fetch from firebase
# Types

  - [Alarm](Alarm)
  - [AlarmDB](AlarmDB)
  - [AlarmScheduler](AlarmScheduler)
  - [AlarmVC](AlarmVC)
  - [AppDatabase](AppDatabase)
  - [AppDelegate](AppDelegate)
  - [FirebaseUtil](FirebaseUtil)
  - [MainVC](MainVC)
  - [RewardVC](RewardVC)
  - [RootViewController](RootViewController)
  - [SignInVC](SignInVC)

# Protocols

  - [AlarmVCDelegate](AlarmVCDelegate)

# Globals

## Functions

  - [get​Documents​Directory()](getDocumentsDirectory\(\))

## Variables

  - [active​Alarm](activeAlarm)
  - [alarm​DB](alarmDB)
  - [completed​Task](completedTask)
  - [db​Queue](dbQueue)
  - [fUtil](fUtil)
  - [inactive​Alarm](inactiveAlarm)
  - [ref](ref)
  - [scheduler](scheduler)
  - [total​Task](totalTask)
  - [user​ID](userID)
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
# RewardVC

``` swift
class RewardVC: UIViewController
```

## Inheritance

`UIViewController`

## Properties

### `circleHolder`

``` swift
let circleHolder
```

### `percentageLabel`

``` swift
let percentageLabel
```

### `button`

``` swift
let button
```

### `textView`

``` swift
let textView
```

### `fraction`

``` swift
var fraction
```

### `imageView`

``` swift
let imageView
```

### `imageArray`

``` swift
let imageArray
```

## Methods

### `viewDidLoad()`

``` swift
override func viewDidLoad()
```

### `imageViewSetup()`

Sets up the size/location/shape and style of the imageview

``` swift
func imageViewSetup()
```

### `progressCircleSetup()`

Sets up the size/location/shape and style of the progress circle

``` swift
func progressCircleSetup()
```

### `buttonSetup()`

Sets up the size/location/shape and style of the button

``` swift
func buttonSetup()
```

### `buttonClicked()`

Action when the button is tapped. Takes user back

``` swift
@objc func buttonClicked()
```

### `textViewSetup()`

Sets up the size/location/shape and style of the textview

``` swift
func textViewSetup()
```
# RootViewController

``` swift
class RootViewController: UIViewController
```

## Inheritance

`UIViewController`

## Methods

### `viewDidLoad()`

``` swift
override func viewDidLoad()
```
# SignInVC

``` swift
class SignInVC: UIViewController
```

## Inheritance

`UIViewController`

## Properties

### `loginButton`

``` swift
let loginButton
```

### `signUpButton`

``` swift
let signUpButton
```

### `guestButton`

``` swift
let guestButton
```

### `emailTF`

``` swift
let emailTF
```

### `passwordTF`

``` swift
let passwordTF
```

### `backButton`

``` swift
let backButton
```

### `logoImage`

``` swift
let logoImage
```

### `errorMessageView`

``` swift
let errorMessageView
```

## Methods

### `viewWillAppear(_:)`

Adds a authentication listener to see if the user is signed in

``` swift
override func viewWillAppear(_ animated: Bool)
```

### `keyboardWillShow(notification:)`

Raises the view when the keybaord appears

``` swift
@objc func keyboardWillShow(notification: NSNotification)
```

#### Parameters

  - notification: The notification observer that the keyboard has appeared

### `keyboardWillHide(notification:)`

Lowers the view when the keyboard disappears

``` swift
@objc func keyboardWillHide(notification: NSNotification)
```

#### Parameters

  - notification: The notification observer that the keybaord has disappeard

### `viewDidLoad()`

Main function of this view controller. All the important tasks are done here such as loading the UI, adding listener for the keyboard etc.

``` swift
override func viewDidLoad()
```

### `errorMessageViewSetup()`

Sets up the size/location/shape and style of the error message textview

``` swift
func errorMessageViewSetup()
```

### `logoImageSetup()`

Sets up the size/location/shape and style of the logo image

``` swift
func logoImageSetup()
```

### `loginButtonSetup()`

Sets up the size/location/shape and style of the login button

``` swift
func loginButtonSetup()
```

### `loginButtonTapped()`

Action when the login button is tapped. Checks if all of the required fields are full and checks with firebase to authenticate

``` swift
@objc func loginButtonTapped()
```

### `signUpButtonSetup()`

Sets up the size/location/shape and style of the signup button

``` swift
func signUpButtonSetup()
```

### `signUpButtonTapped()`

Action when the signup button is tapped. Registers the user in firebase

``` swift
@objc func signUpButtonTapped()
```

### `emailTFSetup()`

Sets up the size/location/shape and style of the email textfield

``` swift
func emailTFSetup()
```

### `passwordTFSetup()`

Sets up the size/location/shape and style of the password textfield

``` swift
func passwordTFSetup()
```

### `backButtonSetup()`

Sets up the size/location/shape and style of the back button

``` swift
func backButtonSetup()
```
Generated at 2020-05-02T13:21:48-0400 using [swift-doc](https://github.com/SwiftDocOrg/swift-doc) 1.0.0-beta.2.
<details>
<summary>Types</summary>

  - [Alarm](/Alarm)
  - [AlarmDB](/AlarmDB)
  - [AlarmScheduler](/AlarmScheduler)
  - [AlarmVC](/AlarmVC)
  - [AppDatabase](/AppDatabase)
  - [AppDelegate](/AppDelegate)
  - [FirebaseUtil](/FirebaseUtil)
  - [MainVC](/MainVC)
  - [RewardVC](/RewardVC)
  - [RootViewController](/RootViewController)
  - [SignInVC](/SignInVC)

</details>

<details>
<summary>Protocols</summary>

  - [AlarmVCDelegate](/AlarmVCDelegate)

</details>

<details>
<summary>Global Variables</summary>

  - [activeAlarm](/activeAlarm)
  - [alarmDB](/alarmDB)
  - [completedTask](/completedTask)
  - [dbQueue](/dbQueue)
  - [fUtil](/fUtil)
  - [inactiveAlarm](/inactiveAlarm)
  - [ref](/ref)
  - [scheduler](/scheduler)
  - [totalTask](/totalTask)
  - [userID](/userID)

</details>

<details>
<summary>Global Functions</summary>

  - [getDocumentsDirectory()](/getDocumentsDirectory\(\))

</details>
# activeAlarm

``` swift
var activeAlarm
```
# completedTask

``` swift
var completedTask
```
# dbQueue

``` swift
var dbQueue: DatabaseQueue!
```
# fUtil

``` swift
let fUtil
```
# getDocumentsDirectory()

Get the document directory

``` swift
func getDocumentsDirectory() -> URL
```
# inactiveAlarm

``` swift
var inactiveAlarm
```
# ref

``` swift
var ref: DatabaseReference!
```
# scheduler

``` swift
let scheduler
```
# totalTask

``` swift
var totalTask
```
# userID

``` swift
let userID
```
