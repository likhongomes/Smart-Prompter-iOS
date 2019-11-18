//
//  NewAlarmVC.swift
//  SmartPrompter
//
//  Created by Likhon Gomes on 9/9/19.
//  Copyright © 2019 Likhon Gomes. All rights reserved.
//

import UIKit
import UserNotifications

class AlarmVC: UIViewController {
    
    let backButton = UIButton()
    let saveButton = UIButton()
    let cancelButton = UIButton()
    let deleteButton = UIButton()
    let buttonStack = UIStackView()
    
    let alarmDetailsLabel = UILabel()
    let instructionLabel = UITextView()
    let dateLabel = UILabel()
    let timeLabel = UILabel()
    
    var alarm = Alarm()
    //var firebaseID = String()
    //var alarmTitle = String()
    
    let alarmNameTextField = UITextField()
    let alarmDateTextField = UITextField()
    let alarmTimeTextField = UITextView()
    let statusLabel = UILabel()
    let statusStatusLabel = UILabel()
    
    let datePicker = UIDatePicker()
    let timePicker = UIDatePicker()
    let slider = UISlider()
    let imageView = UIImageView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addNavigationBar(viewControllerName: "SmartPrompter", leftButton: backButton)
        
        //alarm = fUtil.fetchOneObject(firebaseID: "-LsKsbxX-FvKnDjYR4-Y")
        
