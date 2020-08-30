//
//  FADActivityTrackerChartController.swift
//  Fitness&Diet
//
//  Created by Subroto Mohonto on 3/8/20.
//  Copyright © 2020 Sumon Opu. All rights reserved.
//

import UIKit
import Charts
import RealmSwift

class FADActivityTrackerChartController: UIViewController {

    @IBOutlet weak var backBtnView: UIView!
    @IBOutlet weak var barChartView: BarChartView!
    
    @IBOutlet weak var titleNameLbl: UILabel!
    class func initWithStoryboard() -> FADActivityTrackerChartController
           {
               let storyboard = UIStoryboard(name: "Main", bundle: nil)
               let controller = storyboard.instantiateViewController(withIdentifier: FADActivityTrackerChartController.className) as! FADActivityTrackerChartController
               return controller
           }
    
    private lazy var dbViewModel: FADActivityTrackerViewModel = {
        let vm = FADActivityTrackerViewModel()
        vm.delegate = self as? FADActivityTrackerViewModelDelegate
        return vm
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleNameLbl.text = "Activity Trcker Bar Chart"
        self.backBtnView.layer.cornerRadius = 10
        self.barChartView.layer.cornerRadius = 10
        barChartView.animate(yAxisDuration: 2.0)
        barChartView.pinchZoomEnabled = false
        barChartView.drawBarShadowEnabled = false
        barChartView.drawBordersEnabled = false
        barChartView.doubleTapToZoomEnabled = false
        barChartView.drawGridBackgroundEnabled = true
        barChartView.chartDescription?.text = "Bar Chart"
        
        let realm = try! Realm()
        var walking: [String] = []
        var miles: [Double] = []
        
            let activityTrackers = realm.objects(FADActivityTracker.self)
            if activityTrackers.count > 0 {
                
                for activityTracker in activityTrackers {
                     walking.append(activityTracker.walking)
                     miles.append(Double(activityTracker.miles)!)
                }
         }
        setChart(dataPoints: walking, values: miles)
   
        
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
      barChartView.noDataText = "You need to provide data for the chart."
      
      var dataEntries: [BarChartDataEntry] = []
      
      for i in 0..<dataPoints.count {
        let dataEntry = BarChartDataEntry(x: Double(i), y: Double(values[i]))
        dataEntries.append(dataEntry)
      }
      
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Bar Chart")
      let chartData = BarChartData(dataSet: chartDataSet)
      barChartView.data = chartData
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        let controller = FADHomeViewController.initWithStoryboard()
        self.present(controller, animated: true, completion: nil);
    }
    
}
