//
//  NewAlarmVC.swift
//  SmartPrompter
//
//  Created by Likhon Gomes on 9/9/19.
//  Copyright © 2019 Likhon Gomes. All rights reserved.
//

import UIKit

class AlarmVC: UIViewController {
    
    let backButton = UIButton()
    let saveButton = UIButton()
    let cancelButton = UIButton()
    let deleteButton = UIButton()
    let buttonStack = UIStackView()
    
    let alarmDetailsLabel = UILabel()
    let alarmNameLabel = UILabel()
    let dateLabel = UILabel()
    let timeLabel = UILabel()
    
    
    let alarmNameTextField = UITextField()
    let alarmDateTextField = UITextField()
    let alarmTimeTextField = UITextView()
    let statusLabel = UILabel()
    let statusStatusLabel = UILabel()
    
    let datePicker = UIDatePicker()
    let timePicker = UIDatePicker()
    let slider = UISlider()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addNavigationBar(viewControllerName: "SmartPrompter", leftButton: backButton)
        alarmDetailsLabelSetup()
        
        
        
        alarmNameTextFieldSetup()
        alarmNameLabelSetup()
        //dateLabelSetup()
        //alarmDateTextFieldSetup()
        //timeLabelSetup()
        //alarmTimeTextFieldSetup()
        //statusLabelSetup()
        //statusStatusLabelSetup()
        backButtonSetup()
        //buttonStackSetup()
        //saveButtonSetup()
        //cancelButtonSetup()
        //deleteButtonSetup()
        //showDatePicker()
        //showTimePicker()
        sliderSetup()
        
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
    }
    
    func alarmNameLabelSetup() {
        view.addSubview(alarmNameLabel)
        alarmNameLabel.translatesAutoresizingMaskIntoConstraints = false
        //alarmNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //alarmNameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        alarmNameLabel.topAnchor.constraint(equalTo: alarmNameTextField.bottomAnchor, constant: 15).isActive = true
        alarmNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        alarmNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        alarmNameLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        //alarmNameLabel.backgroundColor = .black
        alarmNameLabel.text = "Move the slider to the RIGHT when you're ready to complete the task, or to let the LEFT to set a reminder to do the task later."
        alarmNameLabel.font = UIFont.systemFont(ofSize: 18)
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
        alarmNameTextField.placeholder = "Name of Task"
        alarmNameTextField.font = UIFont.boldSystemFont(ofSize: 22)
        
        //alarmNameTextField.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        //alarmNameTextField.layer.borderWidth = 0.5
        //alarmNameTextField.
    }
    
    
    
    func backButtonSetup() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        backButton.setBackgroundImage(UIImage(named: "backButton"), for: .normal)
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
        
        slider.frame = CGRect(x: 0, y: 0, width: 250, height: 35)
        slider.center = self.view.center
        
        slider.minimumTrackTintColor = .green
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .black
        
        slider.maximumValue = 100
        slider.minimumValue = 0
        slider.setValue(50, animated: false)
        
        slider.addTarget(self, action: #selector(changeVlaue(_:)), for: .valueChanged)
        
        self.view.addSubview(slider)
    }
    
    @objc func changeVlaue(_ sender: UISlider) {
        print("value is" , Int(sender.value));
    }

}