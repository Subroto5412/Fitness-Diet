//
//  FADAgeController.swift
//  Fitness&Diet
//
//  Created by Subroto Mohonto on 20/7/20.
//  Copyright © 2020 Sumon Opu. All rights reserved.
//

import UIKit

class FADAgeController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate{
    
       let Ages = ["15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99","100"]
    
    @IBOutlet weak var pickerViewArea: UIView!
    let pickerView = UIPickerView()
    var rotationAngle: CGFloat!
    let  width:CGFloat = 100
    let  height:CGFloat = 100
    @IBOutlet weak var backButton: UIView!
    @IBOutlet weak var nextBtnView: UIButton!

    
    class func initWithStoryboard() -> FADAgeController
         {
             let storyboard = UIStoryboard(name: "Main", bundle: nil)
             let controller = storyboard.instantiateViewController(withIdentifier: FADAgeController.className) as! FADAgeController
             return controller
         }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        self.backButton.layer.cornerRadius = 10
        self.nextBtnView.layer.cornerRadius = 10
        self.pickerView.backgroundColor = UIColor.clear
        self.rotationAngle = -90*(.pi/180)
        self.pickerView.transform = CGAffineTransform(rotationAngle: rotationAngle)
         
        self.pickerView.frame = CGRect(x: -150,y: self.pickerViewArea.frame.origin.y, width: view.frame.width+300, height: 100)
        self.view.addSubview(pickerView)
        
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
    }
       
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Ages.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Ages[row]
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
        label.text = Ages[row]
        view.addSubview(label)
        view.transform = CGAffineTransform(rotationAngle: 90*(.pi/180))
        return view
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       Utils.saveSharedPreferences(data_name: "age",data_value: Ages[row])
     }
    
    @IBAction func backBtn(_ sender: UIButton) {
        
        let controller = FADGenderController.initWithStoryboard()
        self.present(controller, animated: true, completion: nil);
    }
    
    @IBAction func nextBtn(_ sender: UIButton) {
        
        let controller = FADHeightController.initWithStoryboard()
        self.present(controller, animated: true, completion: nil);
    }
    
}
