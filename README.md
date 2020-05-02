# Smart-Prompter-iOS
## Authors: Dr. Chiu Tan, Likhon Gomes, Sarah Lehman
This is a basic app that let’s patients respond to the alarms set by the caretake in Caretaker app.

To read the complete app documentation, go to this link: https://likhongomes.github.io/Smart-Prompter-iOS/

# How to Install:
Clone the repository and open it using xcode. click the run button or press cmd+R on keyboard to run the app, on a simulator or your iPhone.

Requirement: iOS 10 or above and xcode version 10 and above.

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

# Alarm

data structure the alarm

``` swift
class Alarm: PersistableRecord, Codable, FetchableRecord
```

## Inheritance

`Codable`, `FetchableRecord`, `PersistableRecord`

## Initializers

### `init()`

empty initializer

``` swift
init()
```

### `init(label:hour:minute:year:month:day:active:status:)`

initializer

``` swift
init(label: String, hour: Int, minute: Int, year: Int, month: Int, day: Int, active: Bool, status: String)
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

### `scheduledHour`

``` swift
var scheduledHour: Int?
```

### `scheduledMinute`

``` swift
var scheduledMinute: Int?
```

### `active`

``` swift
var active: Bool?
```

### `scheduledYear`

``` swift
var scheduledYear: Int?
```

### `scheduledMonth`

``` swift
var scheduledMonth: Int?
```

### `scheduledDay`

``` swift
var scheduledDay: Int?
```

### `acknowledgedDay`

``` swift
var acknowledgedDay: Int?
```

### `acknowledgedMonth`

``` swift
var acknowledgedMonth: Int?
```

### `acknowledgedYear`

``` swift
var acknowledgedYear: Int?
```

### `acknowledgedHour`

``` swift
var acknowledgedHour: Int?
```

### `acknowledgedMinute`

``` swift
var acknowledgedMinute: Int?
```

### `completedDay`

``` swift
var completedDay: Int?
```

### `completedMonth`

``` swift
var completedMonth: Int?
```

### `completedYear`

``` swift
var completedYear: Int?
```

### `completedHour`

``` swift
var completedHour: Int?
```

### `completedMinute`

``` swift
var completedMinute: Int?
```

### `status`

``` swift
var status: String?
```

### `deleteRequest`

``` swift
var deleteRequest: String?
```
# alarmDB

``` swift
let alarmDB
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
# AudioRecordVC

Class for recording audio for alarm sound

``` swift
class AudioRecordVC: RootViewController, AVAudioRecorderDelegate, AVAudioPlayerDelegate
```

## Inheritance

[`RootViewController`](RootViewController), `AVAudioPlayerDelegate`, `AVAudioRecorderDelegate`

## Properties

### `recordButton`

``` swift
var recordButton
```

### `playButton`

``` swift
let playButton
```

### `instruction`

``` swift
let instruction
```

### `nextButton`

``` swift
let nextButton
```

### `recordingSession`

``` swift
var recordingSession: AVAudioSession!
```

### `audioRecorder`

``` swift
var audioRecorder: AVAudioRecorder!
```

### `audioPlayer`

``` swift
var audioPlayer: AVAudioPlayer?
```

### `audioFilename`

``` swift
var audioFilename: URL?
```

## Methods

### `viewDidLoad()`

``` swift
override func viewDidLoad()
```

### `loadAudioPlayer()`

loads the audio player to play the sound on device

``` swift
func loadAudioPlayer()
```

### `audioPlayerDidFinishPlaying(_:successfully:)`

Checks if the audio player finished playing the sound, then change the play button

``` swift
func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool)
```

### `loadRecordingUI()`

Loads the button button to record. Sets title and adds target

``` swift
func loadRecordingUI()
```

### `startRecording()`

Starts the recording session on device

``` swift
func startRecording()
```

### `getDocumentsDirectory()`

Gets the documents directory of the audio stored

``` swift
func getDocumentsDirectory() -> URL
```

### `finishRecording(success:)`

Finishes the recording session and clears memory to nil

``` swift
func finishRecording(success: Bool)
```

### `topLeftButtonTapped()`

Action for top left button when tapped. Takes the user back to the main vc

