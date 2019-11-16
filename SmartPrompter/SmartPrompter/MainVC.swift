//
//  MainVC.swift
//  SmartPrompter
//
//  Created by Likhon Gomes on 9/5/19.
//  Copyright © 2019 Likhon Gomes. All rights reserved.
//

import UIKit
import UserNotifications
import Firebase

extension MainVC:UNUserNotificationCenterDelegate{
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
//        let content = notification.request.content
//        let intervalTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
//        let repeatRequest = UNNotificationRequest(identifier: "repeatAlarm", content: content, trigger: intervalTrigger)
//
//
//        UNUserNotificationCenter.current().add(repeatRequest) { (error) in
//            print(error as Any)
//        }

        print("alarm delivered \(notification.request.content.title)")
        completionHandler([.alert,.sound,.badge])
    }
    
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let application = UIApplication.shared
        if(application.applicationState == .active){
            print("user tapped the notification bar when the app is in foreground")
            
            guard let userInfo = response.notification.request.content.userInfo as? NSDictionary else {
                print("Notification.userInfo is empty")
                completionHandler()
                return
            }
            
            let vc = AlarmVC()
            vc.alarm.label = userInfo["title"] as! String
            vc.alarm.firebaseID = userInfo["FirebaseID"] as! String
            vc.alarm.hour = userInfo["hour"] as! Int
            vc.alarm.minute = userInfo["minute"] as! Int
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .crossDissolve
            print("Printing notification data .... \(userInfo)")
            present(vc, animated: true, completion: nil)
        }
        
        if(application.applicationState == .inactive){
            
            guard let userInfo = response.notification.request.content.userInfo as? NSDictionary else {
                print("Notification.userInfo is empty")
                completionHandler()
                return
            }

            let vc = AlarmVC()
            vc.alarm.label = userInfo["title"] as! String
            vc.alarm.firebaseID = userInfo["FirebaseID"] as! String
            vc.alarm.hour = userInfo["hour"] as! Int
            vc.alarm.minute = userInfo["minute"] as! Int
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .crossDissolve
            present(vc, animated: true, completion: nil)
        }
        
      // tell the app that we have finished processing the user’s action / response
      completionHandler()
    }

}



