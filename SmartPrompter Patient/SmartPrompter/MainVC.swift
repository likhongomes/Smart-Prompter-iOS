//
//  MainVC.swift
//  SmartPrompter
//
//  Created by Likhon Gomes on 9/5/19.
//  Copyright © 2019 Likhon Gomes. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    let newAlarmButton = UIButton()
    let viewAlarmButton = UIButton()
    let pastAlarmsButton = UIButton()
    let stack = UIStackView()
    
    let upperQuad = UIView()
    let lowerQuad = UIView()
    let welcomeTextView = UITextView()
    let secondTextView = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //view.addNavigationBar(viewControllerName: "SmartPrompter Admin")
        
        stackSetup()
        welcomeTextViewSetup()
        secondTextViewSetup()
        newAlarmButtonSetup()
        viewAlarmButtonSetup()
        pastAlarmsButtonSetup()
        
        let date = Date(timeIntervalSinceNow: 3600)
        let triggerDate = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second,], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
        
        
        
    }
    
    func welcomeTextViewSetup() {
        view.addSubview(welcomeTextView)
        welcomeTextView.translatesAutoresizingMaskIntoConstraints = false
        welcomeTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        welcomeTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        welcomeTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        welcomeTextView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        //welcomeTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //welcomeTextView.bottomAnchor.constraint(equalTo: stack.topAnchor, constant: -50).isActive = true
        welcomeTextView.text = "Welcome to SmartPrompter Admin!"
        welcomeTextView.textAlignment = .center
        welcomeTextView.font = UIFont.boldSystemFont(ofSize: 25)
        welcomeTextView.textColor = .gray
        //welcomeTextView.backgroundColor = .black
    }
    
    func secondTextViewSetup() {
        view.addSubview(secondTextView)
        secondTextView.translatesAutoresizingMaskIntoConstraints = false
        secondTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        secondTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        secondTextView.topAnchor.constraint(equalTo: welcomeTextView.bottomAnchor, constant: 10).isActive = true
        secondTextView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        //secondTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //secondTextView.bottomAnchor.constraint(equalTo: stack.topAnchor, constant: -50).isActive = true
        secondTextView.text = "Please select an opertation from the the options below"
        secondTextView.textAlignment = .center
        secondTextView.font = UIFont.systemFont(ofSize: 18)
        secondTextView.textColor = .gray
    }
    
    
    
    func stackSetup() {
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 15
        stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        stack.addArrangedSubview(newAlarmButton)
        stack.addArrangedSubview(viewAlarmButton)
        stack.addArrangedSubview(pastAlarmsButton)
    }
    
    func newAlarmButtonSetup() {
        //view.addSubview(newAlarmButton)
        newAlarmButton.translatesAutoresizingMaskIntoConstraints = false
        newAlarmButton.backgroundColor = .red
        newAlarmButton.setTitle("Create New Alarm", for: .normal)
        //newAlarmButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        newAlarmButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        newAlarmButton.addTarget(self, action: #selector(newAlarmButtonClicked), for: .touchUpInside)
        newAlarmButton.layer.cornerRadius = 20
    }
    
    @objc func newAlarmButtonClicked() {
        let vc = NewAlarmVC()
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }
    
    func viewAlarmButtonSetup() {
        //view.addSubview(viewAlarmButton)
        viewAlarmButton.translatesAutoresizingMaskIntoConstraints = false
        viewAlarmButton.backgroundColor = .red
        viewAlarmButton.setTitle("View Current Alarm", for: .normal)
        //viewAlarmButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        viewAlarmButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        viewAlarmButton.topAnchor.constraint(equalTo: newAlarmButton.bottomAnchor, constant: 10).isActive = true
        viewAlarmButton.addTarget(self, action: #selector(viewAlarmButtonClicked), for: .touchUpInside)
        viewAlarmButton.layer.cornerRadius = 20
    }
    
    @objc func viewAlarmButtonClicked() {
        let vc = CurrentAlarmVC()
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }

    
    func pastAlarmsButtonSetup() {
        //view.addSubview(pastAlarmsButton)
        pastAlarmsButton.translatesAutoresizingMaskIntoConstraints = false
        pastAlarmsButton.backgroundColor = .red
        pastAlarmsButton.setTitle("View Past Alarms", for: .normal)
        //pastAlarmsButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        pastAlarmsButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        pastAlarmsButton.topAnchor.constraint(equalTo: viewAlarmButton.bottomAnchor, constant: 10).isActive = true
        pastAlarmsButton.addTarget(self, action: #selector(pastAlarmButtonClicked), for: .touchUpInside)
        pastAlarmsButton.layer.cornerRadius = 20
    }
    
    @objc func pastAlarmButtonClicked() {
        let vc = PastAlarmsVC()
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }
    
    


    
    
}
