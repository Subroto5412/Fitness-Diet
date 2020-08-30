//
//  FADDietPlanModel.swift
//  Fitness&Diet
//
//  Created by Subroto Mohonto on 17/7/20.
//  Copyright © 2020 Sumon Opu. All rights reserved.
//

import UIKit

class FADDietPlanModel: NSObject {

    var id : String?
    var title : String?
    var subTitle : String?
    var details : String?
    var picture : String?
      
    init(id : String?, title : String?, subTitle : String?, details : String?, picture : String?) {
        super.init()
        self.id = id
        self.title = title
        self.subTitle = subTitle
        self.details = details
        self.picture = picture
      }
    
}
