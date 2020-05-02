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
