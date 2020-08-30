//
//  FADGenderController.swift
//  Fitness&Diet
//
//  Created by Subroto Mohonto on 20/7/20.
//  Copyright © 2020 Sumon Opu. All rights reserved.
//

import UIKit

class FADGenderController: UIViewController {
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var maleView: UIView!
    @IBOutlet weak var femaleView: UIView!
    @IBOutlet weak var nextBtnView: UIButton!
    
    class func initWithStoryboard() -> FADGenderController
         {
             let storyboard = UIStoryboard(name: "Main", bundle: nil)
             let controller = storyboard.instantiateViewController(withIdentifier: FADGenderController.className) as! FADGenderController
             return controller
         }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.backView.layer.cornerRadius = 10
        self.maleView.layer.cornerRadius = 10
        self.femaleView.layer.cornerRadius = 10
        self.nextBtnView.layer.cornerRadius = 10
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
    }
    @IBAction func maleBtn(_ sender: Any) {
         Utils.saveSharedPreferences(data_name: "age",data_value: "male")
    }
    @IBAction func femaleBtn(_ sender: UIButton) {
         Utils.saveSharedPreferences(data_name: "age",data_value: "female")
    }
    @IBAction func nextBtn(_ sender: UIButton) {
        
        let controller = FADAgeController.initWithStoryboard()
        self.present(controller, animated: true, completion: nil);
    }
    
}