class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let newAlarmButton = UIButton()
    let viewAlarmButton = UIButton()
    let pastAlarmsButton = UIButton()
    let stack = UIStackView()
    
    let upperQuad = UIView()
    let lowerQuad = UIView()
    let welcomeTextView = UILabel()
    let clockLabel = UILabel()
    let topBar = UIView()
    let timeLabel = UILabel()
    
    var timer = Timer()
    var date = Date()
    let calendar = Calendar.current
    let dateFormatter = DateFormatter()
    
    
    var ref: DatabaseReference!

    
    
    let alarmTable = UITableView()
    //let data = ["Ula","La","La","La","Le","Yo"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activeAlarm.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = alarmTable.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath as IndexPath) as! UITableViewCell
        cell.textLabel?.text = activeAlarm[indexPath.row].label
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = AlarmVC()
        vc.alarm = activeAlarm[indexPath.row]
        //vc.alarmDateTextField.text = activeAlarm[indexPath.row].date
        vc.alarmTimeTextField.text = "\(activeAlarm[indexPath.row].hour):\(activeAlarm[indexPath.row].minute)"
        vc.alarmNameTextField.text = activeAlarm[indexPath.row].label
        //vc.statusStatusLabel.text = "\(activeAlarm[indexPath.row].active!)"
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        //scheduleNotification()
    }
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        ref = Database.database().reference()

        super.viewDidLoad()
        view.backgroundColor = .white
        fetchFromFirebase()
        print("alarm count ... \(activeAlarm.count)")
        //view.addNavigationBar(viewControllerName: "SmartPrompter Admin")
        topViewSetup()
        stackSetup()
        welcomeTextViewSetup()
        timeLabelSetup()
        clockLabelSetup()
        alarmTableSetup()
        
        ref = Database.database().reference()

        self.ref.child("Patients").child(Auth.auth().currentUser!.uid).child("PatientData").setValue(["patientFirstName": "Ada","patientLastName":"Lovelace","careTakerFirstName":"Anabelle","careTakerLastName":"Young"])
        
        //self.ref.child("Patients").child(Auth.auth().currentUser!.uid).child("Alarms").child("0").setValue(["label":"Water the dog","hour":"06","minute":"30", "active":"true"])
        
        
        
        let userID = Auth.auth().currentUser?.uid
        ref.child("Patients").child(userID!).child("Alarms").observeSingleEvent(of: .value, with: { (snapshot) in
          // Get user value
          let value = snapshot.value as? NSDictionary
          let username = value?["label"] as? String ?? ""
          //let user = User(username: username)
            print(username)
          // ...
          }) { (error) in
            print(error.localizedDescription)
        }
        
        
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().delegate = self
        } else {
            // Fallback on earlier versions
        }
        
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .medium
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimeLabel), userInfo: nil, repeats: true)
        
                
        
        
    }
    
    @objc func updateTimeLabel() {
        clockLabel.text = dateFormatter.string(from: Date())
        //print("")
    }
    
    func alarmTableSetup() {
        view.addSubview(alarmTable)
        alarmTable.translatesAutoresizingMaskIntoConstraints = false
        alarmTable.topAnchor.constraint(equalTo: topBar.bottomAnchor).isActive = true
        alarmTable.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        alarmTable.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        alarmTable.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        alarmTable.register(UITableViewCell.self, forCellReuseIdentifier: "tableCell")
        alarmTable.delegate = self
        alarmTable.dataSource = self
        
    }
    
    
    func topViewSetup() {
        view.addSubview(topBar)
        topBar.translatesAutoresizingMaskIntoConstraints = false
        topBar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topBar.heightAnchor.constraint(equalToConstant: 200).isActive = true
        topBar.backgroundColor = #colorLiteral(red: 0.1843137255, green: 0.2039215686, blue: 0.5647058824, alpha: 1)
    }
    
    func timeLabelSetup() {
        view.addSubview(timeLabel)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.topAnchor.constraint(equalTo: welcomeTextView.bottomAnchor, constant: 25).isActive = true
        timeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        timeLabel.textColor = .white
        timeLabel.font = UIFont.boldSystemFont(ofSize: 18)
        timeLabel.text = "Current Time:"
    }
    
    
    func welcomeTextViewSetup() {
        view.addSubview(welcomeTextView)
        welcomeTextView.translatesAutoresizingMaskIntoConstraints = false
        welcomeTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        welcomeTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        welcomeTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 15).isActive = true
        //welcomeTextView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        //welcomeTextView.backgroundColor = .clear
        //welcomeTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //welcomeTextView.bottomAnchor.constraint(equalTo: stack.topAnchor, constant: -50).isActive = true
        welcomeTextView.text = "SmartPrompter"
        welcomeTextView.textAlignment = .center
        welcomeTextView.font = UIFont.boldSystemFont(ofSize: 20)
        welcomeTextView.textColor = .white
        //welcomeTextView.backgroundColor = .black
    }
    
    func clockLabelSetup() {
        view.addSubview(clockLabel)
        clockLabel.translatesAutoresizingMaskIntoConstraints = false
        clockLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        clockLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //clockLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        clockLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 5).isActive = true
        //clockLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        //clockLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //clockLabel.bottomAnchor.constraint(equalTo: stack.topAnchor, constant: -50).isActive = true
        clockLabel.text = "08:31:33 AM"
        clockLabel.textAlignment = .center
        clockLabel.font = UIFont.boldSystemFont(ofSize: 40)
        clockLabel.textColor = .white
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
    }
    
    @objc func newAlarmButtonClicked() {
        let vc = AlarmVC()
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
    }
    
    @objc func pastAlarmButtonClicked() {
        let vc = PastAlarmsVC()
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }
    
    func fetchFromFirebase(){
        let userID = Auth.auth().currentUser?.uid
        ref.child("Patients").child(userID!).child("Alarms").observe(.childAdded, with: { (snapshot) in
            
        
          let value = snapshot.value as? NSDictionary
            let singleAlarm = Alarm()
            singleAlarm.firebaseID = snapshot.key
            singleAlarm.active = value?["active"] as? Bool
            singleAlarm.hour = value?["hour"] as? Int
            singleAlarm.minute = value?["minute"] as? Int
            singleAlarm.label = value?["label"] as? String
            
            
            if(singleAlarm.active == true){
                activeAlarm.append(singleAlarm)
            }
            
            var dateComponents = DateComponents()
            dateComponents.hour = singleAlarm.hour
            dateComponents.minute = singleAlarm.minute
            let scheduler = AlarmScheduler()
            
            scheduler.scheduleNotification(title: singleAlarm.label!, dateComponents: dateComponents, id:singleAlarm.firebaseID!)
            
            
            
            self.alarmTable.reloadData()

            print("Printing snapshot \(snapshot)")
            
            //print("printing data ..... \(self.alarms[0].minute)")
          // ...
          }) { (error) in
            print(error.localizedDescription)
        }
        
    }
}





