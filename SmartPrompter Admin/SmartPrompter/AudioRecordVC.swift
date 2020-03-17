//
//  AudioRecordVC.swift
//  SmartPrompter
//
//  Created by Likhon Gomes on 3/15/20.
//  Copyright © 2020 Likhon Gomes. All rights reserved.
//

import UIKit
import AVFoundation
import Firebase

class AudioRecordVC: UIViewController, AVAudioRecorderDelegate {

//    var recordButton = UIButton()
//    var recordingSession = AVAudioSession()
//    var audioRecorder = AVAudioRecorder()
    
    var recordButton = UIButton()
    var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!
    var audioFilename:URL? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        recordButtonSetup()
        
        recordingSession = AVAudioSession.sharedInstance()

        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
            recordingSession.requestRecordPermission() { [unowned self] allowed in
                DispatchQueue.main.async {
                    if allowed {
                        self.loadRecordingUI()
                    } else {
                        // failed to record!
                    }
                }
            }
        } catch {
            // failed to record!
        }

        
    }
    
    func recordButtonSetup() {
        view.addSubview(recordButton)
        recordButton.translatesAutoresizingMaskIntoConstraints = false
        recordButton.heightAnchor.constraint(equalToConstant: 200).isActive = true
        recordButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        recordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        recordButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        recordButton.backgroundColor = .red
        recordButton.setTitle("Record", for: .normal)
    }
    

    func loadRecordingUI() {
        //recordButton = UIButton(frame: CGRect(x: 64, y: 64, width: 128, height: 64))
        recordButton.setTitle("Tap to Record", for: .normal)
        recordButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title1)
        recordButton.addTarget(self, action: #selector(recordTapped), for: .touchUpInside)
        view.addSubview(recordButton)
    }
    
    
    
    func startRecording() {
        audioFilename = getDocumentsDirectory().appendingPathComponent("recording.m4a")
        //directoryString = audioFilename
        print("directory \(audioFilename)")
        
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]

        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename!, settings: settings)
            audioRecorder.delegate = self
            audioRecorder.record()

            recordButton.setTitle("Tap to Stop", for: .normal)
        } catch {
            finishRecording(success: false)
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func finishRecording(success: Bool) {
        audioRecorder.stop()
        audioRecorder = nil

        if success {
            recordButton.setTitle("Tap to Re-record", for: .normal)
        } else {
            recordButton.setTitle("Tap to Record", for: .normal)
            // recording failed :(
        }
    }
    
    @objc func recordTapped() {
        if audioRecorder == nil {
            startRecording()
        } else {
            finishRecording(success: true)
            uploadToFirebase()
        }
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            finishRecording(success: false)
        }
    }
    
    func uploadToFirebase() {
        print("uploading audio to firebase")
        let audioName = NSUUID().uuidString //You'll get unique audioFile name
        let storageRef = Storage.storage().reference().child("\(userID!)").child("audio")
        let metadata  = StorageMetadata()
        
        

        // Create a reference to the file you want to upload
        let riversRef = storageRef.child("/patientCall.m4a")
        print("audio file name \(audioFilename)")
        if audioFilename != nil {
            // Upload the file to the path "images/rivers.jpg"
            let uploadTask = riversRef.putFile(from: audioFilename!, metadata: nil) { metadata, error in
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
                print("downloadURL \(downloadURL)")
              }
            }
        }
    }
    
    
}
