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
