# UserInfoVC

View controller that asks for user's information

``` swift
class UserInfoVC: UIViewController, UITextFieldDelegate
```

## Inheritance

`UITextFieldDelegate`, `UIViewController`

## Properties

### `careTakerFirstNameTF`

``` swift
let careTakerFirstNameTF
```

### `careTakerLastNameTF`

``` swift
let careTakerLastNameTF
```

### `patientFirstNameTF`

``` swift
let patientFirstNameTF
```

### `patientLastNameTF`

``` swift
let patientLastNameTF
```

### `doneButton`

``` swift
let doneButton
```

### `informationLabel`

``` swift
let informationLabel
```

### `selectedTextField`

``` swift
var selectedTextField
```

## Methods

### `viewDidLoad()`

``` swift
override func viewDidLoad()
```

### `textFieldDidBeginEditing(_:)`

Checks when the text field begins editing, assigns the responder based on that

``` swift
func textFieldDidBeginEditing(_ textField: UITextField)
```

### `keyboardWillShow(notification:)`

raises the view when keyboard appears

``` swift
@objc func keyboardWillShow(notification: NSNotification)
```

### `keyboardWillHide(notification:)`

lowers the view when keybaord disappers

``` swift
@objc func keyboardWillHide(notification: NSNotification)
```

### `informationLabelSetup()`

Setup function for  information label on the view. Specifies the location, size and the syle of it

``` swift
func informationLabelSetup()
```

### `careTakerFirstNameTFSetup()`

Setup function for  caretaker first name textfield on the view. Specifies the location, size and the syle of it

``` swift
func careTakerFirstNameTFSetup()
```

### `careTakerLastNameTFSetup()`

Setup function for  care taker last name textfield on the view. Specifies the location, size and the syle of it

``` swift
func careTakerLastNameTFSetup()
```

### `patientFirstNameTFSetup()`

Setup function for  patient first name text field on the view. Specifies the location, size and the syle of it

``` swift
func patientFirstNameTFSetup()
```

### `patientLastNameTFSetup()`

Setup function for  patient last name text field on the view. Specifies the location, size and the syle of it

``` swift
func patientLastNameTFSetup()
```

### `doneButtonSetup()`

Setup function for  done button on the view. Specifies the location, size and the syle of it

``` swift
func doneButtonSetup()
```

### `doneButtonClicked()`

action for when the done button is tapped. It uploads the data to firebase

``` swift
@objc func doneButtonClicked()
```
