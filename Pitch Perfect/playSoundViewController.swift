//
//  playSoundViewController.swift
//  Pitch Perfect
//
//  Created by Tenzin Sishe on 3/2/16.
//  Copyright © 2016 Tenzin Sishe. All rights reserved.
//

import UIKit
import AVFoundation

class playSoundViewController: UIViewController {
 
    var audioPlayer : AVAudioPlayer! // declare audio player
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        //NSBundle.mainBundle().URLForResource("movie_quote", withExtension: "mp3") another way to write below codes = line20 and line 21
       if let filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType:"mp3")
       {
          let filePathUrl = NSURL.fileURLWithPath(filePath)// string to NSURL
           audioPlayer = try!
           AVAudioPlayer(contentsOfURL: filePathUrl) //initialize
           audioPlayer.enableRate = true
        }else{
            print("the filepath is empty")
        }
    }
    @IBAction func PlaySlowSound(sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.currentTime = 0.0 // starts again
       audioPlayer.rate = 0.3
        audioPlayer.play()
    }
    
    @IBAction func PlayFastAudio(sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.currentTime = 0.0 // starts again
        audioPlayer.rate = 3.3
        audioPlayer.play()
    }
    @IBAction func StopPlaying(sender: UIButton) {
        audioPlayer.stop()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
