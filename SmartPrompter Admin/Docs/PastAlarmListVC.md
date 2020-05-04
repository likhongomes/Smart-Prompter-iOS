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