``` swift
override func topLeftButtonTapped()
```

### `recordTapped()`

action for when the record button is tapped. Starts the audio session or stops

``` swift
@objc func recordTapped()
```

### `audioRecorderDidFinishRecording(_:successfully:)`

Checks if the audio recorder did finish recording. Sets the flag according to that

``` swift
func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool)
```

### `uploadToFirebase()`

Uploads the recorded audio to firebase

``` swift
func uploadToFirebase()
```

### `playButtonSetup()`

Setup function for  play button on the view. Specifies the location, size and the syle of it

``` swift
func playButtonSetup()
```

### `playButtonTapped()`

action for when play button is tapped. Plays the audio if not playing, stops the audio if playing

``` swift
@objc func playButtonTapped()
```

### `recordButtonSetup()`

Setup function for  record button on the view. Specifies the location, size and the syle of it

``` swift
func recordButtonSetup()
```

### `instructionTextViewSetup()`

Setup function for  instruction text view on the view. Specifies the location, size and the syle of it

``` swift
func instructionTextViewSetup()
```

### `nextButtonSetup()`

Setup function for  next button on the view. Specifies the location, size and the syle of it

``` swift
func nextButtonSetup()
```

### `nextButtonTapped()`

Action for when next buton is tapped. Takes the usre to Main VC

``` swift
@objc func nextButtonTapped()
```
# CreateNewAlarmVC

View controller for create new alarm

``` swift
class CreateNewAlarmVC: RootViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate
```

## Inheritance

[`RootViewController`](RootViewController), `UIImagePickerControllerDelegate`, `UINavigationControllerDelegate`, `UITextFieldDelegate`

## Properties

### `saveButton`

``` swift
let saveButton
```

### `deleteButton`

``` swift
let deleteButton
```

### `alarmNameLabel`

``` swift
let alarmNameLabel
```

### `dateLabel`

``` swift
let dateLabel
```

### `timeLabel`

``` swift
let timeLabel
```

### `imageView`

``` swift
let imageView
```

### `imageButtonStack`

