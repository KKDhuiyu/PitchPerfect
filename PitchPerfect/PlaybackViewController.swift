//
//  PlaybackViewController.swift
//  PitchPerfect
//
//  Created by Huiyu Jia on 3/15/17.
//  Copyright © 2017 HUIYU JIA. All rights reserved.
//

import UIKit
import AVFoundation

class PlaybackViewController: UIViewController {


    @IBOutlet weak var slowButton: UIButton!
    @IBOutlet weak var fastButton: UIButton!
    @IBOutlet weak var lowPitchButton: UIButton!
    @IBOutlet weak var highPitchutton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    var recordedAudioURL:URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    enum ButtonTag: Int { case slow = 0,fast,low,high,echo,reverb}

    @IBAction func playButtonOnClick(_ sender: UIButton) {
        switch(ButtonTag(rawValue : sender.tag)!){
            case .slow:
            playSound(rate: 0.5)
            case .fast:
            playSound(rate: 1.5)
            case .high:
            playSound(pitch: 1000)
            case .low:
            playSound(pitch: -1000)
            case .echo:
            playSound(echo: true)
            case .reverb:
            playSound(reverb: true)
        }
        configureUI(.playing)
    }

    @IBAction func stopButtonOnClick(_ sender: UIButton) {
        stopAudio();
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
