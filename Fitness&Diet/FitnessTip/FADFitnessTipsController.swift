//
//  FADFitnessTipsController.swift
//  Fitness&Diet
//
//  Created by Subroto Mohonto on 1/8/20.
//  Copyright © 2020 Sumon Opu. All rights reserved.
//

import UIKit

class FADFitnessTipsController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var backBtnView: UIView!
    @IBOutlet weak var titleNameLbl: UILabel!
    
    var items = FADDietPlanDataManager.shared.getAllDietPlan()
       
       class func initWithStoryboard() -> FADFitnessTipsController
            {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: FADFitnessTipsController.className) as! FADFitnessTipsController
                return controller
            }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleNameLbl.text = "Fitness Tips"
        self.backBtnView.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }
    
   
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
             return 1
      }
         
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                 items.count
      }
             
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                 
          let cell:FADFitnessTipsCell = tableView.dequeueReusableCell(withIdentifier: "FADFitnessTipsCell") as! FADFitnessTipsCell
          cell.titleLbl.text =  self.items[indexPath.item].title
          let imageName = items[indexPath.item].picture
        if imageName == "" {
            cell.imgHeight.constant = 0
        }
        cell.itemImg.image = UIImage(named: imageName!)
       // cell.itemImg.image =  UIImage(named: image[indexPath.item].p)
          cell.detailsLbl.text =  self.items[indexPath.item].subTitle
          return cell
      }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//       return UITableView.automaticDimension
//    }
      @IBAction func backBtn(_ sender: UIButton) {
          
          let controller = FADHomeViewController.initWithStoryboard()
          self.present(controller, animated: true, completion: nil);
      }
}
