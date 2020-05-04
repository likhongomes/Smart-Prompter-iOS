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
