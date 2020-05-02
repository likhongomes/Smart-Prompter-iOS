# Alarm

``` swift
class Alarm: PersistableRecord, Codable, FetchableRecord
```

## Inheritance

`Codable`, `FetchableRecord`, `PersistableRecord`

## Initializers

### `init()`

``` swift
init()
```

### `init(label:hour:minute:year:month:day:active:)`

``` swift
init(label: String, hour: Int, minute: Int, year: Int, month: Int, day: Int, active: Bool)
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

### `year`

``` swift
var year: Int?
```

### `month`

``` swift
var month: Int?
```

### `day`

``` swift
var day: Int?
```

### `hour`

``` swift
var hour: Int?
```

### `minute`

``` swift
var minute: Int?
```

### `active`

``` swift
var active: Bool?
```

### `status`

``` swift
var status: String?
```

### `deleteRequest`

``` swift
var deleteRequest: String?
```

## Methods

### `encode(to:)`

``` swift
func encode(to container: inout PersistenceContainer)
```
