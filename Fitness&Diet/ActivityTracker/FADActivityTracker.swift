//
//  FADActivityTracker.swift
//  Fitness&Diet
//
//  Created by Subroto Mohonto on 3/8/20.
//  Copyright © 2020 Sumon Opu. All rights reserved.
//

import UIKit
import RealmSwift

class FADActivityTracker: Object {
    
     @objc dynamic var excercise = ""
     @objc dynamic var walking = ""
     @objc dynamic var miles = ""
     @objc dynamic var weight = ""
     @objc dynamic var calories_burned = ""

}
