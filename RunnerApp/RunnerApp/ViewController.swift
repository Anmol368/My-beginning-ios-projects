//
//  ViewController.swift
//  RunnerApp
//
//  Created by Anmol Kumar on 05/12/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var playBtn: UIButton!
    var time = 0
    var timer = Timer()
    
    var buttonState = true

    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = "00"
        // Do any additional setup after loading the view.
    }

    @IBAction func playBtnTapped(_ sender: Any) {
        if buttonState {
            playBtn.setTitle("Pause", for: .normal)
            buttonState = false
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.addToTime), userInfo: nil, repeats: true)
        } else {
            playBtn.setTitle("Start", for: .normal)
            buttonState = true
            timer.invalidate()
        }
        
    }
    
    @IBAction func stopBtnTapped(_ sender: Any) {
        timer.invalidate()
        time = 0
        timeLabel.text = "00"
        playBtn.setTitle("Start", for: .normal)
        buttonState = true
    }
    
    @IBAction func resetBtnTapped(_ sender: Any) {
        timer.invalidate()
        time = 0
        timeLabel.text = "00"
        playBtn.setTitle("Start", for: .normal)
        buttonState = true
    }
    
    @objc func addToTime(){
        time += 1
        timeLabel.text = "\(time)"
    }
    
}

