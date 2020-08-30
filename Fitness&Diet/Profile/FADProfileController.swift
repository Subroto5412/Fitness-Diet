//
//  FADProfileController.swift
//  Fitness&Diet
//
//  Created by Subroto Mohonto on 3/8/20.
//  Copyright © 2020 Sumon Opu. All rights reserved.
//

import UIKit

class FADProfileController: UIViewController {

    @IBOutlet weak var backBtnView: UIView!
    @IBOutlet weak var bgView: UIView!
    
    class func initWithStoryboard() -> FADProfileController
            {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: FADProfileController.className) as! FADProfileController
                return controller
            }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.backBtnView.layer.cornerRadius = 10
        self.bgView.layer.cornerRadius = 10
        
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        let controller = FADHomeViewController.initWithStoryboard()
        self.present(controller, animated: true, completion: nil);
    }
    
}
