//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//
import AVFoundation


import UIKit

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?
   
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var titleLabel: UILabel!
    var hardnesscheck:[String:Int]=["Soft":5,"Medium":7,"Hard":12]
    var totalTime=0
    var timePassed=0
    var timer=Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        player?.stop()
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime=hardnesscheck[hardness]!
        
        progressBar.progress=0.0
        timePassed=0
        titleLabel.text=hardness
        
        
        timer=Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    @objc func updateTimer(){
        if timePassed<totalTime {
            timePassed+=1
            progressBar.progress=Float(timePassed)/Float(totalTime)
           
            
        }
        else
        {
            timer.invalidate()
           
            titleLabel.text="Done !"
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")!
            player = try! AVAudioPlayer(contentsOf: url)
            player?.play()
        }
    }
    
    

}
