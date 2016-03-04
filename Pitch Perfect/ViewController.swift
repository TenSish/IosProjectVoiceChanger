//
//  RecordSoundsViewController.swift
//  Pitch Perfect
//
//  Created by Tenzin Sishe on 3/1/16.
//  Copyright © 2016 Tenzin Sishe. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioPlayerDelegate {
    
    var audioRecorder:AVAudioRecorder! // declare audioRecorder globally
   
   
    @IBOutlet weak var RecordingAudio: UILabel!
    @IBOutlet weak var stopaudio: UIButton!
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        stopaudio.hidden=true
        RecordingAudio.hidden=true
    }


    @IBAction func RecordAudio(sender: AnyObject) {
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        //formatter.dateFormat = "ddMMyyyy-HHmmss" // file with specified date/time to ensure that each recording is unique
        let recordingName = "my_audio.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        print(filePath)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        try! audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
        audioRecorder.delegate = self
        
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        stopaudio.hidden = false
        RecordingAudio.hidden = false
    }
    @IBAction func StopRecording(sender: UIButton) {
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
}

