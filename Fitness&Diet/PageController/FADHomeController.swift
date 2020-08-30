//
//  FADHomeController.swift
//  Fitness&Diet
//
//  Created by Subroto Mohonto on 15/7/20.
//  Copyright © 2020 Sumon Opu. All rights reserved.
//

import UIKit

class FADHomeController: UIViewController {
    @IBOutlet weak var container: UIView!
   // @IBOutlet weak var pageControl: UIPageControl!
    
    var pageController : FADPageViewController?
    var closeHandler : ((Bool?) -> Void)?
    class func initWithStoryboard() -> FADHomeController {
        
        let storyboard  = UIStoryboard(name: "Main", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(withIdentifier: FADHomeController.className) as! FADHomeController
        controller.providesPresentationContextTransitionStyle = true
        controller.definesPresentationContext = true
        controller.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        controller.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
        return controller
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializePages()
    }
    
    override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(animated)
          // self.pageControl.currentPage = (self.pageController?.selectedIndex)!
       }
       
       func initializePages() {
           
           self.pageController = FADPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
           self.pageController?.selectionDelegate = self
           
           if let controllers = self.pageController {
               
               let firstController = FADPageController.initWithStoryboard(withType: .pageController1)
               let secondController = FADPageController.initWithStoryboard(withType: .pageController2)
               let thirdController = FADPageController.initWithStoryboard(withType: .pageController3)
               controllers.setSubViewControllers(controllers: [firstController,secondController,thirdController])
               
               controllers.view.frame = container.bounds
               print(controllers.view.frame)
               addChild(controllers)
               container.addSubview(controllers.view)
               controllers.didMove(toParent: self)
           }
           
          // self.pageController?.isPagingEnabled = true
           self.pageController?.view.frame = container.bounds
           
         //  self.container.layer.borderWidth = 1.0
         //  self.container.layer.borderColor = KRConstants.kAppDefaultBlackColor.cgColor
       }

}

extension FADHomeController : FADPageViewControllerDelegate {

    func didSelectedController(type: Int) {
   //     self.pageControl.currentPage = type
    }
}
