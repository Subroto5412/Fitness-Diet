//
// NSObject+Extension.swift
// KANEBO_Renewal
//
// Created by DreamOnline on 8/21/19.
// Copyright © 2019 DreamOnline. All rights reserved.
//

import UIKit

extension NSObject {
    
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
    
}
