//
//  FADFooter.swift
//  Fitness&Diet
//
//  Created by Subroto Mohonto on 16/7/20.
//  Copyright © 2020 Sumon Opu. All rights reserved.
//

import UIKit

class FADFooter: FADXibView {
    @IBOutlet var footerBgContainer: UIView!
    var homeHandler : ((Bool?) -> Void)?
    var activityTrackerHandler : ((Bool?) -> Void)?
    var chartHandler : ((Bool?) -> Void)?
    var profileHandler : ((Bool?) -> Void)?

    @IBAction func homeBtn(_ sender: UIButton) {
         homeHandler?(true)
    }
    
    @IBAction func trackerBtn(_ sender: UIButton) {
         activityTrackerHandler?(true)
    }
    @IBAction func chartBtn(_ sender: UIButton) {
        chartHandler?(true)
    }
    
    @IBAction func profileBtn(_ sender: UIButton) {
        
        profileHandler?(true)
    }
    
}
