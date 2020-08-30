//
//  FADHomeBody.swift
//  Fitness&Diet
//
//  Created by Subroto Mohonto on 16/7/20.
//  Copyright © 2020 Sumon Opu. All rights reserved.
//

import UIKit

class FADHomeBody: FADXibView {
    
    @IBOutlet weak var calView: UIView!
    @IBOutlet weak var planView: UIView!
    
    @IBOutlet weak var activityView: UIView!
    @IBOutlet weak var fitnessView: UIView!
    
    @IBOutlet weak var musicView: UIView!
    @IBOutlet weak var gymView: UIView!
    
    @IBOutlet weak var calLbl: UILabel!
    @IBOutlet weak var planLbl: UILabel!
    
    @IBOutlet weak var fitnessLbl: UILabel!
    @IBOutlet weak var actiivtyLbl: UILabel!
    
    @IBOutlet weak var musicLbl: UILabel!
    @IBOutlet weak var gymLbl: UILabel!
    
    var dietCalculatorHandler : ((Bool?) -> Void)?
    var dietPlanHandler : ((Bool?) -> Void)?
    var fitnessTipsHandler : ((Bool?) -> Void)?
    var activityTrackerHandler : ((Bool?) -> Void)?
    var musicHandler : ((Bool?) -> Void)?
    var gymLocationHandler : ((Bool?) -> Void)?

    @IBAction func dietCalculatorBtn(_ sender: UIButton) {
         self.dietCalculatorHandler?(true)
    }
    
    @IBAction func dietPlanBtn(_ sender: UIButton) {
        self.dietPlanHandler?(true)
    }
    
    @IBAction func fitnessTipsBtn(_ sender: UIButton) {
        self.fitnessTipsHandler?(true)
    }
    
    @IBAction func activityTackerBtn(_ sender: Any) {
        self.activityTrackerHandler?(true)
    }
    
    @IBAction func musicBtn(_ sender: Any) {
        self.musicHandler?(true)
    }
    
    @IBAction func gymLocationBtn(_ sender: UIButton) {
        self.gymLocationHandler?(true)
    }
}