``` swift
let imageButtonStack
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

### `selectedTextField`

``` swift
var selectedTextField
```

### `datePicker`

``` swift
let datePicker
```

### `timePicker`

``` swift
let timePicker
```

### `topImageView`

``` swift
let topImageView
```

### `addImageButton`

``` swift
let addImageButton
```

### `vcName`

``` swift
let vcName
```

### `cameraButton`

``` swift
let cameraButton
```

### `imagePickerButton`

``` swift
let imagePickerButton
```

### `imageBackButton`

``` swift
let imageBackButton
```

### `status`

``` swift
var status
```

### `editable`

``` swift
var editable
```

### `screenName`

``` swift
var screenName
```

### `alarm`

``` swift
var alarm
```

### `image`

``` swift
var image
```

## Methods

### `viewDidLoad()`

``` swift
override func viewDidLoad()
```

### `imagePickerController(_:didFinishPickingMediaWithInfo:)`

``` swift
func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
```

### `imageButtonStackSetup()`

Setup function for  image button stacks on the view. Specifies the location, size and the syle of it

``` swift
func imageButtonStackSetup()
```

### `topImageViewSetup()`

Setup function for  top image view on the view. Specifies the location, size and the syle of it

``` swift
func topImageViewSetup()
```

### `addImageButtonSetup()`

Setup function for  add image button on the view. Specifies the location, size and the syle of it

``` swift
func addImageButtonSetup()
```

### `addImageTapped()`

action for when add image is tapped. Opens image picker

``` swift
@objc func addImageTapped()
```

### `cameraButtonSetup()`

Setup function for  camera button on the view. Specifies the location, size and the syle of it

``` swift
func cameraButtonSetup()
```

### `cameraButtonTapped()`

action for when camera button is tapped. Opens the camera

``` swift
@objc func cameraButtonTapped()
```

### `imagePickerButtonSetup()`

Setup function for  image picker button on the view. Specifies the location, size and the syle of it

``` swift
func imagePickerButtonSetup()
```

### `imagePickerButtonTapped()`

action for when image picker button is tapped. Set the image to be displayed

``` swift
@objc func imagePickerButtonTapped()
```

### `imageBackButtonSetup()`

Setup function for  image back button on the view. Specifies the location, size and the syle of it

``` swift
func imageBackButtonSetup()
```

### `imageBackButonTapped()`

action for when image back button is tapped.

``` swift
@objc func imageBackButonTapped()
```

### `topLeftButtonTapped()`

action for when top left button is clicked. Takes the user back to the previous screen

``` swift
override func topLeftButtonTapped()
```

### `vcNmaeSetup()`

Setup function for  view controller name on the view. Specifies the location, size and the syle of it

``` swift
func vcNmaeSetup()
```

### `showData()`

show the data in alarm textfield

``` swift
func showData()
```

### `textFieldDidBeginEditing(_:)`

checks if the textfield did begin editing, set the inputview accordingly

``` swift
func textFieldDidBeginEditing(_ textField: UITextField)
```

### `textFieldDidEndEditing(_:)`

checks if textfield did end editing then format the date accordingly

``` swift
func textFieldDidEndEditing(_ textField: UITextField)
```

### `showDatePicker()`

shows the date picker on screen

``` swift
func showDatePicker()
```

### `donedatePicker()`

done editing the date picker

``` swift
@objc func donedatePicker()
```

### `donetimePicker()`

done editing the time picker

``` swift
@objc func donetimePicker()
```

### `cancelDatePicker()`

cancels editing the date picker

``` swift
@objc func cancelDatePicker()
```

### `alarmNameTextFieldSetup()`

Setup function for  alarm name text field on the view. Specifies the location, size and the syle of it

``` swift
func alarmNameTextFieldSetup()
```

### `alarmDateTextFieldSetup()`

Setup function for  alarm date text field on the view. Specifies the location, size and the syle of it

``` swift
func alarmDateTextFieldSetup()
```

### `alarmTimeTextFieldSetup()`

Setup function for  alarm time textfield on the view. Specifies the location, size and the syle of it

``` swift
func alarmTimeTextFieldSetup()
```

### `alarmNameLabelSetup()`

Setup function for  alarm name label on the view. Specifies the location, size and the syle of it

``` swift
func alarmNameLabelSetup()
```

### `dateLabelSetup()`

Setup function for  date label on the view. Specifies the location, size and the syle of it

``` swift
func dateLabelSetup()
```

### `timeLabelSetup()`

Setup function for  time label on the view. Specifies the location, size and the syle of it

``` swift
func timeLabelSetup()
```

### `backButtonClicked()`

action for when save button is clicked

``` swift
@objc func backButtonClicked()
```

### `saveButtonSetup()`

Setup function for  save button on the view. Specifies the location, size and the syle of it

``` swift
func saveButtonSetup()
```

### `saveButtonClicked()`

action for when save button is clicked. Creates an alarm and send it to firebase

``` swift
@objc func saveButtonClicked()
```

### `statusStatusLabelSetup()`

Setup function for  lable for status label on the view. Specifies the location, size and the syle of it

``` swift
func statusStatusLabelSetup()
```
# CurrentAlarmListVC

view controller to show list of current alarms

``` swift
class CurrentAlarmListVC: RootViewController, UITableViewDataSource, UITableViewDelegate
```

## Inheritance

[`RootViewController`](RootViewController), `UITableViewDataSource`, `UITableViewDelegate`

## Properties

### `activeAlarm`

``` swift
var activeAlarm
```

### `alarmTable`

``` swift
let alarmTable
```

## Methods

### `tableView(_:numberOfRowsInSection:)`

``` swift
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
```

### `tableView(_:cellForRowAt:)`

``` swift
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
```

### `tableView(_:didSelectRowAt:)`

``` swift
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
```

### `viewDidLoad()`

``` swift
override func viewDidLoad()
```

### `topLeftButtonTapped()`

``` swift
override func topLeftButtonTapped()
```

### `alarmTableSetup()`

Setup function for  alarm table on the view. Specifies the location, size and the syle of it

``` swift
func alarmTableSetup()
```

### `fetchFromFirebase()`

fetch data from firebase

``` swift
func fetchFromFirebase()
```
# CurrentAlarmViewVC

Current view controller that shows current alarms active

``` swift
class CurrentAlarmViewVC: RootViewController, UITextFieldDelegate
```

## Inheritance

[`RootViewController`](RootViewController), `UITextFieldDelegate`

## Properties

### `backButton`

``` swift
let backButton
```

### `saveButton`

``` swift
let saveButton
```

### `deleteButton`

``` swift
let deleteButton
```

### `alarmDetailsLabel`

``` swift
let alarmDetailsLabel
```

### `alarmNameLabel`

``` swift
let alarmNameLabel
```

### `dateLabel`

``` swift
let dateLabel
```

### `timeLabel`

``` swift
let timeLabel
```

### `imageView`

``` swift
let imageView
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

