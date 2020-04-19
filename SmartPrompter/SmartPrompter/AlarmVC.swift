//
//  NewAlarmVC.swift
//  SmartPrompter
//
//  Created by Likhon Gomes on 9/9/19.
//  Copyright © 2019 Likhon Gomes. All rights reserved.
//

import UIKit
import UserNotifications
import FirebaseStorage

protocol AlarmVCDelegate {
    func reloadTableDelegate()
}

/// The alarm view controller that is show after a row on the table is tapped
class AlarmVC: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    let backButton = UIButton()
    let saveButton = UIButton()
    let cancelButton = UIButton()
    let deleteButton = UIButton()
    let buttonStack = UIStackView()
    
    let alarmDetailsLabel = UILabel()
    let instructionLabel = UITextView()
    let dateLabel = UILabel()
    let timeLabel = UILabel()
    var alarmDelegate:AlarmVCDelegate? = nil
    
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
    let pictureSlider = UISlider()
    let imageView = UIImageView()
    var notificationTitle:Any?
    let takenImageViewer = UIImageView()
    var alarmIndex = Int()
    
    
    
    /// Main function of the view controller, all the important UI and rest of the alarm meta data are downloaded here.
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
        takenImageViewSetup()
        if(alarm.status == "Incomplete"){
            imageView.image = #imageLiteral(resourceName: "camera")
            pictureSliderSetup()
            slider.isHidden = true
            instructionLabel.text = "On My Way"
            alarmDetailsLabel.text = "Take a picture to confirm"
            instructionLabel.text = "Move the slider to the right when you are ready to take a picture, or to the right to set a reminder to take a picture later."
        }
        
        let date = Date()
        let calendar = Calendar.current
        
        
        
        
        ///Downoloading all the alarm meta data available from firebase
        ref.child("Patients").child(userID!).child("Alarms").child(alarm.firebaseID!).child("acknowledgeHour").setValue(calendar.component(.hour, from: date))
        ref.child("Patients").child(userID!).child("Alarms").child(alarm.firebaseID!).child("acknowledgeMinute").setValue(calendar.component(.minute, from: date))
        ref.child("Patients").child(userID!).child("Alarms").child(alarm.firebaseID!).child("acknowledgeMonth").setValue(calendar.component(.month, from: date))
        ref.child("Patients").child(userID!).child("Alarms").child(alarm.firebaseID!).child("acknowledgeDay").setValue(calendar.component(.day, from: date))
        ref.child("Patients").child(userID!).child("Alarms").child(alarm.firebaseID!).child("acknowledgeYear").setValue(calendar.component(.year, from: date))
        ref.child("Patients").child(userID!).child("Alarms").child(alarm.firebaseID!).child("active").setValue(true)
        
        
        let storageRef = Storage.storage().reference().child("\(userID)")
        
        

    }
    
    ///Sets up the size/location/shape and style of the imageview
    func imageViewSetup() {
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        
        let islandRef = Storage.storage().reference().child("\(userID!)/\(alarm.label!)Icon")

        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        islandRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
          if let error = error {
            // Uh-oh, an error occurred!
            print("downloading image \(error)")
            self.imageView.image = #imageLiteral(resourceName: "alarm")
          } else {
            // Data for "images/island.jpg" is returned
            let image = UIImage(data: data!)
            if image != nil {
                self.imageView.image = image
            }
          }
        }
    }
    
    
    
    ///Sets up the size/location/shape and style of the date picker
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
    
    ///Sets up the size/location/shape and style of the imageview for take image
    func takenImageViewSetup() {
        view.addSubview(takenImageViewer)
        takenImageViewer.translatesAutoresizingMaskIntoConstraints = false
        takenImageViewer.topAnchor.constraint(equalTo: instructionLabel.bottomAnchor, constant: 10).isActive = true
        takenImageViewer.bottomAnchor.constraint(equalTo: slider.topAnchor, constant: -10).isActive = true
        takenImageViewer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        takenImageViewer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        takenImageViewer.contentMode = .scaleAspectFit
    }
    
    ///Sets up the size/location/shape and style of the time picker
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
    
    ///action when done button is tapped on date picker
    @objc func donedatePicker(){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        alarmDateTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    ///action when done button is tapped on time picker
    @objc func donetimePicker(){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        alarmTimeTextField.text = formatter.string(from: timePicker.date)
        self.view.endEditing(true)
    }
    
    ///Action to cancel date picker and make it disappear
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    
    
    
    
    
    
    /// Action when slider value is changed. Updates the current status of the alarm based on the direction of slide. If left, then add delay to the alarm. If right, update the data on firebase and prompt the user to the next step
    /// - Parameter sender: The slider object itself
    @objc func changeValue(_ sender: UISlider) {
        print("value is" , Int(sender.value));
        if(sender.value == 0){
            instructionLabel.text = "Remind me later"
            scheduler.rescheduleNotification(title: alarm.label!, id:alarm.firebaseID)
            
            let alert = UIAlertController(title: "Task Delayed", message: "Task delayed for 5 minutes", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                case .default:
                    self.dismiss(animated: true, completion: nil)
                case .cancel:
                    print("cancel")
                    
                case .destructive:
                    print("destructive")
                    
                    
                }}))
            alert.actions
            self.present(alert, animated: true, completion: {})

        } else if(sender.value == 100){
            
            let date = Date()
            let calendar = Calendar.current
            
            alarm.active = false
            alarm.status = "Incomplete"
            instructionLabel.text = "On My Way"
            alarmDetailsLabel.text = "Take a picture to confirm"
            instructionLabel.text = "Move the slider to the right when you are ready to take a picture, or to the right to set a reminder to take a picture later."
            imageView.image = #imageLiteral(resourceName: "camera")
            slider.isHidden = true
            pictureSliderSetup()
            //print("data I am looking for \(notificationTitle!)")
            var x = 0
            while (x<5){
                print("removed \(notificationTitle!)")
                UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["\(notificationTitle!)\(x)"])
                UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: ["\(notificationTitle!)\(x)"])
                print("cancelling notification \(notificationTitle!)\(x)")
                x+=1
            }
            
            
            
            ref.child("Patients").child(userID!).child("Alarms").child("\(alarm.firebaseID!)").child("status").setValue("Incomplete")
            ref.child("Patients").child(userID!).child("Alarms").child("\(alarm.firebaseID!)").child("acknowledgeHour").setValue(calendar.component(.hour, from: date))
            ref.child("Patients").child(userID!).child("Alarms").child("\(alarm.firebaseID!)").child("acknowledgeMinute").setValue(calendar.component(.minute, from: date))
            ref.child("Patients").child(userID!).child("Alarms").child("\(alarm.firebaseID!)").child("acknowledgeDay").setValue(calendar.component(.day, from: date))
            ref.child("Patients").child(userID!).child("Alarms").child("\(alarm.firebaseID!)").child("acknowledgeMonth").setValue(calendar.component(.month, from: date))
            ref.child("Patients").child(userID!).child("Alarms").child("\(alarm.firebaseID!)").child("acknowledgeYear").setValue(calendar.component(.year, from: date))
            
            
        }
    }
    
    
    /// Action when slider value is changed. Updates the current status of the alarm based on the direction of slide. If left, then add delay to the alarm. If right, update the data on firebase and prompt the user to the next step
    /// - Parameter sender: The slider object itself
    @objc func changeValuePictureSlider(_ sender: UISlider) {
        //print("value is" , Int(sender.value));
        if(sender.value == 0){
            instructionLabel.text = "Remind me later"
            
            scheduler.rescheduleNotification(title: alarm.label!, id:alarm.firebaseID)
            
            let alert = UIAlertController(title: "Task Delayed", message: "Task delayed for 5 minutes", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                case .default:
                    self.dismiss(animated: true, completion: nil)
                    
                case .cancel:
                    print("cancel")
                    
                case .destructive:
                    print("destructive")
                    
                    
                }}))
            alert.actions
            self.present(alert, animated: true, completion: {})
            
            
            print("scheduled again")
        } else if(sender.value == 100){
            
            
            var x = 0
            while (x<5){
                UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["\(notificationTitle!)\(x)"])
                UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: ["\(notificationTitle!)\(x)"])
                print("cancelling notification \(notificationTitle!)\(x)")
                x+=1
            }
            
            
            let vc = UIImagePickerController()
            vc.sourceType = .camera
            vc.allowsEditing = true
            vc.delegate = self
            present(vc, animated: true)
        }
    }
    
    
    
    
    /// Action when image picker is done picking image and returns it. It also uploads the image to firebase and updates the status of the alarm
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        guard let image = info[.editedImage] as? UIImage else {
            print("No image found")
            return
        }
        
        if image != nil {
            instructionLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
            instructionLabel.text = "Completed"
            instructionLabel.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            takenImageViewer.image = image
            pictureSlider.isHidden = true
            
            let date = Date()
            let calendar = Calendar.current
            slider.isHidden = true
            ref.child("Patients").child(userID!).child("Alarms").child("\(alarm.firebaseID!)").child("status").setValue("Complete")
            ref.child("Patients").child(userID!).child("Alarms").child("\(alarm.firebaseID!)").child("completionHour").setValue(calendar.component(.hour, from: date))
            ref.child("Patients").child(userID!).child("Alarms").child("\(alarm.firebaseID!)").child("completionMinute").setValue(calendar.component(.minute, from: date))
            ref.child("Patients").child(userID!).child("Alarms").child("\(alarm.firebaseID!)").child("completionDay").setValue(calendar.component(.day, from: date))
            ref.child("Patients").child(userID!).child("Alarms").child("\(alarm.firebaseID!)").child("completionMonth").setValue(calendar.component(.month, from: date))
            ref.child("Patients").child(userID!).child("Alarms").child("\(alarm.firebaseID!)").child("completionYear").setValue(calendar.component(.year, from: date))
            
            
            if alarm.year == calendar.component(.year, from: date) && alarm.month == calendar.component(.month, from: date) && alarm.day == calendar.component(.day, from: date) {
                completedTask += 1
            }
            
            
            dismiss(animated: true, completion: {
                
                
                self.alarmDelegate!.reloadTableDelegate()
                //alarmDelegate.
                activeAlarm.remove(at: self.alarmIndex)})
            let vc = RewardVC()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        }
        
        // Data in memory
        guard let imageData = image.jpegData(compressionQuality: 0.1) else {
            return
        }
        
        
        
        
        let storageRef = Storage.storage().reference()
        // Create a reference to the file you want to upload
        let riversRef = storageRef.child("\(userID!)/\(alarmNameTextField.text!)")
        // Upload the file to the path "images/rivers.jpg"
        let uploadTask = riversRef.putData(imageData, metadata: nil) { (metadata, error) in
            guard let metadata = metadata else {
                // Uh-oh, an error occurred!
                return
            }
            // Metadata contains file metadata such as size, content-type.
            let size = metadata.size
            // You can also access to download URL after upload.
            riversRef.downloadURL { (url, error) in
                guard let downloadURL = url else {
                    // Uh-oh, an error occurred!
                    return
                }
            }
        }
        
        
        // print out the image size as a test
        print(image.size)
    }
}







