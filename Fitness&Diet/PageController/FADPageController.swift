//
//  FADPageController.swift
//  Fitness&Diet
//
//  Created by Subroto Mohonto on 15/7/20.
//  Copyright © 2020 Sumon Opu. All rights reserved.
//

import UIKit
import FirebaseAuth

class FADPageController: UIViewController {

    enum FADControllerType : Int {
             case pageController1 = 0
             case pageController2 = 1
             case pageController3 = 2
         }

    var pageController : FADPageViewController?
    @IBOutlet weak var displayImage: UIImageView!
    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var subTitleName: UILabel!
     var controllerType : FADControllerType = .pageController2
       
    class func initWithStoryboard(withType type:FADControllerType) -> FADPageController {
        let storyboard  = UIStoryboard(name: "Main", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(withIdentifier: FADPageController.className) as! FADPageController
        controller.controllerType = type
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
           if self.controllerType.rawValue == 0 {
                    displayImage.image = UIImage(named: "page1")
                    titleName.text = "Welcome to\n Fitness & Diet"
                    subTitleName.text = "High intensity training: anytime & anywhere.\n Start training today!"
                 } else if self.controllerType.rawValue == 1 {
                    displayImage.image = UIImage(named: "page2")
                    titleName.text = "Daily Workout\nCan Help You to Build"
                    subTitleName.text = "High intensity training: anytime & anywhere.\n Start training today!"
                  } else if self.controllerType.rawValue == 2 {
                    displayImage.image = UIImage(named: "page3")
                  titleName.text = "One must eat to live \nnot live to eat"
                    subTitleName.text = "High intensity training: anytime & anywhere.\n Start training today!"
            }
    }
    @IBAction func geStartBtn(_ sender: Any) {
        
       if Utils.getSharedPreferences(data_name: "signup").isEmpty
        {
            let controller = FADLoginController.initWithStoryboard()
            self.present(controller, animated: true, completion: nil);
        }
        else {
            let controller = FADHomeViewController.initWithStoryboard()
            self.present(controller, animated: true, completion: nil);
        }
            
      
    }
    
}
