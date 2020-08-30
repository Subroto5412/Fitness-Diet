//
//  FADCalorieController.swift
//  Fitness&Diet
//
//  Created by Subroto Mohonto on 28/7/20.
//  Copyright © 2020 Sumon Opu. All rights reserved.
//

import UIKit

class FADCalorieController: UIViewController {
    
    @IBOutlet weak var backBtnView: UIView!
    
    class func initWithStoryboard() -> FADCalorieController
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: FADCalorieController.className) as! FADCalorieController
        return controller
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.backBtnView.layer.cornerRadius = 10
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func backBtn(_ sender: UIButton) {
        
        let controller = FADDietCalculatorController.initWithStoryboard()
        self.present(controller, animated: true, completion: nil);
    }
    
}
