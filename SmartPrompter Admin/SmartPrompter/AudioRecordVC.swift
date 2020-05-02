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

///Class for recording audio for alarm sound
class AudioRecordVC: RootViewController, AVAudioRecorderDelegate, AVAudioPlayerDelegate {

//    var recordButton = UIButton()
//    var recordingSession = AVAudioSession()
//    var audioRecorder = AVAudioRecorder()
    
    var recordButton = UIButton()
    let playButton = UIButton()

    let instruction = UITextView()

    let nextButton = UIButton()
    
    var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!
    var audioPlayer: AVAudioPlayer?
    var audioFilename:URL? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.2470588235, green: 0.7019607843, blue: 0.3098039216, alpha: 1)
        viewControllerLabelSetup(labelType: .sub)
        viewContollerLabel.text = "Alarm Sound"
        viewContollerLabel.textColor = .white
        topLeftButtonSetup(buttonType: .square)
        topLeftButton.setImage(#imageLiteral(resourceName: "back"), for: .normal)
        recordButtonSetup()
        playButtonSetup()
        instructionTextViewSetup()
        nextButtonSetup()
        
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
    
    ///loads the audio player to play the sound on device
    func loadAudioPlayer() {
        let audioURL = getDocumentsDirectory().appendingPathComponent("recording.m4a")
        //MARK: Audio Player
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
            audioPlayer?.delegate = self
            audioPlayer?.prepareToPlay()
        } catch {
            playButton.isHidden = true
        }
    }
    
    ///Checks if the audio player finished playing the sound, then change the play button
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        playButton.isSelected = false
        print("audio stopped")
    }
    
    ///Loads the button button to record. Sets title and adds target
    func loadRecordingUI() {
        //recordButton = UIButton(frame: CGRect(x: 64, y: 64, width: 128, height: 64))
        recordButton.setTitle("Tap to Record", for: .normal)
        recordButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title1)
        recordButton.addTarget(self, action: #selector(recordTapped), for: .touchUpInside)
        view.addSubview(recordButton)
    }
    
    
    ///Starts the recording session on device
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
    
    ///Gets the documents directory of the audio stored
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    ///Finishes the recording session and clears memory to nil
    func finishRecording(success: Bool) {
        audioRecorder.stop()
        audioRecorder = nil
        loadAudioPlayer()
        playButton.isHidden = false
        if success {
            recordButton.setTitle("Tap to Re-record", for: .normal)
        } else {
            recordButton.setTitle("Tap to Record", for: .normal)
            // recording failed :(
        }
    }
    
    ///Action for top left button when tapped. Takes the user back to the main vc
    override func topLeftButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    ///action for when the record button is tapped. Starts the audio session or stops
    @objc func recordTapped() {
        if audioRecorder == nil {
            startRecording()
        } else {
            finishRecording(success: true)
            uploadToFirebase()
        }
    }
    
    ///Checks if the audio recorder did finish recording. Sets the flag according to that
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            finishRecording(success: false)
        }
    }
    
    ///Uploads the recorded audio to firebase
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
    ///Setup function for  play button on the view. Specifies the location, size and the syle of it
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
    
    ///action for when play button is tapped. Plays the audio if not playing, stops the audio if playing
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
    
    ///Setup function for  record button on the view. Specifies the location, size and the syle of it
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
    
    ///Setup function for  instruction text view on the view. Specifies the location, size and the syle of it
    func instructionTextViewSetup(){
        view.addSubview(instruction)
        instruction.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            instruction.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70).isActive = true
        } else {
            instruction.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        }
        instruction.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        instruction.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        instruction.heightAnchor.constraint(equalToConstant: 150).isActive = true
        instruction.text = "Press the red button to record a Notification tone for your client. Press the red button again to stop recording. Press the white play button to play back the recording. Press done button afterwards"
        instruction.font = UIFont.systemFont(ofSize: 18)
        instruction.textAlignment = .center
        instruction.backgroundColor = .clear
        instruction.textColor = .white
    }
    

    ///Setup function for  next button on the view. Specifies the location, size and the syle of it
    func nextButtonSetup() {
        view.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        nextButton.setTitle("Next", for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    ///Action for when next buton is tapped. Takes the usre to Main VC
    @objc func nextButtonTapped(){
        let vc = MainVC()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }
    
}
