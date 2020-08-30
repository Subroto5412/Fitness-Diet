//
//  FADLocationController.swift
//  Fitness&Diet
//
//  Created by Subroto Mohonto on 18/7/20.
//  Copyright © 2020 Sumon Opu. All rights reserved.
//

import UIKit

class FADLocationController: UIViewController {

    @IBOutlet weak var backButton: UIView!
    
    @IBOutlet weak var sigmentView: UISegmentedControl!
    var container: ContainerViewController!
        
      class func initWithStoryboard() -> FADLocationController
      {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: FADLocationController.className) as! FADLocationController
            return controller
        }
        override func viewDidLoad() {
            super.viewDidLoad()
            self.backButton.layer.cornerRadius = 10
            
            sigmentView.layer.borderColor = UIColor.white.cgColor
            sigmentView.layer.borderWidth = 1.0;
            sigmentView.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
    @IBAction func backBtn(_ sender: UIButton) {
        let controller = FADHomeViewController.initWithStoryboard()
        self.present(controller, animated: true, completion: nil);
    }
    @IBAction func segmentControl(_ sender: UISegmentedControl) {


            if sender.selectedSegmentIndex == 0{
                container!.segueIdentifierReceivedFromParent("list")

            }else{
                container!.segueIdentifierReceivedFromParent("map")
               // let controller = container.currentViewController as? FADMapController
               // controller?.delegate = self


            }
            

        }
//
//        @IBAction func getText(_ sender: UIButton) {
//
//
//            if let getFirstVCObject = self.container.currentViewController as? FADListController{
//                let getText = getFirstVCObject.firstVCTextfield.text!
//                print(getText)
//            }
//
//        }
        
        
        
//        @IBAction func sendAction(_ sender: AnyObject) {
//
//
//            if container.currentViewController.isKind(of: FirstViewController.self){
//
//                if let getFirstVCObject = self.container.currentViewController as? FirstViewController
//                {
//                    let getText = self.sendTextField.text
//                    getFirstVCObject.firstVCLabel.text  = getText!
//
//
//                }
//            }
//            else if container.currentViewController.isKind(of: SecondViewController.self){
//
//                if let getSecondVCObject = self.container.currentViewController as? SecondViewController
//                {
//                    let getText = self.sendTextField.text
//                    getSecondVCObject.secondVCLabel.text = getText!
//
//
//                }
//
//
//
//
//            }
//
//        }
        
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "container"{
                container = segue.destination as? ContainerViewController
                //For adding animation to the transition of containerviews you can use container's object property
                // animationDurationWithOptions and pass in the time duration and transition animation option as a tuple
                // Animations that can be used
                // .transitionFlipFromLeft, .transitionFlipFromRight, .transitionCurlUp
                // .transitionCurlDown, .transitionCrossDissolve, .transitionFlipFromTop
                container.animationDurationWithOptions = (0.5, .transitionCrossDissolve)
            }
        }
        
        
        
    }
//    extension ViewController: SecondViewDelegate{
//
//        func sendToThirdViewController() {
//            container.segueIdentifierReceivedFromParent("third")
//        }
//
//
//    }