### `selectedTextField`

``` swift
var selectedTextField
```

### `datePicker`

``` swift
let datePicker
```

### `timePicker`

``` swift
let timePicker
```

### `status`

``` swift
var status
```

### `editable`

``` swift
var editable
```

### `screenName`

``` swift
var screenName
```

### `alarm`

``` swift
var alarm
```

## Methods

### `viewDidLoad()`

``` swift
override func viewDidLoad()
```

### `topLeftButtonTapped()`

action for when top left button is tapped. Takes the user back to the previous screen.

``` swift
override func topLeftButtonTapped()
```

### `showData()`

Show the data in textviews

``` swift
func showData()
```

### `textFieldDidBeginEditing(_:)`

Check if text view did beging editing, set the keyboard to date picker

``` swift
func textFieldDidBeginEditing(_ textField: UITextField)
```

### `textFieldDidEndEditing(_:)`

Checks if the text field did end editing. Formats the date accordingly and put on textview

``` swift
func textFieldDidEndEditing(_ textField: UITextField)
```

### `imageViewSetup()`

Setup function for  imageview on the view. Specifies the location, size and the syle of it

``` swift
func imageViewSetup()
```

### `showDatePicker()`

Setup function for  date picker on the view. Specifies the location, size and the syle of it

``` swift
func showDatePicker()
```

### `donedatePicker()`

wrapper function for when date picker is done

``` swift
@objc func donedatePicker()
```

### `donetimePicker()`

wrapper function for when timer is done

``` swift
@objc func donetimePicker()
```

### `cancelDatePicker()`

wrapper function when cancel date

``` swift
@objc func cancelDatePicker()
```

### `alarmNameTextFieldSetup()`

Setup function for  alarm name textfield on the view. Specifies the location, size and the syle of it

``` swift
func alarmNameTextFieldSetup()
```

### `alarmDateTextFieldSetup()`

Setup function for  alarm date textfield on the view. Specifies the location, size and the syle of it

``` swift
func alarmDateTextFieldSetup()
```

### `alarmTimeTextFieldSetup()`

Setup function for  alarm time text field on the view. Specifies the location, size and the syle of it

``` swift
func alarmTimeTextFieldSetup()
```

### `statusLabelSetup()`

Setup function for  logo on the view. Specifies the location, size and the syle of it

``` swift
func statusLabelSetup()
```

### `alarmNameLabelSetup()`

Setup function for  alarm name label on the view. Specifies the location, size and the syle of it

``` swift
func alarmNameLabelSetup()
```

### `alarmDetailsLabelSetup()`

Setup function for  alarm details label on the view. Specifies the location, size and the syle of it

``` swift
func alarmDetailsLabelSetup()
```

### `dateLabelSetup()`

Setup function for  date label on the view. Specifies the location, size and the syle of it

``` swift
func dateLabelSetup()
```

### `timeLabelSetup()`

Setup function for  time label on the view. Specifies the location, size and the syle of it

``` swift
func timeLabelSetup()
```

### `backButtonSetup()`

Setup function for  back button on the view. Specifies the location, size and the syle of it

``` swift
func backButtonSetup()
```

### `backButtonClicked()`

action for when button is clicked

``` swift
@objc func backButtonClicked()
```

### `saveButtonSetup()`

Setup function for  save button on the view. Specifies the location, size and the syle of it

``` swift
func saveButtonSetup()
```

### `saveButtonClicked()`

action button for when save button is clicked. Updates data on firebase

``` swift
@objc func saveButtonClicked()
```

### `cancelButtonClicked()`

