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
