//
//  FADActivityTrackerController.swift
//  Fitness&Diet
//
//  Created by Subroto Mohonto on 18/7/20.
//  Copyright © 2020 Sumon Opu. All rights reserved.
//

import UIKit
import CoreMotion

class FADActivityTrackerController: UIViewController {

    @IBOutlet weak var bodyContainer: UIView!
    @IBOutlet weak var bottomContainer: UIView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var TopLbl: UILabel!
    @IBOutlet weak var backButton: UIView!
    @IBOutlet weak var kCalLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    //Create an instance of CMPedometer
    let pedometer = CMPedometer()
    let activityManager = CMMotionActivityManager()
    
    var timer = Timer()
    let timerInterval = 1.0
    var timeElapsed:TimeInterval = 0.0
    
    class func initWithStoryboard() -> FADActivityTrackerController
         {
             let storyboard = UIStoryboard(name: "Main", bundle: nil)
             let controller = storyboard.instantiateViewController(withIdentifier: FADActivityTrackerController.className) as! FADActivityTrackerController
             return controller
         }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bodyContainer.layer.cornerRadius = 20
        self.bottomContainer.layer.cornerRadius = 20
        self.startButton.layer.cornerRadius = 10
        self.backButton.layer.cornerRadius = 10
        self.TopLbl.text = "You Have Walked \n7,235 Steps Today"       
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        
        let controller = FADHomeViewController.initWithStoryboard()
        self.present(controller, animated: true, completion: nil);
    }
    
    //MARK: - timer functions
    func startTimer(){
        if timer.isValid { timer.invalidate() }
        timer = Timer.scheduledTimer(timeInterval: timerInterval,target: self,selector: #selector(timerAction(timer:)) ,userInfo: nil,repeats: true)
    }
     
    func stopTimer(){
        timer.invalidate()
      //  displayPedometerData()
    }
     
    @objc func timerAction(timer:Timer){
        //displayPedometerData()
    }
    
    @IBAction func stepCountStartBtn(_ sender: UIButton) {
        
        if sender.titleLabel?.text == "Start"{
            
            self.activityManager.startActivityUpdates(to: OperationQueue.main) { (data) in
                                   DispatchQueue.main.async {
                                       if let activity = data {
                                           if activity.running == true {
                                               print("Running")
                                           }else if activity.walking == true {
                                               print("Walking")
                                           }else if activity.automotive == true {
                                               print("Automative")
                                           }
                                       }
                                   }
                               }
            
            
            startTimer() //start the timer

           self.pedometer.startUpdates(from: Date()) { (data, error) in
                  if error == nil {
                      if let response = data {
                          DispatchQueue.main.async {
                              print("Number Of Steps == \(response.numberOfSteps)")
                              print("Number Of Distance == \(String(describing: response.distance))")
                               self.TopLbl.text = "You Have Walked \n\(response.numberOfSteps) Steps Today"
                            self.distanceLabel.text = "\(String(describing: response.distance))"
                          }
                      }
                  }
              }
            //Toggle the UI to on state
           // statusTitle.text = "Pedometer On"
            sender.setTitle("Stop", for: .normal)
          //  sender.backgroundColor = stopColor
        } else {
            //Stop the pedometer
            pedometer.stopUpdates()
            stopTimer() // stop the timer
            //Toggle the UI to off state
         //   statusTitle.text = "Pedometer Off: "
         //   sender.backgroundColor = startColor
            sender.setTitle("Start", for: .normal)
        }
        
    }
    
   
}
