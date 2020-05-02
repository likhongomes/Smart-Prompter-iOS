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
