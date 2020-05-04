# SignInVC

View controller to handle sign in functionalities

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

Attaches a user listener before the view appears

``` swift
override func viewWillAppear(_ animated: Bool)
```

### `keyboardWillShow(notification:)`

raises the view when the keyboard shows up

``` swift
@objc func keyboardWillShow(notification: NSNotification)
```

### `keyboardWillHide(notification:)`

lowers the view when the keyboard disappears

``` swift
@objc func keyboardWillHide(notification: NSNotification)
```

### `viewDidLoad()`

``` swift
override func viewDidLoad()
```

### `logoImageSetup()`

Setup function for  logo on the view. Specifies the location, size and the syle of it

``` swift
func logoImageSetup()
```

### `loginButtonSetup()`

Setup function for  login button on the view. Specifies the location, size and the syle of it

``` swift
func loginButtonSetup()
```

### `loginButtonTapped()`

action for when login button is tapped. Checks with firebase and logs the user in

``` swift
@objc func loginButtonTapped()
```

### `errorMessageViewSetup()`

Setup function for  error mesage on the view. Specifies the location, size and the syle of it

``` swift
func errorMessageViewSetup()
```

### `signUpButtonSetup()`

Setup function for  signup button on the view. Specifies the location, size and the syle of it

``` swift
func signUpButtonSetup()
```

### `signUpButtonTapped()`

action for when signup button is tapped. It registers the user on firebase

``` swift
@objc func signUpButtonTapped()
```

### `emailTFSetup()`

Setup function for  email textfield on the view. Specifies the location, size and the syle of it

``` swift
func emailTFSetup()
```

### `passwordTFSetup()`

Setup function for  password textfield on the view. Specifies the location, size and the syle of it

``` swift
func passwordTFSetup()
```

### `backButtonSetup()`

Setup function for  back button on the view. Specifies the location, size and the syle of it

``` swift
func backButtonSetup()
```
