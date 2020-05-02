# AppDatabase

A type responsible for initializing the application database.

``` swift
struct AppDatabase
```

See AppDelegate.setupDatabase()

## Methods

### `openDatabase(atPath:)`

Creates a fully initialized database at path

``` swift
static func openDatabase(atPath path: String) throws -> DatabaseQueue
```
