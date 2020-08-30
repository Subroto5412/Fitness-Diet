//
//  Utils.swift
//  Fitness&Diet
//
//  Created by Subroto Mohonto on 22/7/20.
//  Copyright © 2020 Sumon Opu. All rights reserved.
//

import Foundation
import UIKit


class Utils {
    
    static func saveSharedPreferences(data_name: String, data_value: String){
           let preferences = UserDefaults.standard
            preferences.set(data_value, forKey: data_name)
           // Checking the preference is saved or not
           didSave(preferences: preferences)
       }
       
       static func getSharedPreferences(data_name: String) -> String{
           let preferences = UserDefaults.standard
           if preferences.string(forKey: data_name) != nil{
               let data_name = preferences.string(forKey: data_name)
               return data_name!
           } else {
               return ""
           }
       }
        // Checking the UserDefaults is saved or not
    static func didSave(preferences: UserDefaults){
        let didSave = preferences.synchronize()
        if !didSave{
            // Couldn't Save
            print("Preferences could not be saved!")
        }
    }

}