actiong for when cancel button is clicked

``` swift
@objc func cancelButtonClicked()
```

### `deleteButtonSetup()`

Setup function for  delete button on the view. Specifies the location, size and the syle of it

``` swift
func deleteButtonSetup()
```

### `deleteButtonClicked()`

action for when delete button is clicked. Send a request to firebase to delete the data

``` swift
@objc func deleteButtonClicked()
```

### `statusStatusLabelSetup()`

Setup function for  label for status lable on the view. Specifies the location, size and the syle of it

``` swift
func statusStatusLabelSetup()
```
# FirebaseController

Controller for firebase actions

``` swift
class FirebaseController
```

## Initializers

### `init()`

``` swift
init()
```

## Methods

### `uploadImage(image:imageName:)`

upload image to firebase

``` swift
func uploadImage(image: UIImage, imageName: String)
```
# Types

  - [Alarm](Alarm)
  - [AlarmDB](AlarmDB)
  - [AppDatabase](AppDatabase)
  - [AppDelegate](AppDelegate)
  - [AudioRecordVC](AudioRecordVC)
  - [CreateNewAlarmVC](CreateNewAlarmVC)
  - [CurrentAlarmListVC](CurrentAlarmListVC)
  - [CurrentAlarmViewVC](CurrentAlarmViewVC)
  - [FirebaseController](FirebaseController)
  - [MainVC](MainVC)
  - [PastAlarmListVC](PastAlarmListVC)
  - [PastAlarmViewVC](PastAlarmViewVC)
  - [RootViewController](RootViewController)
  - [RootViewController.ButtonType](RootViewController_ButtonType)
  - [RootViewController.VCType](RootViewController_VCType)
  - [SignInVC](SignInVC)
  - [UserInfoVC](UserInfoVC)

# Globals

## Variables

  - [alarm​DB](alarmDB)
  - [db​Queue](dbQueue)
  - [ref](ref)
  - [user​ID](userID)
# MainVC

The main view controller of the app, users see this viewcontroller first when they open the app

``` swift
class MainVC: RootViewController
```

## Inheritance

[`RootViewController`](RootViewController)

## Properties

### `newAlarmButton`

``` swift
let newAlarmButton
```

### `viewAlarmButton`

``` swift
let viewAlarmButton
```

### `pastAlarmsButton`

``` swift
let pastAlarmsButton
```

### `stack`

``` swift
let stack
```

### `upperQuad`

``` swift
let upperQuad
```

### `lowerQuad`

``` swift
let lowerQuad
```

### `secondTextView`

``` swift
let secondTextView
```

## Methods

### `viewDidLoad()`

``` swift
override func viewDidLoad()
```

### `topLeftButtonTapped()`

action for when the top left button is tapped. It prompts the user to record the alarm sound and preview it

``` swift
override func topLeftButtonTapped()
```

### `topRightButtonTapped()`

Action for when the top right button is tapped. Here it logs out the user

``` swift
override func topRightButtonTapped()
```

### `secondTextViewSetup()`

Setup function for  second text view on the view. Specifies the location, size and the syle of it

``` swift
func secondTextViewSetup()
```

### `newAlarmButtonSetup()`

Setup function for  new alarm button on the view. Specifies the location, size and the syle of it

``` swift
func newAlarmButtonSetup()
```

### `newAlarmButtonClicked()`

Action for when new alarm button is clicked. It takes the user to Create New Alarm View Controller

``` swift
@objc func newAlarmButtonClicked()
```

### `viewAlarmButtonSetup()`

Setup function for  view alarm button on the view. Specifies the location, size and the syle of it

``` swift
func viewAlarmButtonSetup()
```

### `viewAlarmButtonClicked()`

action for when the view alarm button is clicked. Takes the user to Current Alarm ListVC

``` swift
@objc func viewAlarmButtonClicked()
```

### `pastAlarmsButtonSetup()`

Setup function for  past alarm button on the view. Specifies the location, size and the syle of it

``` swift
func pastAlarmsButtonSetup()
```

### `pastAlarmButtonClicked()`

Action for when past alarm button is clicked. Presents pastAlarmVC

``` swift
@objc func pastAlarmButtonClicked()
```
# PastAlarmListVC

