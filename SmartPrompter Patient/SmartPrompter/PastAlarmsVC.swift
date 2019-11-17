//
//  PastAlarmsVC.swift
//  SmartPrompter
//
//  Created by Likhon Gomes on 9/10/19.
//  Copyright © 2019 Likhon Gomes. All rights reserved.
//

import UIKit
import SQLite3
import GRDB

class PastAlarmsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var inactiveAlarm = [Alarm]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inactiveAlarm.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = alarmTable.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath as IndexPath) as! UITableViewCell
        cell.textLabel?.text = inactiveAlarm[indexPath.row].label
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = NewAlarmVC()
        //vc.alarmDateTextField.text = inactiveAlarm[indexPath.row].date
        //vc.alarmTimeTextField.text = inactiveAlarm[indexPath.row].time
        vc.alarmNameTextField.text = inactiveAlarm[indexPath.row].label
        vc.alarmTimeTextField.text =  "\(inactiveAlarm[indexPath.row].hour):\(inactiveAlarm[indexPath.row].minute)"
        vc.statusStatusLabel.text = "Status: \(inactiveAlarm[indexPath.row].status!)"
        
        vc.editable = false
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }

    let backButton = UIButton()
    let alarmTable = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addNavigationBar(viewControllerName: "Past Alarms", leftButton: backButton)
        view.backgroundColor = .white
        backButtonSetup()
        alarmTableSetup()
        fetchFromFirebase()
        alarmTable.reloadData()
    }
    
    func backButtonSetup() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        //backButton.leadingAnchor.constraint(equalTo: navView.leadingAnchor, constant: 5).isActive = true
        //backButton.bottomAnchor.constraint(equalTo: navView.bottomAnchor, constant: -5).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        //backButton.backgroundColor = .blue
        backButton.setBackgroundImage(UIImage(named: "backButton"), for: .normal)
        backButton.contentMode = .scaleAspectFill
        backButton.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
    }
    
    @objc func backButtonClicked() {
        dismiss(animated: true, completion: nil)
    }
    
    func alarmTableSetup() {
        view.addSubview(alarmTable)
        alarmTable.translatesAutoresizingMaskIntoConstraints = false
        alarmTable.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        alarmTable.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        alarmTable.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        alarmTable.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        alarmTable.register(UITableViewCell.self, forCellReuseIdentifier: "tableCell")
        alarmTable.delegate = self
        alarmTable.dataSource = self

    }
    
    func fetchFromFirebase(){
        //activeAlarm = [Alarm]()
        inactiveAlarm = [Alarm]()
        ref.child("Patients").child(userID!).child("Alarms").observe(.childAdded, with: { (snapshot) in
        
          let value = snapshot.value as? NSDictionary
            let singleAlarm = Alarm()
            singleAlarm.active = value?["active"] as? Bool
            singleAlarm.hour = value?["hour"] as? Int
            singleAlarm.minute = value?["minute"] as? Int
            singleAlarm.label = value?["label"] as? String
            singleAlarm.status = value?["status"] as? String
            
            
            if(singleAlarm.active == true){
                //activeAlarm.append(singleAlarm)
            } else {
                self.inactiveAlarm.append(singleAlarm)
            }
            
            self.alarmTable.reloadData()
            //print("Printing snapshot \(snapshot)")
            
            //print("printing data ..... \(self.alarms[0].minute)")
          // ...
          }) { (error) in
            print(error.localizedDescription)
        }
    }

    

}
