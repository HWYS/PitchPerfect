//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by HtetWaiYanSwe on 23/12/2020.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chimpunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL: URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, varder, echo, reverb
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
        // Do any additional setup after loading the view.
        setButtonImageAspectRatio(buttons: [snailButton, chimpunkButton, rabbitButton, vaderButton, echoButton, reverbButton, stopButton])
    }
    
    func setButtonImageAspectRatio(buttons: [UIButton])  {
        
        for btn in buttons {
            btn.imageView?.contentMode = .scaleAspectFit
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
        
    @IBAction func playSoundForButton(_ sender: UIButton) {
        
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .varder:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
            
        }
        
        configureUI(.playing)
    }
    
    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        
        stopAudio()
    }

   
}