View controller to show list of past alarms

``` swift
class PastAlarmListVC: RootViewController, UITableViewDelegate, UITableViewDataSource
```

## Inheritance

[`RootViewController`](RootViewController), `UITableViewDataSource`, `UITableViewDelegate`

## Properties

### `inactiveAlarm`

``` swift
var inactiveAlarm
```

### `backButton`

``` swift
let backButton
```

### `alarmTable`

``` swift
let alarmTable
```

## Methods

### `tableView(_:numberOfRowsInSection:)`

``` swift
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
```

### `tableView(_:cellForRowAt:)`

``` swift
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
```

### `tableView(_:didSelectRowAt:)`

``` swift
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
```

### `viewDidLoad()`

``` swift
override func viewDidLoad()
```

### `topLeftButtonTapped()`

action button for top left button. Takes the user back

``` swift
override func topLeftButtonTapped()
```

### `alarmTableSetup()`

Setup function for  table view on the view. Specifies the location, size and the syle of it

``` swift
func alarmTableSetup()
```

### `fetchFromFirebase()`

fetch data from firebase

``` swift
func fetchFromFirebase()
```
# PastAlarmViewVC

View controller to show past alarms

``` swift
class PastAlarmViewVC: RootViewController, UITextFieldDelegate
```

## Inheritance

[`RootViewController`](RootViewController), `UITextFieldDelegate`

## Properties

### `backButton`

``` swift
let backButton
```

### `detailTextView`

``` swift
let detailTextView
```

### `cancelButton`

``` swift
let cancelButton
```

### `deleteButton`

``` swift
let deleteButton
```

### `alarmDetailsLabel`

``` swift
let alarmDetailsLabel
```

### `alarmNameLabel`

``` swift
let alarmNameLabel
```

### `dateLabel`

``` swift
let dateLabel
```

### `timeLabel`

``` swift
let timeLabel
```

### `imageView`

