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
