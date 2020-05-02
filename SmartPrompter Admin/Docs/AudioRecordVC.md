# AudioRecordVC

Class for recording audio for alarm sound

``` swift
class AudioRecordVC: RootViewController, AVAudioRecorderDelegate, AVAudioPlayerDelegate
```

## Inheritance

[`RootViewController`](RootViewController), `AVAudioPlayerDelegate`, `AVAudioRecorderDelegate`

## Properties

### `recordButton`

``` swift
var recordButton
```

### `playButton`

``` swift
let playButton
```

### `instruction`

``` swift
let instruction
```

### `nextButton`

``` swift
let nextButton
```

### `recordingSession`

``` swift
var recordingSession: AVAudioSession!
```

### `audioRecorder`

``` swift
var audioRecorder: AVAudioRecorder!
```

### `audioPlayer`

``` swift
var audioPlayer: AVAudioPlayer?
```

### `audioFilename`

``` swift
var audioFilename: URL?
```

## Methods

### `viewDidLoad()`

``` swift
override func viewDidLoad()
```

### `loadAudioPlayer()`

loads the audio player to play the sound on device

``` swift
func loadAudioPlayer()
```

### `audioPlayerDidFinishPlaying(_:successfully:)`

Checks if the audio player finished playing the sound, then change the play button

``` swift
func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool)
```

### `loadRecordingUI()`

Loads the button button to record. Sets title and adds target

``` swift
func loadRecordingUI()
```

### `startRecording()`

Starts the recording session on device

``` swift
func startRecording()
```

### `getDocumentsDirectory()`

Gets the documents directory of the audio stored

``` swift
func getDocumentsDirectory() -> URL
```

### `finishRecording(success:)`

Finishes the recording session and clears memory to nil

``` swift
func finishRecording(success: Bool)
```

### `topLeftButtonTapped()`

Action for top left button when tapped. Takes the user back to the main vc

``` swift
override func topLeftButtonTapped()
```

### `recordTapped()`

action for when the record button is tapped. Starts the audio session or stops

``` swift
@objc func recordTapped()
```

### `audioRecorderDidFinishRecording(_:successfully:)`

Checks if the audio recorder did finish recording. Sets the flag according to that

``` swift
func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool)
```

### `uploadToFirebase()`

Uploads the recorded audio to firebase

``` swift
func uploadToFirebase()
```

### `playButtonSetup()`

Setup function for  play button on the view. Specifies the location, size and the syle of it

``` swift
func playButtonSetup()
```

### `playButtonTapped()`

action for when play button is tapped. Plays the audio if not playing, stops the audio if playing

``` swift
@objc func playButtonTapped()
```

### `recordButtonSetup()`

Setup function for  record button on the view. Specifies the location, size and the syle of it

``` swift
func recordButtonSetup()
```

### `instructionTextViewSetup()`

Setup function for  instruction text view on the view. Specifies the location, size and the syle of it

``` swift
func instructionTextViewSetup()
```

### `nextButtonSetup()`

Setup function for  next button on the view. Specifies the location, size and the syle of it

``` swift
func nextButtonSetup()
```

### `nextButtonTapped()`

Action for when next buton is tapped. Takes the usre to Main VC

``` swift
@objc func nextButtonTapped()
```
