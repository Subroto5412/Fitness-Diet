//
//  FADDietPlanController.swift
//  Fitness&Diet
//
//  Created by Subroto Mohonto on 17/7/20.
//  Copyright © 2020 Sumon Opu. All rights reserved.
//

import UIKit

class FADDietPlanController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

   
    @IBOutlet weak var titleNameLbl: UILabel!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var bodyContainer: UIView!
    var items = FADDietPlanDataManager.shared.getAllDietPlan()
    
    class func initWithStoryboard() -> FADDietPlanController
         {
             let storyboard = UIStoryboard(name: "Main", bundle: nil)
             let controller = storyboard.instantiateViewController(withIdentifier: FADDietPlanController.className) as! FADDietPlanController
             return controller
         }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.bodyContainer.layer.cornerRadius = 20
         self.backView.layer.cornerRadius = 10
         self.titleNameLbl.text = "Diet Plan"
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
           return 1
    }
       
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
               items.count
    }
           
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
               
        let cell:FADDietPlanCell = tableView.dequeueReusableCell(withIdentifier: "FADDietPlanCell") as! FADDietPlanCell
        cell.titleLbl.text =  self.items[indexPath.item].title
        cell.subTitleLbl.text =  self.items[indexPath.item].subTitle
        return cell
    }
    @IBAction func backBtn(_ sender: UIButton) {
        
        let controller = FADHomeViewController.initWithStoryboard()
        self.present(controller, animated: true, completion: nil);
    }
    
}
