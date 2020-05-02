//
//  ViewController.swift
//  SmartPrompter
//
//  Created by Likhon Gomes on 9/5/19.
//  Copyright © 2019 Likhon Gomes. All rights reserved.
//

import UIKit

///View controller that asks for user's information
class UserInfoVC: UIViewController, UITextFieldDelegate {
    
    let careTakerFirstNameTF = UITextField()
    let careTakerLastNameTF = UITextField()
    let patientFirstNameTF = UITextField()
    let patientLastNameTF = UITextField()
    let doneButton = UIButton()
    let informationLabel = UILabel()
    var selectedTextField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.2470588235, green: 0.7019607843, blue: 0.3098039216, alpha: 1)
        // Do any additional setup after loading the view.
        informationLabelSetup()
        careTakerFirstNameTFSetup()
        careTakerLastNameTFSetup()
        patientFirstNameTFSetup()
        patientLastNameTFSetup()
        doneButtonSetup()
        hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

        
    }
    
    ///Checks when the text field begins editing, assigns the responder based on that
    func textFieldDidBeginEditing(_ textField: UITextField) {
        selectedTextField = textField
    }
    ///raises the view when keyboard appears
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            func textFieldDidBeginEditing(_ textField: UITextField) {
                selectedTextField = textField
            }
        }
    }
    ///lowers the view when keybaord disappers
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    ///Setup function for  information label on the view. Specifies the location, size and the syle of it
    func informationLabelSetup() {
        view.addSubview(informationLabel)
        informationLabel.translatesAutoresizingMaskIntoConstraints = false
        informationLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        informationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        informationLabel.text = "Information"
        informationLabel.font = UIFont.boldSystemFont(ofSize: 36)
        informationLabel.textColor = .white
    }
    
    ///Setup function for  caretaker first name textfield on the view. Specifies the location, size and the syle of it
    func careTakerFirstNameTFSetup() {
        view.addSubview(careTakerFirstNameTF)
        careTakerFirstNameTF.delegate = self
        careTakerFirstNameTF.translatesAutoresizingMaskIntoConstraints = false
        careTakerFirstNameTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        careTakerFirstNameTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        careTakerFirstNameTF.heightAnchor.constraint(equalToConstant: 40).isActive = true
        careTakerFirstNameTF.topAnchor.constraint(equalTo: informationLabel.bottomAnchor, constant: 50).isActive = true
        //careTakerFirstNameTF.textAlignment = .center
        careTakerFirstNameTF.placeholder = "Care Taker First Name"
        careTakerFirstNameTF.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        careTakerFirstNameTF.backgroundColor = .white
        careTakerFirstNameTF.layer.borderWidth = 0.5
    }
    ///Setup function for  care taker last name textfield on the view. Specifies the location, size and the syle of it
    func careTakerLastNameTFSetup() {
        view.addSubview(careTakerLastNameTF)
        careTakerLastNameTF.delegate = self
        careTakerLastNameTF.translatesAutoresizingMaskIntoConstraints = false
        careTakerLastNameTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        careTakerLastNameTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        careTakerLastNameTF.heightAnchor.constraint(equalToConstant: 40).isActive = true
        careTakerLastNameTF.topAnchor.constraint(equalTo: careTakerFirstNameTF.bottomAnchor, constant: 20).isActive = true
        //careTakerLastNameTF.textAlignment = .center
        careTakerLastNameTF.placeholder = "Care Taker Last Name"
        careTakerLastNameTF.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        careTakerLastNameTF.backgroundColor = .white
        careTakerLastNameTF.layer.borderWidth = 0.5
    }
    ///Setup function for  patient first name text field on the view. Specifies the location, size and the syle of it
    func patientFirstNameTFSetup() {
        view.addSubview(patientFirstNameTF)
        patientFirstNameTF.delegate = self
        patientFirstNameTF.translatesAutoresizingMaskIntoConstraints = false
        patientFirstNameTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        patientFirstNameTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        patientFirstNameTF.heightAnchor.constraint(equalToConstant: 40).isActive = true
        patientFirstNameTF.topAnchor.constraint(equalTo: careTakerLastNameTF.bottomAnchor, constant: 20).isActive = true
        //patientFirstNameTF.textAlignment = .center
        patientFirstNameTF.placeholder = "Patient First Name"
        patientFirstNameTF.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        patientFirstNameTF.backgroundColor = .white
        patientFirstNameTF.layer.borderWidth = 0.5
    }
    ///Setup function for  patient last name text field on the view. Specifies the location, size and the syle of it
    func patientLastNameTFSetup() {
        view.addSubview(patientLastNameTF)
        patientLastNameTF.delegate = self
        patientLastNameTF.translatesAutoresizingMaskIntoConstraints = false
        patientLastNameTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        patientLastNameTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        patientLastNameTF.heightAnchor.constraint(equalToConstant: 40).isActive = true
        patientLastNameTF.topAnchor.constraint(equalTo: patientFirstNameTF.bottomAnchor, constant: 20).isActive = true
        //patientLastNameTF.textAlignment = .center
        patientLastNameTF.placeholder = "Patient Last Name"
        patientLastNameTF.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        patientLastNameTF.backgroundColor = .white
        patientLastNameTF.layer.borderWidth = 0.5
    }
    
    ///Setup function for  done button on the view. Specifies the location, size and the syle of it
    func doneButtonSetup(){
        view.addSubview(doneButton)
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        doneButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        doneButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        doneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        doneButton.backgroundColor = .white
        doneButton.setTitle("Done", for: .normal)
        doneButton.addTarget(self, action: #selector(doneButtonClicked), for: .touchUpInside)
        doneButton.setTitleColor(.black, for: .normal)
    }
    
    ///action for when the done button is tapped. It uploads the data to firebase
    @objc func doneButtonClicked() {
        ref.child("Patients").child(userID!).child("PatientData").setValue(["patientFirstName": patientFirstNameTF.text!,"patientLastName":patientLastNameTF.text!,"careTakerFirstName":careTakerFirstNameTF.text!,"careTakerLastName":careTakerLastNameTF.text!])
        
        let vc = AudioRecordVC()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }


}

