//
//  FADActivityTrackerSaveController.swift
//  Fitness&Diet
//
//  Created by Subroto Mohonto on 3/8/20.
//  Copyright © 2020 Sumon Opu. All rights reserved.
//
import Toast_Swift
import UIKit
import RealmSwift

class FADActivityTrackerSaveController: UIViewController {
    
    @IBOutlet weak var backBtnView: UIView!
    @IBOutlet weak var titleNameLbl: UILabel!
    
    @IBOutlet weak var saveBtnView: UIButton!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var ExcerciseDurationTF: UITextField!
    @IBOutlet weak var walkingDurationTF: UITextField!
    @IBOutlet weak var totalMilesTF: UITextField!
    @IBOutlet weak var weightTF: UITextField!
    @IBOutlet weak var caloriesBurnedTF: UITextField!
    
    class func initWithStoryboard() -> FADActivityTrackerSaveController
           {
               let storyboard = UIStoryboard(name: "Main", bundle: nil)
               let controller = storyboard.instantiateViewController(withIdentifier: FADActivityTrackerSaveController.className) as! FADActivityTrackerSaveController
               return controller
           }
    
    private var style = ToastStyle()

    private lazy var dbViewModel: FADActivityTrackerViewModel = {
        let vm = FADActivityTrackerViewModel()
        vm.delegate = self
        return vm
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleNameLbl.text = "Activity Tracker"
        self.backBtnView.layer.cornerRadius = 10
        self.bgView.layer.cornerRadius = 10
        self.saveBtnView.layer.cornerRadius = 10
        
    }
    @IBAction func backBtn(_ sender: UIButton) {
       let controller = FADHomeViewController.initWithStoryboard()
       self.present(controller, animated: true, completion: nil);
        
      dbViewModel.fetchActivityTracker()
            
    }
    
    @IBAction func saveBtn(_ sender: UIButton) {
        
        let activityTracker = FADActivityTracker()
              activityTracker.excercise = ExcerciseDurationTF.text ?? ""
              activityTracker.walking = walkingDurationTF.text ?? ""
              activityTracker.miles = totalMilesTF.text ?? ""
              activityTracker.weight = weightTF.text ?? ""
              activityTracker.calories_burned = caloriesBurnedTF.text ?? ""
              self.view.endEditing(true)
              dbViewModel.saveRecord(activityTracker: activityTracker) // save record to database
    }
    
}

// MARK: RealMViewModelDelegate Methods
extension FADActivityTrackerSaveController: FADActivityTrackerViewModelDelegate {
    func RecordSaved() {
        ExcerciseDurationTF.text = ""
        walkingDurationTF.text = ""
        totalMilesTF.text = ""
        weightTF.text = ""
        caloriesBurnedTF.text = ""
        self.view.makeToast("Record saved in DB", duration: 3.0, position: .bottom, style: style)
    }

    func RecordSavingFailed(error: NSError) {
        self.view.makeToast(error.localizedDescription, duration: 3.0, position: .bottom, style: style)
    }
}
