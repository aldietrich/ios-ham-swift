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
    
    var audioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sound = Bundle.main.path(forResource: "HAM", ofType: "mp3")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        } catch {
            print(error)
        }
    }


    @IBAction func play(_ sender: Any) {
        audioPlayer.play()
    }
    
}
