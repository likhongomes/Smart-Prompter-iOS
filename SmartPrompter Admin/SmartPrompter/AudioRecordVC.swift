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

class AudioRecordVC: UIViewController, AVAudioRecorderDelegate, AVAudioPlayerDelegate {

//    var recordButton = UIButton()
//    var recordingSession = AVAudioSession()
//    var audioRecorder = AVAudioRecorder()
    
    var recordButton = UIButton()
    let playButton = UIButton()
    
    var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!
    var audioPlayer: AVAudioPlayer?
    var audioFilename:URL? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.2470588235, green: 0.7019607843, blue: 0.3098039216, alpha: 1)
        audioPlayer?.delegate = self
        
        recordButtonSetup()
        playButtonSetup()
        
        recordingSession = AVAudioSession.sharedInstance()

        //MARK: Recorder
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
        
        
        loadAudioPlayer()

        
    }
    
    func loadAudioPlayer() {
        let audioURL = getDocumentsDirectory().appendingPathComponent("recording.m4a")
        
        //MARK: Audio Player
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
            audioPlayer?.prepareToPlay()
        } catch {
            //print("Audio player error: \(error.localizedDescription)")
        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        playButton.isSelected = false
        print("audio stopped")
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
        loadAudioPlayer()
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

extension AudioRecordVC {
    
    func playButtonSetup(){
        view.addSubview(playButton)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        playButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        playButton.topAnchor.constraint(equalTo: recordButton.bottomAnchor, constant: 20).isActive = true
        playButton.setTitle("Play", for: .normal)
        playButton.setTitle("Stop", for: .selected)
        playButton.setTitleColor(#colorLiteral(red: 0.2470588235, green: 0.7019607843, blue: 0.3098039216, alpha: 1), for: .normal)
        playButton.backgroundColor = .white
        playButton.layer.cornerRadius = 50
        playButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
    }
    
    @objc func playButtonTapped(){
        if playButton.isSelected == true {
            playButton.isSelected = false
            audioPlayer?.stop()
        } else {
            playButton.isSelected = true
            audioPlayer?.play()
            print("Playing audio")
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
        recordButton.layer.cornerRadius = 100
        recordButton.setTitle("Record", for: .normal)
    }
    
}
