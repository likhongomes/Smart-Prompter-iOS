//
//  MainVC.swift
//  SmartPrompter
//
//  Created by Likhon Gomes on 9/5/19.
//  Copyright © 2019 Likhon Gomes. All rights reserved.
//

import UIKit
import Firebase
import CoreData

///The main view controller of the app, users see this viewcontroller first when they open the app
class MainVC: RootViewController {
    
    let newAlarmButton = UIButton()
    let viewAlarmButton = UIButton()
    let pastAlarmsButton = UIButton()
    let stack = UIStackView()
    
    let upperQuad = UIView()
    let lowerQuad = UIView()
    let secondTextView = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.2470588235, green: 0.7019607843, blue: 0.3098039216, alpha: 1)
        viewControllerLabelSetup(labelType: .main)
        topLeftButtonSetup(buttonType: .rectangle)
        topLeftButton.setTitleColor(.white, for: .normal)
        topLeftButton.setTitle("Sound", for: .normal)
        
        topRightButtonSetup(buttonType: .rectangle)
        topRightButton.setTitleColor(.white, for: .normal)
        topRightButton.setTitle("Logout", for: .normal)
        
        viewContollerLabel.text = "SmartPrompter"
        viewContollerLabel.textColor = .white
        
        
        
        buttonStack.addArrangedSubview(newAlarmButton)
        buttonStack.addArrangedSubview(viewAlarmButton)
        buttonStack.addArrangedSubview(pastAlarmsButton)
        buttonStack.axis = .vertical
        buttonStack.spacing = 10
        
        secondTextViewSetup()
        newAlarmButtonSetup()
        viewAlarmButtonSetup()
        pastAlarmsButtonSetup()
        
        
        
        let date = Date(timeIntervalSinceNow: 3600)
        let triggerDate = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second,], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
        
        let fileManager = FileManager.default
        
        let soundsDirectoryURL = fileManager.urls(for: .libraryDirectory, in: .userDomainMask).first!.appendingPathComponent("Sounds")

        //attempt to create the folder
        do {
            try fileManager.createDirectory(atPath: soundsDirectoryURL.path,
                                            withIntermediateDirectories: true, attributes: nil)
        } catch let error as NSError {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    ///action for when the top left button is tapped. It prompts the user to record the alarm sound and preview it
    override func topLeftButtonTapped() {
        let vc = AudioRecordVC()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    ///Action for when the top right button is tapped. Here it logs out the user
    override func topRightButtonTapped() {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            let vc = SignInVC()
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .crossDissolve
            self.present(vc, animated: true, completion: nil)
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
    }
    
    

    ///Setup function for  second text view on the view. Specifies the location, size and the syle of it
    func secondTextViewSetup() {
        view.addSubview(secondTextView)
        secondTextView.translatesAutoresizingMaskIntoConstraints = false
        secondTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        secondTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        secondTextView.topAnchor.constraint(equalTo: viewContollerLabel.bottomAnchor, constant: 10).isActive = true
        secondTextView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        //secondTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //secondTextView.bottomAnchor.constraint(equalTo: stack.topAnchor, constant: -50).isActive = true
        secondTextView.text = "Please select an opertation from the options below"
        secondTextView.textAlignment = .center
        secondTextView.font = UIFont.systemFont(ofSize: 18)
        secondTextView.textColor = .white
        secondTextView.isEditable = false
        secondTextView.isSelectable = false
        secondTextView.backgroundColor = .clear
    }
    
    ///Setup function for  new alarm button on the view. Specifies the location, size and the syle of it
    func newAlarmButtonSetup() {
        //view.addSubview(newAlarmButton)
        newAlarmButton.translatesAutoresizingMaskIntoConstraints = false
        newAlarmButton.backgroundColor = .white
        newAlarmButton.setTitleColor(.black, for: .normal)
        newAlarmButton.setTitle("Create New Alarm", for: .normal)
        //newAlarmButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        newAlarmButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        newAlarmButton.addTarget(self, action: #selector(newAlarmButtonClicked), for: .touchUpInside)
        newAlarmButton.layer.cornerRadius = 20
    }
    
    ///Action for when new alarm button is clicked. It takes the user to Create New Alarm View Controller
    @objc func newAlarmButtonClicked() {
        let vc = CreateNewAlarmVC()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    ///Setup function for  view alarm button on the view. Specifies the location, size and the syle of it
    func viewAlarmButtonSetup() {
        //view.addSubview(viewAlarmButton)
        viewAlarmButton.translatesAutoresizingMaskIntoConstraints = false
        viewAlarmButton.backgroundColor = .white
        viewAlarmButton.setTitleColor(.black, for: .normal)
        viewAlarmButton.setTitle("View Current Alarm", for: .normal)
        //viewAlarmButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        viewAlarmButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        viewAlarmButton.topAnchor.constraint(equalTo: newAlarmButton.bottomAnchor, constant: 10).isActive = true
        viewAlarmButton.addTarget(self, action: #selector(viewAlarmButtonClicked), for: .touchUpInside)
        viewAlarmButton.layer.cornerRadius = 20
    }
    
    ///action for when the view alarm button is clicked. Takes the user to Current Alarm ListVC
    @objc func viewAlarmButtonClicked() {
        let vc = CurrentAlarmListVC()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }

    
    ///Setup function for  past alarm button on the view. Specifies the location, size and the syle of it
    func pastAlarmsButtonSetup() {
        //view.addSubview(pastAlarmsButton)
        pastAlarmsButton.translatesAutoresizingMaskIntoConstraints = false
        pastAlarmsButton.backgroundColor = .white
        pastAlarmsButton.setTitleColor(.black, for: .normal)
        pastAlarmsButton.setTitle("View Past Alarms", for: .normal)
        //pastAlarmsButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        pastAlarmsButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        pastAlarmsButton.topAnchor.constraint(equalTo: viewAlarmButton.bottomAnchor, constant: 10).isActive = true
        pastAlarmsButton.addTarget(self, action: #selector(pastAlarmButtonClicked), for: .touchUpInside)
        pastAlarmsButton.layer.cornerRadius = 20
    }
    
    ///Action for when past alarm button is clicked. Presents pastAlarmVC
    @objc func pastAlarmButtonClicked() {
        let vc = PastAlarmListVC()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}

