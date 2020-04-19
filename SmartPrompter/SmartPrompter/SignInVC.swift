//
//  ViewController.swift
//  VetPlusPlus
//
//  Created by Likhon Gomes on 9/29/19.
//  Copyright © 2019 Likhon Gomes. All rights reserved.
//

import UIKit
import FirebaseAnalytics
import Firebase
import FirebaseAuth

class SignInVC: UIViewController {
    
    let loginButton = UIButton()
    let signUpButton = UIButton()
    let guestButton = UIButton()
    let emailTF = UITextField()
    let passwordTF = UITextField()
    let backButton = UIButton()
    let logoImage = UIImageView()
    let errorMessageView = UITextView()
    
    ///Adds a authentication listener to see if the user is signed in
    override func viewWillAppear(_ animated: Bool) {
        var handle = Auth.auth().addStateDidChangeListener { (auth, user) in
          // ...
        }
    }
    
    
    /// Raises the view when the keybaord appears
    /// - Parameter notification: The notification observer that the keyboard has appeared
   @objc func keyboardWillShow(notification: NSNotification) {
       if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
           if self.view.frame.origin.y == 0 {
               self.view.frame.origin.y -= keyboardSize.height
           }
       }
   }
   
    
    /// Lowers the view when the keyboard disappears
    /// - Parameter notification: The notification observer that the keybaord has disappeard
   @objc func keyboardWillHide(notification: NSNotification) {
       if self.view.frame.origin.y != 0 {
           self.view.frame.origin.y = 0
       }
   }
    
    /// Main function of this view controller. All the important tasks are done here such as loading the UI, adding listener for the keyboard etc.
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        //signUpButtonSetup()
        loginButtonSetup()
        passwordTFSetup()
        emailTFSetup()
        backButtonSetup()
        logoImageSetup()
        errorMessageViewSetup()
    }
    
    ///Sets up the size/location/shape and style of the error message textview
    func errorMessageViewSetup(){
        view.addSubview(errorMessageView)
        errorMessageView.translatesAutoresizingMaskIntoConstraints = false
        errorMessageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        errorMessageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        errorMessageView.bottomAnchor.constraint(equalTo: emailTF.topAnchor, constant: -20).isActive = true
        errorMessageView.isEditable = false
        errorMessageView.isSelectable = false
        errorMessageView.backgroundColor = .clear
        errorMessageView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        errorMessageView.textColor = .red
        errorMessageView.textAlignment = .center
        errorMessageView.isHidden = true
    }
    
    ///Sets up the size/location/shape and style of the logo image
    func logoImageSetup() {
        view.addSubview(logoImage)
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        logoImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        logoImage.image = UIImage(named: "logo")
        logoImage.contentMode = .scaleAspectFit
    }
    
    ///Sets up the size/location/shape and style of the login button
    func loginButtonSetup() {
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        loginButton.backgroundColor = .red
        loginButton.setTitle("Log in", for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
    }
    
    ///Action when the login button is tapped. Checks if all of the required fields are full and checks with firebase to authenticate
    @objc func loginButtonTapped() {
        Auth.auth().signIn(withEmail: self.emailTF.text!, password: self.passwordTF.text!) { [weak self] authResult, error in
          guard let strongSelf = self else { return }
            if error == nil {
                let vc = MainVC()
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .fullScreen
                self?.present(vc, animated: true, completion: nil)
            } else {
                print("Error occured \(error?.localizedDescription)")
                self!.errorMessageView.text = error?.localizedDescription
                self!.errorMessageView.isHidden = false
            }
        }
    }
    
    ///Sets up the size/location/shape and style of the signup button
    func signUpButtonSetup() {
        view.addSubview(signUpButton)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signUpButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        signUpButton.backgroundColor = .red
        signUpButton.setTitle("Sign up", for: .normal)
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
    
    ///Action when the signup button is tapped. Registers the user in firebase
    @objc func signUpButtonTapped() {
        if(emailTF.text != "" && passwordTF.text != ""){
        Auth.auth().createUser(withEmail: self.emailTF.text!, password: self.passwordTF.text!) { authResult, error in
                if error == nil {
                    print("Sign up Success")
                    let vc = MainVC()
                    vc.modalTransitionStyle = .crossDissolve
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true, completion: nil)
                } else {
                    print(error)
                    self.errorMessageView.text = error?.localizedDescription
                    self.errorMessageView.isHidden = false
                }
            }
        }
    }
    
    ///Sets up the size/location/shape and style of the email textfield
    func emailTFSetup() {
        view.addSubview(emailTF)
        emailTF.translatesAutoresizingMaskIntoConstraints = false
        emailTF.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailTF.bottomAnchor.constraint(equalTo: passwordTF.topAnchor, constant: -10).isActive = true
        emailTF.heightAnchor.constraint(equalToConstant: 40).isActive = true
        emailTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        emailTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        emailTF.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        emailTF.textColor = .black
        emailTF.attributedPlaceholder = NSAttributedString(string: "Email",
                                                           attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        emailTF.layer.borderWidth = 0.5
        //emailTF.placeholder = "Username"
    }
    
    ///Sets up the size/location/shape and style of the password textfield
    func passwordTFSetup() {
        view.addSubview(passwordTF)
        passwordTF.translatesAutoresizingMaskIntoConstraints = false
        passwordTF.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTF.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -10).isActive = true
        passwordTF.heightAnchor.constraint(equalToConstant: 40).isActive = true
        passwordTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        passwordTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        passwordTF.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        passwordTF.textColor = .black
        passwordTF.attributedPlaceholder = NSAttributedString(string: "Password",
                                                           attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        passwordTF.layer.borderWidth = 0.5
        //passwordTF.placeholder = "Password"
    }
    
    ///Sets up the size/location/shape and style of the back button
    func backButtonSetup() {
        view.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        backButton.backgroundColor = .clear
        backButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        backButton.setImage(UIImage(named: "back"), for: .normal)
        
    }
}