``` swift
let imageView
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

### `selectedTextField`

``` swift
var selectedTextField
```

### `status`

``` swift
var status
```

### `editable`

``` swift
var editable
```

### `screenName`

``` swift
var screenName
```

### `alarm`

``` swift
var alarm
```

## Methods

### `viewDidLoad()`

``` swift
override func viewDidLoad()
```

### `topLeftButtonTapped()`

action for when the top left button is tapped. Takes the user back to the previous view controller

``` swift
override func topLeftButtonTapped()
```

### `detailTextViewSetup()`

Setup function for  detail text view on the view. Specifies the location, size and the syle of it

``` swift
func detailTextViewSetup()
```

### `prepareDataforDetailTextView()`

prepares the data to be show on detail text view

``` swift
func prepareDataforDetailTextView()
```

### `imageViewSetup()`

Setup function for  image view on the view. Specifies the location, size and the syle of it

``` swift
func imageViewSetup()
```

### `donedatePicker()`

done function for when date picker is done

``` swift
@objc func donedatePicker()
```

### `donetimePicker()`

done function for when time picker is done

``` swift
@objc func donetimePicker()
```

### `cancelDatePicker()`

cancels the date picker

``` swift
@objc func cancelDatePicker()
```

### `alarmNameTextFieldSetup()`

Setup function for  alarm name text field on the view. Specifies the location, size and the syle of it

``` swift
func alarmNameTextFieldSetup()
```

### `alarmDateTextFieldSetup()`

Setup function for  alarm date text field on the view. Specifies the location, size and the syle of it

``` swift
func alarmDateTextFieldSetup()
```

### `alarmTimeTextFieldSetup()`

Setup function for  alarm time text field on the view. Specifies the location, size and the syle of it

``` swift
func alarmTimeTextFieldSetup()
```

### `statusLabelSetup()`

Setup function for  status label on the view. Specifies the location, size and the syle of it

``` swift
func statusLabelSetup()
```

### `alarmNameLabelSetup()`

Setup function for  alarm name label on the view. Specifies the location, size and the syle of it

``` swift
func alarmNameLabelSetup()
```

### `alarmDetailsLabelSetup()`

Setup function for  alarm detail lable on the view. Specifies the location, size and the syle of it

``` swift
func alarmDetailsLabelSetup()
```

### `dateLabelSetup()`

Setup function for  date label on the view. Specifies the location, size and the syle of it

``` swift
func dateLabelSetup()
```

### `timeLabelSetup()`

Setup function for  time label on the view. Specifies the location, size and the syle of it

``` swift
func timeLabelSetup()
```

### `cancelButtonSetup()`

Setup function for  cancel button on the view. Specifies the location, size and the syle of it

``` swift
func cancelButtonSetup()
```

### `cancelButtonClicked()`

action for when cancel button is clicked

``` swift
@objc func cancelButtonClicked()
```

### `deleteButtonSetup()`

Setup function for  delete button on the view. Specifies the location, size and the syle of it

``` swift
func deleteButtonSetup()
```

### `deleteButtonClicked()`

action place holder for delete button

``` swift
@objc func deleteButtonClicked()
```

### `statusStatusLabelSetup()`

Setup function for  status lable on the view. Specifies the location, size and the syle of it

``` swift
func statusStatusLabelSetup()
```
# RootViewController

``` swift
class RootViewController: UIViewController
```

## Inheritance

`UIViewController`

## Properties

### `topLeftButton`

``` swift
let topLeftButton
```

### `topRightButton`

``` swift
let topRightButton
```

### `viewContollerLabel`

``` swift
let viewContollerLabel
```

### `buttonStack`

``` swift
let buttonStack
```

### `topButtonSize`

``` swift
let topButtonSize
```

## Methods

### `viewDidLoad()`

``` swift
override func viewDidLoad()
```

### `topLeftButtonSetup(buttonType:)`

``` swift
func topLeftButtonSetup(buttonType: ButtonType)
```

### `topLeftButtonTapped()`

``` swift
@objc func topLeftButtonTapped()
```

### `topRightButtonSetup(buttonType:)`

``` swift
func topRightButtonSetup(buttonType: ButtonType)
```

### `topRightButtonTapped()`

``` swift
@objc func topRightButtonTapped()
```

### `viewControllerLabelSetup(labelType:)`

``` swift
func viewControllerLabelSetup(labelType: VCType)
```

### `buttonStackSetup()`

``` swift
func buttonStackSetup()
```
# RootViewController.ButtonType

``` swift
enum ButtonType
```

## Enumeration Cases

### `rectangle`

``` swift
case rectangle
```

### `square`

``` swift
case square
```
# RootViewController.VCType

``` swift
enum VCType
```

## Enumeration Cases

### `main`

``` swift
case main
```

### `sub`

``` swift
case sub
```
# SignInVC

View controller to handle sign in functionalities

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

Attaches a user listener before the view appears

``` swift
override func viewWillAppear(_ animated: Bool)
```

### `keyboardWillShow(notification:)`

raises the view when the keyboard shows up

``` swift
@objc func keyboardWillShow(notification: NSNotification)
```

### `keyboardWillHide(notification:)`

lowers the view when the keyboard disappears

``` swift
@objc func keyboardWillHide(notification: NSNotification)
```

### `viewDidLoad()`

``` swift
override func viewDidLoad()
```

### `logoImageSetup()`

Setup function for  logo on the view. Specifies the location, size and the syle of it

``` swift
func logoImageSetup()
```

### `loginButtonSetup()`

Setup function for  login button on the view. Specifies the location, size and the syle of it

``` swift
func loginButtonSetup()
```

### `loginButtonTapped()`

action for when login button is tapped. Checks with firebase and logs the user in

``` swift
@objc func loginButtonTapped()
```

### `errorMessageViewSetup()`

Setup function for  error mesage on the view. Specifies the location, size and the syle of it

``` swift
func errorMessageViewSetup()
```

### `signUpButtonSetup()`

Setup function for  signup button on the view. Specifies the location, size and the syle of it

``` swift
func signUpButtonSetup()
```

### `signUpButtonTapped()`

action for when signup button is tapped. It registers the user on firebase

``` swift
@objc func signUpButtonTapped()
```

### `emailTFSetup()`

Setup function for  email textfield on the view. Specifies the location, size and the syle of it

``` swift
func emailTFSetup()
```

### `passwordTFSetup()`

Setup function for  password textfield on the view. Specifies the location, size and the syle of it

``` swift
func passwordTFSetup()
```

### `backButtonSetup()`

Setup function for  back button on the view. Specifies the location, size and the syle of it

``` swift
func backButtonSetup()
```
# UserInfoVC

View controller that asks for user's information

``` swift
class UserInfoVC: UIViewController, UITextFieldDelegate
```

## Inheritance

`UITextFieldDelegate`, `UIViewController`

## Properties

### `careTakerFirstNameTF`

``` swift
let careTakerFirstNameTF
```

### `careTakerLastNameTF`

``` swift
let careTakerLastNameTF
```

### `patientFirstNameTF`

``` swift
let patientFirstNameTF
```

### `patientLastNameTF`

``` swift
let patientLastNameTF
```

### `doneButton`

``` swift
let doneButton
```

### `informationLabel`

``` swift
let informationLabel
```

### `selectedTextField`

``` swift
var selectedTextField
```

## Methods

### `viewDidLoad()`

``` swift
override func viewDidLoad()
```

### `textFieldDidBeginEditing(_:)`

Checks when the text field begins editing, assigns the responder based on that

``` swift
func textFieldDidBeginEditing(_ textField: UITextField)
```

### `keyboardWillShow(notification:)`

raises the view when keyboard appears

``` swift
@objc func keyboardWillShow(notification: NSNotification)
```

### `keyboardWillHide(notification:)`

lowers the view when keybaord disappers

``` swift
@objc func keyboardWillHide(notification: NSNotification)
```

### `informationLabelSetup()`

Setup function for  information label on the view. Specifies the location, size and the syle of it

``` swift
func informationLabelSetup()
```

### `careTakerFirstNameTFSetup()`

Setup function for  caretaker first name textfield on the view. Specifies the location, size and the syle of it

``` swift
func careTakerFirstNameTFSetup()
```

### `careTakerLastNameTFSetup()`

Setup function for  care taker last name textfield on the view. Specifies the location, size and the syle of it

``` swift
func careTakerLastNameTFSetup()
```

### `patientFirstNameTFSetup()`

Setup function for  patient first name text field on the view. Specifies the location, size and the syle of it

``` swift
func patientFirstNameTFSetup()
```

### `patientLastNameTFSetup()`

Setup function for  patient last name text field on the view. Specifies the location, size and the syle of it

``` swift
func patientLastNameTFSetup()
```

### `doneButtonSetup()`

Setup function for  done button on the view. Specifies the location, size and the syle of it

``` swift
func doneButtonSetup()
```

### `doneButtonClicked()`

action for when the done button is tapped. It uploads the data to firebase

``` swift
@objc func doneButtonClicked()
```
Generated at 2020-05-02T13:30:21-0400 using [swift-doc](https://github.com/SwiftDocOrg/swift-doc) 1.0.0-beta.2.
<details>
<summary>Types</summary>

  - [Alarm](/Alarm)
  - [AlarmDB](/AlarmDB)
  - [AppDatabase](/AppDatabase)
  - [AppDelegate](/AppDelegate)
  - [AudioRecordVC](/AudioRecordVC)
  - [CreateNewAlarmVC](/CreateNewAlarmVC)
  - [CurrentAlarmListVC](/CurrentAlarmListVC)
  - [CurrentAlarmViewVC](/CurrentAlarmViewVC)
  - [FirebaseController](/FirebaseController)
  - [MainVC](/MainVC)
  - [PastAlarmListVC](/PastAlarmListVC)
  - [PastAlarmViewVC](/PastAlarmViewVC)
  - [RootViewController](/RootViewController)
  - [RootViewController.ButtonType](/RootViewController_ButtonType)
  - [RootViewController.VCType](/RootViewController_VCType)
  - [SignInVC](/SignInVC)
  - [UserInfoVC](/UserInfoVC)

</details>

<details>
<summary>Global Variables</summary>

  - [alarmDB](/alarmDB)
  - [dbQueue](/dbQueue)
  - [ref](/ref)
  - [userID](/userID)

</details>
# dbQueue

``` swift
var dbQueue: DatabaseQueue!
```
# ref

``` swift
var ref: DatabaseReference!
```
# userID

``` swift
let userID
```
