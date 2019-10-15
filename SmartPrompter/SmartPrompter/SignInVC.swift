//
//  ViewController.swift
//  VetPlusPlus
//
//  Created by Likhon Gomes on 9/29/19.
//  Copyright © 2019 Likhon Gomes. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {
    
    let loginButton = UIButton()
    let signUpButton = UIButton()
    let guestButton = UIButton()
    let emailTF = UITextField()
    let passwordTF = UITextField()
    let backButton = UIButton()
    let logoImage = UIImageView()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        guestButtonSetup()
        signUpButtonSetup()
        loginButtonSetup()
        passwordTFSetup()
        emailTFSetup()
        backButtonSetup()
        logoImageSetup()
    }
    
    func logoImageSetup() {
        view.addSubview(logoImage)
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
        logoImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
        logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        logoImage.image = UIImage(named: "logo")
        logoImage.contentMode = .scaleAspectFit
    }
    
    func loginButtonSetup() {
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: signUpButton.topAnchor, constant: -10).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        loginButton.backgroundColor = .red
        loginButton.setTitle("Log in", for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    @objc func loginButtonTapped() {
        let vc = dashboardVC()
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }
    
    func signUpButtonSetup() {
        view.addSubview(signUpButton)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signUpButton.bottomAnchor.constraint(equalTo: guestButton.topAnchor, constant: -30).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        signUpButton.backgroundColor = .red
        signUpButton.setTitle("Sign up", for: .normal)
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
    
    @objc func signUpButtonTapped() {
        
    }
    
    func guestButtonSetup() {
        view.addSubview(guestButton)
        guestButton.translatesAutoresizingMaskIntoConstraints = false
        guestButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        guestButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        guestButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        guestButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        guestButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        guestButton.backgroundColor = .red
        guestButton.setTitle("Continue as Guest", for: .normal)
        guestButton.addTarget(self, action: #selector(guestButtonTapped), for: .touchUpInside)
    }
    
    @objc func guestButtonTapped() {
        let vc = dashboardVC()
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }

    func emailTFSetup() {
        view.addSubview(emailTF)
        emailTF.translatesAutoresizingMaskIntoConstraints = false
        emailTF.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailTF.bottomAnchor.constraint(equalTo: passwordTF.topAnchor, constant: -10).isActive = true
        emailTF.heightAnchor.constraint(equalToConstant: 40).isActive = true
        emailTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        emailTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        emailTF.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        emailTF.layer.borderWidth = 0.5
        emailTF.placeholder = "Username"
    }
    
    func passwordTFSetup() {
        view.addSubview(passwordTF)
        passwordTF.translatesAutoresizingMaskIntoConstraints = false
        passwordTF.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTF.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -10).isActive = true
        passwordTF.heightAnchor.constraint(equalToConstant: 40).isActive = true
        passwordTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        passwordTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        passwordTF.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        passwordTF.layer.borderWidth = 0.5
        passwordTF.placeholder = "Password"
    }
    
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

