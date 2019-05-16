//
//  ViewController.swift
//  HAM
//
//  Created by Greg Katechis on 4/24/19.
//  Copyright © 2019 Greg Katechis. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet var handleGesture: UILongPressGestureRecognizer!
    
    var audioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sound = Bundle.main.path(forResource: "HAM", ofType: "mp3")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        } catch {
            print(error)
        }
        //Set the audio session to playback to ignore mute switch on device
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
        } catch {
            //Didn't work
        }
    }

    @IBAction func play(_ sender: Any) {
        audioPlayer.play()
    }
    @IBAction func handleGesture(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .began
        {
            let alertController = UIAlertController(title: nil, message:
                "Long-Press Gesture Detected", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default,handler: nil))
            
            present(alertController, animated: true, completion: nil)
        }
    }
    
}
