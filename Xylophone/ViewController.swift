//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var timer = Timer()
    var totalTime = 0.2
    var secondsPassed = 0.0
    var player: AVAudioPlayer!
    var isPassed = false
    var buttonPress: UIButton?
    @IBAction func keyboard(_ sender: UIButton) {
        sender.alpha = 0.5
        buttonPress = sender
        isPassed = false
        timer.invalidate()
        secondsPassed = 0
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        playSound(nada: sender.currentTitle!)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1.0
        } else {
            timer.invalidate()
            isPassed = true
            buttonPress!.alpha = 1
        }
    }
    func playSound(nada : String) {
        let url = Bundle.main.url(forResource: nada, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}

