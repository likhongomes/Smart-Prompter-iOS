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