        alarmDetailsLabelSetup()
        alarmNameTextFieldSetup()
        instructionLabelSetup()
        backButtonSetup()
        sliderSetup()
        imageViewSetup()
        
        
        let date = Date()
        let calendar = Calendar.current
        

        
       
        
        ref.child("Patients").child(userID!).child("Alarms").child(alarm.firebaseID!).child("acknowledgeHour").setValue(calendar.component(.hour, from: date))
        ref.child("Patients").child(userID!).child("Alarms").child(alarm.firebaseID!).child("acknowledgeMinute").setValue(calendar.component(.minute, from: date))
        ref.child("Patients").child(userID!).child("Alarms").child(alarm.firebaseID!).child("acknowledgeMonth").setValue(calendar.component(.month, from: date))
        ref.child("Patients").child(userID!).child("Alarms").child(alarm.firebaseID!).child("acknowledgeDay").setValue(calendar.component(.day, from: date))
        ref.child("Patients").child(userID!).child("Alarms").child(alarm.firebaseID!).child("acknowledgeYear").setValue(calendar.component(.year, from: date))
        ref.child("Patients").child(userID!).child("Alarms").child(alarm.firebaseID!).child("active").setValue(true)
        
        
        //ref.child("Patients").child(userID!).child("Alarms").child("\(alarm.firebaseID!)").setValue(["acknowledgedHour":hour, "acknowledgedMinute":minute])
        

    }
    
    
    func imageViewSetup() {
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        imageView.image = UIImage(named: "alarm")
        
    }
    
    func showDatePicker(){
        //Formate Date
        datePicker.datePickerMode = .date
        
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        alarmDateTextField.inputAccessoryView = toolbar
        alarmDateTextField.inputView = datePicker
        
    }
    
    func showTimePicker(){
        //Formate Date
        timePicker.datePickerMode = .time
        
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donetimePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        alarmTimeTextField.inputAccessoryView = toolbar
        alarmTimeTextField.inputView = timePicker
        
    }
    
    @objc func donedatePicker(){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        alarmDateTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func donetimePicker(){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        alarmTimeTextField.text = formatter.string(from: timePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }

    
    
    
    func alarmDateTextFieldSetup() {
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "MM/dd/yyyy"
        let formattedDate = format.string(from: date)
        
        view.addSubview(alarmDateTextField)
        alarmDateTextField.translatesAutoresizingMaskIntoConstraints = false
        alarmDateTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        alarmDateTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        alarmDateTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        alarmDateTextField.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 2).isActive = true
        alarmDateTextField.text = formattedDate
        alarmDateTextField.textAlignment = .center
        alarmDateTextField.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        alarmDateTextField.layer.borderWidth = 0.5
        alarmDateTextField.isEnabled = false
    }
    
    func instructionLabelSetup() {
        view.addSubview(instructionLabel)
        instructionLabel.translatesAutoresizingMaskIntoConstraints = false
        //instructionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //instructionLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        instructionLabel.topAnchor.constraint(equalTo: alarmNameTextField.bottomAnchor, constant: 15).isActive = true
        instructionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        instructionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        instructionLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        //instructionLabel.backgroundColor = .black
        instructionLabel.text = "Move the slider to the RIGHT when you're ready to complete the task, or to let the LEFT to set a reminder to do the task later."
        instructionLabel.font = UIFont.systemFont(ofSize: 15)
        instructionLabel.textAlignment = .center
        instructionLabel.isEditable = false
        instructionLabel.isSelectable = false
        
    }
    
    func alarmDetailsLabelSetup() {
        view.addSubview(alarmDetailsLabel)
        alarmDetailsLabel.translatesAutoresizingMaskIntoConstraints = false
        alarmDetailsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        alarmDetailsLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        alarmDetailsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 210).isActive = true
        alarmDetailsLabel.text = "It's time to complete your task:"
        alarmDetailsLabel.font = UIFont.systemFont(ofSize: 18)
        
    }

    func alarmNameTextFieldSetup() {
        view.addSubview(alarmNameTextField)
        alarmNameTextField.translatesAutoresizingMaskIntoConstraints = false
        alarmNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        alarmNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        alarmNameTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        alarmNameTextField.topAnchor.constraint(equalTo: alarmDetailsLabel.bottomAnchor, constant: 5).isActive = true
        alarmNameTextField.textAlignment = .center
        alarmNameTextField.text = alarm.label
        alarmNameTextField.font = UIFont.boldSystemFont(ofSize: 22)
        alarmNameTextField.isEnabled = false
        
        //alarmNameTextField.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        //alarmNameTextField.layer.borderWidth = 0.5
        //alarmNameTextField.
    }
    
    
    
    func backButtonSetup() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        backButton.setBackgroundImage(UIImage(named: "back"), for: .normal)
        backButton.contentMode = .scaleAspectFill
        backButton.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
    }
    
    @objc func backButtonClicked() {
        dismiss(animated: true, completion: nil)
    }
    
    func statusStatusLabelSetup() {
        view.addSubview(statusStatusLabel)
        statusStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusStatusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        statusStatusLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        statusStatusLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 2).isActive = true
        if (statusStatusLabel.text == "1"){
            statusStatusLabel.text = "Active"
            statusStatusLabel.textColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        } else if (statusStatusLabel.text == "0"){
            statusStatusLabel.text = "Inactive"
            statusStatusLabel.textColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        }
        //statusStatusLabel.text = "Active"
        statusStatusLabel.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    func sliderSetup() {
        self.view.addSubview(slider)
        //slider.frame = CGRect(x: 0, y: 0, width: 250, height: 35)
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        slider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        slider.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        slider.heightAnchor.constraint(equalToConstant: 20).isActive = true
        slider.center = self.view.center
        
        slider.minimumTrackTintColor = .gray
        slider.maximumTrackTintColor = .gray
        slider.thumbTintColor = .purple
        
        slider.maximumValue = 100
        slider.minimumValue = 0
        slider.setValue(50, animated: false)
        
        slider.addTarget(self, action: #selector(changeValue(_:)), for: .valueChanged)
        
        
    }
    
   
    
    

    
    @objc func changeValue(_ sender: UISlider) {
        //print("value is" , Int(sender.value));
        if(sender.value == 0){
            instructionLabel.text = "Remind me later"
            
            
            
            
            
            var dateComponents = DateComponents()
            dateComponents.hour = alarm.hour
            //dateComponents.minute = alarm.minute!+1
            
            scheduler.scheduleNotification(title: alarm.label!, dateComponents: dateComponents, id:alarm.firebaseID)
            print("scheduled again")
        }else if(sender.value == 100){
            let vc = MainVC()
            
            vc.alarmTable.reloadData()
            alarm.active = false
            
            instructionLabel.text = "On My Way"
            let date = Date()
            let calendar = Calendar.current
            
            
            ref.child("Patients").child(userID!).child("Alarms").child("\(alarm.firebaseID!)").child("status").setValue("Complete")
            ref.child("Patients").child(userID!).child("Alarms").child("\(alarm.firebaseID!)").child("completionHour").setValue(calendar.component(.hour, from: date))
            ref.child("Patients").child(userID!).child("Alarms").child("\(alarm.firebaseID!)").child("completionMinute").setValue(calendar.component(.minute, from: date))
            ref.child("Patients").child(userID!).child("Alarms").child("\(alarm.firebaseID!)").child("completionDay").setValue(calendar.component(.day, from: date))
            ref.child("Patients").child(userID!).child("Alarms").child("\(alarm.firebaseID!)").child("completionMonth").setValue(calendar.component(.month, from: date))
            ref.child("Patients").child(userID!).child("Alarms").child("\(alarm.firebaseID!)").child("completionYear").setValue(calendar.component(.year, from: date))
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers:["repeatAlarm"])
        }
    }
    
    
    

}
