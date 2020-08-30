//
//  FADListController.swift
//  Fitness&Diet
//
//  Created by Subroto Mohonto on 18/7/20.
//  Copyright © 2020 Sumon Opu. All rights reserved.
//

import UIKit

class FADListController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

   

    var items = FADDietPlanDataManager.shared.getAllDietPlan()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
           return 1
    }
       
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
               items.count
    }
           
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
               
        let cell:FADListCell = tableView.dequeueReusableCell(withIdentifier: "FADListCell") as! FADListCell
        cell.titleLbl.text =  self.items[indexPath.item].title
        cell.subTitleLbl.text =  self.items[indexPath.item].subTitle
        return cell
    }

}

