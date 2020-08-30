//
//  FADDietCalBody.swift
//  Fitness&Diet
//
//  Created by Subroto Mohonto on 28/7/20.
//  Copyright © 2020 Sumon Opu. All rights reserved.
//

import UIKit

class FADDietCalBody: FADXibView {
    
    @IBOutlet weak var BMIView: UIView!
    @IBOutlet weak var CalorieView: UIView!
    @IBOutlet weak var BMRView: UIView!
    @IBOutlet weak var IdealWeightView: UIView!
    @IBOutlet weak var healthyWeightView: UIView!
    @IBOutlet weak var LeanBodyMassView: UIView!
    
    @IBOutlet weak var BMILbl: UILabel!
    @IBOutlet weak var CalorieLbl: UILabel!
    
    @IBOutlet weak var BMRLbl: UILabel!
    @IBOutlet weak var IdealWeightLbl: UILabel!
    
    @IBOutlet weak var HealthyWeightLbl: UILabel!
    @IBOutlet weak var LeanBodyLbl: UILabel!
    
    var BMIHandler : ((Bool?) -> Void)?
    var CalorieHandler : ((Bool?) -> Void)?
    var BMRHandler : ((Bool?) -> Void)?
    var IdealWeightHandler : ((Bool?) -> Void)?
    var HealthyWeightHandler : ((Bool?) -> Void)?
    var LeanBodyMassHandler : ((Bool?) -> Void)?
    

    @IBAction func BMIBtn(_ sender: UIButton) {
        self.BMIHandler?(true)
    }
    
    @IBAction func CalorieBtn(_ sender: UIButton) {
        
         self.CalorieHandler?(true)
    }
    
    @IBAction func BMRBtn(_ sender: UIButton) {
         self.BMRHandler?(true)
    }
    
    @IBAction func IdealWeightBtn(_ sender: UIButton) {
         self.IdealWeightHandler?(true)
    }
    
    @IBAction func HealthyWeightBtn(_ sender: UIButton) {
         self.HealthyWeightHandler?(true)
    }
    
    @IBAction func LeanBodyMassBtn(_ sender: UIButton) {
         self.LeanBodyMassHandler?(true)
    }
}
