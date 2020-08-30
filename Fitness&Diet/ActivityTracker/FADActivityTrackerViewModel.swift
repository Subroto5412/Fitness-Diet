//
//  FADActivityTrackerViewModel.swift
//  Fitness&Diet
//
//  Created by Subroto Mohonto on 3/8/20.
//  Copyright © 2020 Sumon Opu. All rights reserved.
//
import RealmSwift
import UIKit


protocol FADActivityTrackerViewModelDelegate {
    func RecordSaved()
    func RecordSavingFailed(error: NSError)
    func RecordFetched(activityTrackers: [FADActivityTracker])
    func RecordDeleted()
}

extension FADActivityTrackerViewModelDelegate {
    func RecordSaved() {}
    func RecordSavingFailed(error: NSError) {}
    func RecordFetched(activityTrackers: [FADActivityTracker]) {}
    func RecordDeleted(){}
}

class FADActivityTrackerViewModel: NSObject {

    
    let realm = try! Realm()
       var delegate: FADActivityTrackerViewModelDelegate?

       // MARK: DB Helper Methods

       func saveRecord(activityTracker: FADActivityTracker) {
           // Persist your data easily
           try! realm.write {
            realm.add(activityTracker)
               delegate?.RecordSaved() // Notify for succesful insertion
           }
           // Note: here we can handle error in catch block and notify using
           // RecordSavingFailed(error: NSError)
       }
    
    func fetchActivityTracker(){
        var shoppingList: [String] = []
        let activityTrackers = realm.objects(FADActivityTracker.self)
        if activityTrackers.count > 0 {
            var dumppyActivityTracker = [FADActivityTracker]()
            for activityTracker in activityTrackers {
                dumppyActivityTracker.append(activityTracker)
                shoppingList.append(activityTracker.excercise)
                print("-------\(activityTracker.excercise)")
                 print("----shoppingList---\(shoppingList)")
            }
             print("-    ------\(dumppyActivityTracker)")
            delegate?.RecordFetched(activityTrackers: dumppyActivityTracker) // Notify with records
        } else {
            delegate?.RecordFetched(activityTrackers: [])
        }
    }

    func deleteRecord(activityTracker: FADActivityTracker) {
        // Persist your data easily
        try! realm.write {
            realm.delete(activityTracker)
            delegate?.RecordDeleted() // Notify for succesful deletion
        }
    }
}