extension AlarmVC {
    
    ///Sets up the size/location/shape and style of the alarm date text field
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
    
    ///Sets up the size/location/shape and style of the instruction label
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
    
    ///Sets up the size/location/shape and style of the alarm details label
    func alarmDetailsLabelSetup() {
        view.addSubview(alarmDetailsLabel)
        alarmDetailsLabel.translatesAutoresizingMaskIntoConstraints = false
        alarmDetailsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        alarmDetailsLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        alarmDetailsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 210).isActive = true
        alarmDetailsLabel.text = "It's time to complete your task:"
        alarmDetailsLabel.font = UIFont.systemFont(ofSize: 18)
        
    }
    
    ///Sets up the size/location/shape and style of the alarm name text field
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
    }
    
    
    ///Sets up the size/location/shape and style of the back button
    func backButtonSetup() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        backButton.setBackgroundImage(UIImage(named: "back"), for: .normal)
        backButton.contentMode = .scaleAspectFill
        backButton.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
    }
    
    
    ///Action for back button when clicked, takes the user back to the previous screen
    @objc func backButtonClicked() {
        dismiss(animated: true, completion: nil)
    }
    
    ///Sets up the size/location/shape and style of the label for the status label
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
    
    ///Sets up the size/location/shape and style of the slider
    func sliderSetup() {
        self.view.addSubview(slider)
        //slider.frame = CGRect(x: 0, y: 0, width: 250, height: 35)
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        slider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        slider.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
        slider.heightAnchor.constraint(equalToConstant: 20).isActive = true
        slider.center = self.view.center
        
        slider.minimumTrackTintColor = .red
        slider.maximumTrackTintColor = .green
        slider.thumbTintColor = .purple
        
        slider.maximumValue = 100
        slider.minimumValue = 0
        slider.setValue(50, animated: false)
        
        slider.addTarget(self, action: #selector(changeValue(_:)), for: .valueChanged)
        
        
    }
    
    ///Sets up the size/location/shape and style of the slider
    func pictureSliderSetup() {
        self.view.addSubview(pictureSlider)
        //slider.frame = CGRect(x: 0, y: 0, width: 250, height: 35)
        pictureSlider.translatesAutoresizingMaskIntoConstraints = false
        pictureSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        pictureSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        pictureSlider.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        pictureSlider.heightAnchor.constraint(equalToConstant: 20).isActive = true
        pictureSlider.center = self.view.center
        pictureSlider.minimumTrackTintColor = .red
        pictureSlider.maximumTrackTintColor = .green
        pictureSlider.thumbTintColor = .purple
        
        pictureSlider.maximumValue = 100
        pictureSlider.minimumValue = 0
        pictureSlider.setValue(50, animated: false)
        
        pictureSlider.addTarget(self, action: #selector(changeValuePictureSlider(_:)), for: .valueChanged)
    }
    
}
