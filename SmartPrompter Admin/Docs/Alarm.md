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
