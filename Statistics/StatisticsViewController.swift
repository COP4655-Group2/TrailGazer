//
//  StatisticsViewController.swift
//  TrailGazer
//
//  Created by Martin on 3/28/24.
//

import UIKit
import CoreLocation

class StatisticsViewController: UIViewController, CLLocationManagerDelegate {
    
    
    //Line 14 to 146 are all for the Timer feature
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var StartButton: UIButton!
    @IBOutlet weak var EndButton: UIButton!
    
    var timerCounting: Bool = false
    var startTime: Date?
    var stopTime: Date?
    
    let userDefaults = UserDefaults.standard
    let START_TIME_KEY = "startTime"
    let STOP_TIME_KEY = "stopTime"
    let COUNTING_KEY = "countingKey"
    
    var scheduledTimer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startTime = userDefaults.object(forKey: START_TIME_KEY) as? Date
        stopTime = userDefaults.object(forKey: STOP_TIME_KEY) as? Date
        timerCounting = userDefaults.bool(forKey: COUNTING_KEY)
        
        if timerCounting{
            startTimer()
        }else{
            stopTimer()
            if let start = startTime{
                if let stop = stopTime{
                    let time = calcRestartTime(start: start, stop: stop)
                    let diff = Date().timeIntervalSince(time)
                    setTimeLabel(val: Int(diff))
                }
            }
        }
        
    }
    @IBAction func startStopAction(_ sender: Any) {
        if timerCounting{
            setStopTime(date: Date())
            stopTimer()
        }else{
            if let stop = stopTime{
                let restartTime = calcRestartTime(start: startTime!, stop: stop)
                setStopTime(date: nil)
                setStartTime(date: restartTime)
            }else{
                setStartTime(date: Date())
            }
            
            startTimer()
        }
    }
    
    func calcRestartTime(start: Date, stop: Date) -> Date{
        let diff = start.timeIntervalSince(stop)
        return Date().addingTimeInterval(diff)
    }
    
    func startTimer(){
        
        scheduledTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(refreshValue), userInfo: nil, repeats: true)
        setTimerCounting(val: true)
        StartButton.setTitle("STOP", for: .normal)
        StartButton.setTitleColor(UIColor.red, for: .normal)
    }
    
    @objc func refreshValue(){
        
        if let start = startTime{
            let diff = Date().timeIntervalSince(start)
            setTimeLabel(val: Int(diff))
        }else{
            stopTimer()
            setTimeLabel(val: 0)
        }
    }
    
    func setTimeLabel( val: Int){
        let time = secondsToHoursMinutesSeconds(ms: val)
        let timeString = makeTimeString(hour: time.0, min: time.1, sec: time.2)
        timeLabel.text = timeString
    }
    
    func secondsToHoursMinutesSeconds( ms: Int) -> (Int, Int, Int){
        let hour = ms / 3600
        let min = (ms % 3600) / 60
        let sec = (ms % 3600) % 60
        return(hour, min, sec)
    }
    
    func makeTimeString(hour: Int, min: Int, sec: Int) -> String{
        var timeString = ""
        timeString += String(format: "%02d", hour)
        timeString += ":"
        timeString += String(format: "%02d", min)
        timeString += ":"
        timeString += String(format: "%02d", sec)
        return timeString
    }
    
    func stopTimer(){
        if scheduledTimer != nil{
            scheduledTimer.invalidate()
        }
        
        setTimerCounting(val: false)
        StartButton.setTitle("START", for: .normal)
        StartButton.setTitleColor(UIColor.systemBlue, for: .normal)
    }
    
    @IBAction func endAction(_ sender: Any) {
        setStopTime(date: nil)
        setStartTime(date: nil)
        timeLabel.text = makeTimeString(hour: 0, min: 0, sec: 0)
        stopTimer()
    }
    
    func setStartTime(date: Date?){
        startTime = date
        userDefaults.set(startTime, forKey: START_TIME_KEY)
    }
    
    func setStopTime(date: Date?){
        stopTime = date
        userDefaults.set(stopTime, forKey: STOP_TIME_KEY)
    }
    
    func setTimerCounting( val: Bool){
        timerCounting = val
        userDefaults.set(timerCounting, forKey: COUNTING_KEY)
    }
}
