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
