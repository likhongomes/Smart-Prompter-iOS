# SignInVC

``` swift
class SignInVC: UIViewController
```

## Inheritance

`UIViewController`

## Properties

### `loginButton`

``` swift
let loginButton
```

### `signUpButton`

``` swift
let signUpButton
```

### `guestButton`

``` swift
let guestButton
```

### `emailTF`

``` swift
let emailTF
```

### `passwordTF`

``` swift
let passwordTF
```

### `backButton`

``` swift
let backButton
```

### `logoImage`

``` swift
let logoImage
```

### `errorMessageView`

``` swift
let errorMessageView
```

## Methods

### `viewWillAppear(_:)`

Adds a authentication listener to see if the user is signed in

``` swift
override func viewWillAppear(_ animated: Bool)
```

### `keyboardWillShow(notification:)`

Raises the view when the keybaord appears

``` swift
@objc func keyboardWillShow(notification: NSNotification)
```

#### Parameters

  - notification: The notification observer that the keyboard has appeared

### `keyboardWillHide(notification:)`

Lowers the view when the keyboard disappears

``` swift
@objc func keyboardWillHide(notification: NSNotification)
```

#### Parameters

  - notification: The notification observer that the keybaord has disappeard

### `viewDidLoad()`

Main function of this view controller. All the important tasks are done here such as loading the UI, adding listener for the keyboard etc.

``` swift
override func viewDidLoad()
```

### `errorMessageViewSetup()`

Sets up the size/location/shape and style of the error message textview

``` swift
func errorMessageViewSetup()
```

### `logoImageSetup()`

Sets up the size/location/shape and style of the logo image

``` swift
func logoImageSetup()
```

### `loginButtonSetup()`

Sets up the size/location/shape and style of the login button

``` swift
func loginButtonSetup()
```

### `loginButtonTapped()`

Action when the login button is tapped. Checks if all of the required fields are full and checks with firebase to authenticate

``` swift
@objc func loginButtonTapped()
```

### `signUpButtonSetup()`

Sets up the size/location/shape and style of the signup button

``` swift
func signUpButtonSetup()
```

### `signUpButtonTapped()`

Action when the signup button is tapped. Registers the user in firebase

``` swift
@objc func signUpButtonTapped()
```

### `emailTFSetup()`

Sets up the size/location/shape and style of the email textfield

``` swift
func emailTFSetup()
```

### `passwordTFSetup()`

Sets up the size/location/shape and style of the password textfield

``` swift
func passwordTFSetup()
```

### `backButtonSetup()`

Sets up the size/location/shape and style of the back button

``` swift
func backButtonSetup()
```
