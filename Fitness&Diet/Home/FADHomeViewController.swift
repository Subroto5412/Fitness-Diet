//
//  FADHomeController.swift
//  Fitness&Diet
//
//  Created by Subroto Mohonto on 16/7/20.
//  Copyright © 2020 Sumon Opu. All rights reserved.
//

import UIKit

class FADHomeViewController: UIViewController {
    @IBOutlet weak var topContainer: UIImageView!
    @IBOutlet weak var bodyContainer: FADHomeBody!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var footerContainer: FADFooter!
    
    class func initWithStoryboard() -> FADHomeViewController
         {
             let storyboard = UIStoryboard(name: "Main", bundle: nil)
             let controller = storyboard.instantiateViewController(withIdentifier: FADHomeViewController.className) as! FADHomeViewController
             return controller
         }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.topContainer.layer.cornerRadius = 20
        self.bodyContainer.calView.layer.cornerRadius = 10
        self.bodyContainer.planView.layer.cornerRadius = 10
        self.bodyContainer.activityView.layer.cornerRadius = 10
        self.bodyContainer.fitnessView.layer.cornerRadius = 10
        self.bodyContainer.musicView.layer.cornerRadius = 10
        self.bodyContainer.gymView.layer.cornerRadius = 10
        self.footerContainer.footerBgContainer.layer.cornerRadius = 20
        
        self.bodyContainer.calLbl.text = "Diet\nCalculator"
        self.bodyContainer.planLbl.text = "Diet\nPlan"
        self.bodyContainer.fitnessLbl.text = "Fitness\nTips"
        self.bodyContainer.actiivtyLbl.text = "Activity\nTracker"
        self.bodyContainer.musicLbl.text = "Music\nPlayer"
        self.bodyContainer.gymLbl.text = "Gym\nLocation"
        
        self.titleLbl.text = "Welcome to\n Fiitness & Diet"
        
        self.bodyContainer.calView.layer.shadowPath = UIBezierPath(rect: self.bodyContainer.calView.bounds).cgPath
        self.bodyContainer.calView.layer.shadowRadius = 3
        self.bodyContainer.calView.layer.shadowOffset = .zero
        self.bodyContainer.calView.layer.shadowOpacity = 0.5
        
        self.bodyContainer.planView.layer.shadowPath = UIBezierPath(rect: self.bodyContainer.planView.bounds).cgPath
        self.bodyContainer.planView.layer.shadowRadius = 3
        self.bodyContainer.planView.layer.shadowOffset = .zero
        self.bodyContainer.planView.layer.shadowOpacity = 0.5
        
        self.bodyContainer.activityView.layer.shadowPath = UIBezierPath(rect: self.bodyContainer.activityView.bounds).cgPath
        self.bodyContainer.activityView.layer.shadowRadius = 3
        self.bodyContainer.activityView.layer.shadowOffset = .zero
        self.bodyContainer.activityView.layer.shadowOpacity = 0.5
        
        self.bodyContainer.fitnessView.layer.shadowPath = UIBezierPath(rect: self.bodyContainer.fitnessView.bounds).cgPath
        self.bodyContainer.fitnessView.layer.shadowRadius = 3
        self.bodyContainer.fitnessView.layer.shadowOffset = .zero
        self.bodyContainer.fitnessView.layer.shadowOpacity = 0.5
        
        self.bodyContainer.musicView.layer.shadowPath = UIBezierPath(rect: self.bodyContainer.musicView.bounds).cgPath
        self.bodyContainer.musicView.layer.shadowRadius = 3
        self.bodyContainer.musicView.layer.shadowOffset = .zero
        self.bodyContainer.musicView.layer.shadowOpacity = 0.5
        
        self.bodyContainer.gymView.layer.shadowPath = UIBezierPath(rect: self.bodyContainer.gymView.bounds).cgPath
        self.bodyContainer.gymView.layer.shadowRadius = 3
        self.bodyContainer.gymView.layer.shadowOffset = .zero
        self.bodyContainer.gymView.layer.shadowOpacity = 0.5
        
        self.bodyContainer.dietPlanHandler = {
        [weak self] (isShow) in
                     guard let weakSelf = self else {
                         return
                     }
                     weakSelf.showDietPlanController()
        }
        
        self.bodyContainer.gymLocationHandler = {
        [weak self] (isShow) in
                     guard let weakSelf = self else {
                         return
                     }
                     weakSelf.showGymLocationController()
        }
        
        self.bodyContainer.musicHandler = {
               [weak self] (isShow) in
                            guard let weakSelf = self else {
                                return
                            }
                    weakSelf.showMusicController()
            }
        
        self.bodyContainer.activityTrackerHandler = {
                      [weak self] (isShow) in
                                   guard let weakSelf = self else {
                                       return
                                   }
                    weakSelf.showActivityTrackerController()
            }
        
        self.bodyContainer.dietCalculatorHandler = {
                      [weak self] (isShow) in
                                   guard let weakSelf = self else {
                                       return
                                   }
                    weakSelf.showDietCalculatorController()
            }
        
        self.bodyContainer.fitnessTipsHandler = {
                             [weak self] (isShow) in
                                          guard let weakSelf = self else {
                                              return
                                          }
                           weakSelf.showFitnessTipsController()
                   }
        
        self.footerContainer.chartHandler = {
                  [weak self] (isShow) in
                               guard let weakSelf = self else {
                                   return
                               }
                weakSelf.showChartController()
        }
        
        self.footerContainer.activityTrackerHandler = {
                  [weak self] (isShow) in
                               guard let weakSelf = self else {
                                   return
                        }
                weakSelf.showTrackerController()
        }
        
        self.footerContainer.profileHandler = {
                         [weak self] (isShow) in
                            guard let weakSelf = self else {
                            return
                    }
            weakSelf.showProofileController()
        }
    }
    
    func showDietPlanController() {
        let controller = FADDietPlanController.initWithStoryboard()
         self.present(controller, animated: true, completion: nil);
    }
   func showGymLocationController() {
       let controller = FADLocationController.initWithStoryboard()
        self.present(controller, animated: true, completion: nil);
   }
    func showMusicController() {
        let controller = FADMusicController.initWithStoryboard()
        self.present(controller, animated: true, completion: nil);
    }
    func showActivityTrackerController() {
        let controller = FADActivityTrackerSaveController.initWithStoryboard()
        self.present(controller, animated: true, completion: nil);
    }
    
    func showDietCalculatorController() {
        let controller = FADDietCalculatorController.initWithStoryboard()
        self.present(controller, animated: true, completion: nil);
    }
    
    func showFitnessTipsController() {
        let controller = FADFitnessTipsController.initWithStoryboard()
        self.present(controller, animated: true, completion: nil);
    }
    func showChartController() {
        let controller = FADActivityTrackerChartController.initWithStoryboard()
        self.present(controller, animated: true, completion: nil);
    }
    
    func showTrackerController() {
        let controller = FADActivityTrackerSaveController.initWithStoryboard()
        self.present(controller, animated: true, completion: nil);
    }
    
    func showProofileController() {
        let controller = FADProfileController.initWithStoryboard()
        self.present(controller, animated: true, completion: nil);
    }
}




