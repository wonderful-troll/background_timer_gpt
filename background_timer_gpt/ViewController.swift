//
//  ViewController.swift
//  background_timer_gpt
//
//  Created by 이진흥 on 10/6/24.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    class ViewController: UIViewController {
        
        @IBOutlet weak var timerLabel: UILabel!
        @IBOutlet weak var startStopButton: UIButton!
        
        var timer: Timer?
        var timeRemaining: TimeInterval = 50
        var isTimerRunning = false
        
        override func viewDidLoad() {
            super.viewDidLoad()
            updateTimerLabel()
        }
        
        @IBAction func startStopButtonTapped(_ sender: UIButton) {
            if isTimerRunning {
                stopTimer()
            } else {
                startTimer()
            }
        }
        
        func startTimer() {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
                guard let self = self else { return }
                
                if self.timeRemaining > 0 {
                    self.timeRemaining -= 1
                    self.updateTimerLabel()
                } else {
                    self.stopTimer()
                }
            }
            
            isTimerRunning = true
            startStopButton.setTitle("정지", for: .normal)
        }
        
        func stopTimer() {
            timer?.invalidate()
            timer = nil
            isTimerRunning = false
            startStopButton.setTitle("시작", for: .normal)
        }
        
        func updateTimerLabel() {
            let minutes = Int(timeRemaining) / 60
            let seconds = Int(timeRemaining) % 60
            timerLabel.text = String(format: "%02d:%02d", minutes, seconds)
        }
    }

}

