//
//  FADWeightController.swift
//  Fitness&Diet
//
//  Created by Subroto Mohonto on 20/7/20.
//  Copyright © 2020 Sumon Opu. All rights reserved.
//

import UIKit

class FADWeightController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate{
    
       let Weights = ["15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99","100"]
    
    let pickerView = UIPickerView()
    var rotationAngle: CGFloat!
    let  width:CGFloat = 100
    let  height:CGFloat = 100
    var weight_value: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
    
        self.pickerView.backgroundColor = UIColor.clear
        self.rotationAngle = -90*(.pi/180)
        self.pickerView.transform = CGAffineTransform(rotationAngle: rotationAngle)
         
        self.pickerView.frame = CGRect(x: -150,y: 0, width: view.frame.width+300, height: 100)
        self.view.addSubview(pickerView)
        
        if Utils.getSharedPreferences(data_name: "weight").isEmpty {
             self.pickerView.selectRow(10, inComponent: 0, animated: true)
        } else {
            weight_value = Int(Utils.getSharedPreferences(data_name: "weight"))!
            self.pickerView.selectRow(weight_value, inComponent: 0, animated: true)
          
        }
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
    }
       
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Weights.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Weights[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return self.width
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return self.height
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: width, height: height)
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: width, height: height)
        label.textAlignment = .center
        label.font = UIFont(name: "Arial", size: 22)
        label.textColor = UIColor.white
        label.text = Weights[row]
        view.addSubview(label)
        view.transform = CGAffineTransform(rotationAngle: 90*(.pi/180))
        return view
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        Utils.saveSharedPreferences(data_name: "weight",data_value: Weights[row])
     }
}
