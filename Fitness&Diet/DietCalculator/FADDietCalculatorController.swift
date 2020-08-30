//
//  FADDietCalculatorController.swift
//  Fitness&Diet
//
//  Created by Subroto Mohonto on 28/7/20.
//  Copyright © 2020 Sumon Opu. All rights reserved.
//

import UIKit

class FADDietCalculatorController: UIViewController {

    @IBOutlet weak var topBgView: UIImageView!
    
    @IBOutlet weak var titleNameLbl: UILabel!
    @IBOutlet weak var backBtnView: UIView!
    @IBOutlet weak var bodyContainer: FADDietCalBody!
    class func initWithStoryboard() -> FADDietCalculatorController
            {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: FADDietCalculatorController.className) as! FADDietCalculatorController
                return controller
            }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.topBgView.layer.cornerRadius = 10
        self.backBtnView.layer.cornerRadius = 10
        self.bodyContainer.BMIView.layer.cornerRadius = 10
//        self.bodyContainer.CalorieView.layer.cornerRadius = 10
        self.bodyContainer.BMRView.layer.cornerRadius = 10
        self.bodyContainer.IdealWeightView.layer.cornerRadius = 10
        self.bodyContainer.healthyWeightView.layer.cornerRadius = 10
        self.bodyContainer.LeanBodyMassView.layer.cornerRadius = 10
            
        self.titleNameLbl.text = "Diet Calculator"
        self.bodyContainer.BMILbl.text = "BMI\nCalculator"
//        self.bodyContainer.CalorieLbl.text = "Lean Body Mass\nCalculator"
        self.bodyContainer.BMRLbl.text = "BMR\nCalculator"
        self.bodyContainer.IdealWeightLbl.text = "Ideal Weight\nCalculator"
        self.bodyContainer.HealthyWeightLbl.text = "Healthy Weight\nCalculator"
        self.bodyContainer.LeanBodyLbl.text = "Lean Body Mass\nCalculator"
            
       // self.titleLbl.text = "Welcome to\n Fiitness & Diet"
            
       self.bodyContainer.BMIView.layer.shadowPath = UIBezierPath(rect: self.bodyContainer.BMIView.bounds).cgPath
        self.bodyContainer.BMIView.layer.shadowRadius = 3
        self.bodyContainer.BMIView.layer.shadowOffset = .zero
        self.bodyContainer.BMIView.layer.shadowOpacity = 0.5
            
//        self.bodyContainer.CalorieView.layer.shadowPath = UIBezierPath(rect: self.bodyContainer.CalorieView.bounds).cgPath
//        self.bodyContainer.CalorieView.layer.shadowRadius = 3
//        self.bodyContainer.CalorieView.layer.shadowOffset = .zero
//        self.bodyContainer.CalorieView.layer.shadowOpacity = 0.5
            
        self.bodyContainer.BMRView.layer.shadowPath = UIBezierPath(rect: self.bodyContainer.BMRView.bounds).cgPath
        self.bodyContainer.BMRView.layer.shadowRadius = 3
        self.bodyContainer.BMRView.layer.shadowOffset = .zero
        self.bodyContainer.BMRView.layer.shadowOpacity = 0.5
            
        self.bodyContainer.IdealWeightView.layer.shadowPath = UIBezierPath(rect: self.bodyContainer.IdealWeightView.bounds).cgPath
        self.bodyContainer.IdealWeightView.layer.shadowRadius = 3
        self.bodyContainer.IdealWeightView.layer.shadowOffset = .zero
        self.bodyContainer.IdealWeightView.layer.shadowOpacity = 0.5
            
        self.bodyContainer.healthyWeightView.layer.shadowPath = UIBezierPath(rect: self.bodyContainer.healthyWeightView.bounds).cgPath
        self.bodyContainer.healthyWeightView.layer.shadowRadius = 3
        self.bodyContainer.healthyWeightView.layer.shadowOffset = .zero
        self.bodyContainer.healthyWeightView.layer.shadowOpacity = 0.5
            
        self.bodyContainer.LeanBodyMassView.layer.shadowPath = UIBezierPath(rect: self.bodyContainer.LeanBodyMassView.bounds).cgPath
        self.bodyContainer.LeanBodyMassView.layer.shadowRadius = 3
        self.bodyContainer.LeanBodyMassView.layer.shadowOffset = .zero
        self.bodyContainer.LeanBodyMassView.layer.shadowOpacity = 0.5
        
        self.bodyContainer.BMIHandler = {
              [weak self] (isShow) in
              guard let weakSelf = self else {
              return
           }
           weakSelf.showBMIController()
       }
       self.bodyContainer.BMIHandler = {
                    [weak self] (isShow) in
                    guard let weakSelf = self else {
                    return
            }
            weakSelf.showBMIController()
        }
        
//        self.bodyContainer.CalorieHandler = {
//                     [weak self] (isShow) in
//                     guard let weakSelf = self else {
//                     return
//            }
//            weakSelf.showBMIController()
//        }
        
        
        self.bodyContainer.BMRHandler = {
                     [weak self] (isShow) in
                     guard let weakSelf = self else {
                     return
            }
            weakSelf.showBMRController()
        }
        
        self.bodyContainer.IdealWeightHandler = {
                     [weak self] (isShow) in
                     guard let weakSelf = self else {
                     return
            }
            weakSelf.showIdealWeightController()
        }
        
        self.bodyContainer.HealthyWeightHandler = {
                     [weak self] (isShow) in
                     guard let weakSelf = self else {
                     return
            }
            weakSelf.showBMIController()
        }
        
        self.bodyContainer.LeanBodyMassHandler = {
                           [weak self] (isShow) in
                           guard let weakSelf = self else {
                           return
                }
                weakSelf.showLeanBodyMassController()
            }
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        
        let controller = FADHomeViewController.initWithStoryboard()
        self.present(controller, animated: true, completion: nil);
    }
    
    func showBMIController() {
        let controller = FADBMIController.initWithStoryboard()
        self.present(controller, animated: true, completion: nil);
    }
    
//    func showCalorieController() {
//        let controller = FADBMIController.initWithStoryboard()
//        self.present(controller, animated: true, completion: nil);
//    }
    
    func showBMRController() {
        let controller = FADBMRController.initWithStoryboard()
        self.present(controller, animated: true, completion: nil);
    }
    
    func showIdealWeightController() {
        let controller = FADIdealWeightController.initWithStoryboard()
        self.present(controller, animated: true, completion: nil);
    }
    
    func showHealthyWeightController() {
        let controller = FADBMIController.initWithStoryboard()
        self.present(controller, animated: true, completion: nil);
    }
    func showLeanBodyMassController() {
        let controller = FADLeanBodyMassController.initWithStoryboard()
        self.present(controller, animated: true, completion: nil);
    }
    
}
