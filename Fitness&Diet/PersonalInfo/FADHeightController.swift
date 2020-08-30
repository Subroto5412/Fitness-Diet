//
//  FADHeightController.swift
//  Fitness&Diet
//
//  Created by Subroto Mohonto on 20/7/20.
//  Copyright © 2020 Sumon Opu. All rights reserved.
//

import UIKit

class FADHeightController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate{
    
       let Heights = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99","100","101","102","103","104","105","106","107","108","109","110","111","112","113","114","115","116","117","118","119","120","121","122","123","124","125","216","127","128","129","130","131","132","133","134","135","136","137","138","139","140","141","142","143","144","145","146","147","148","149","150","151","152","153","154","155","156","157","158","159","160","161","162","163","164","165","166","167","168","169","170","171","172","173","174","175","176","177","178","179","180","181","182","183","184","185","186","187","188","189","190","191","192","193","194","195","196","197","198","199","200"]
    
    @IBOutlet weak var pickerViewArea: UIView!
    let pickerView = UIPickerView()
    var rotationAngle: CGFloat!
    let  width:CGFloat = 100
    let  height:CGFloat = 100
    @IBOutlet weak var backButton: UIView!
    
    @IBOutlet weak var ftView: UIButton!
    @IBOutlet weak var cmView: UIButton!
    @IBOutlet weak var kgView: UIButton!
    @IBOutlet weak var lbsView: UIButton!
    @IBOutlet weak var doneView: UIButton!
    
    var height_value: Int = 0
    class func initWithStoryboard() -> FADHeightController
         {
             let storyboard = UIStoryboard(name: "Main", bundle: nil)
             let controller = storyboard.instantiateViewController(withIdentifier: FADHeightController.className) as! FADHeightController
             return controller
         }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        self.backButton.layer.cornerRadius = 10
        self.ftView.layer.cornerRadius = 10
        self.cmView.layer.cornerRadius = 10
        self.kgView.layer.cornerRadius = 10
        self.lbsView.layer.cornerRadius = 10
        self.doneView.layer.cornerRadius = 10
        self.pickerView.backgroundColor = UIColor.clear
        self.rotationAngle = -90*(.pi/180)
        self.pickerView.transform = CGAffineTransform(rotationAngle: rotationAngle)
         
        self.pickerView.frame = CGRect(x: -150,y: self.pickerViewArea.frame.origin.y, width: view.frame.width+300, height: 100)
        self.view.addSubview(pickerView)
       
        
        if Utils.getSharedPreferences(data_name: "height").isEmpty {
             self.pickerView.selectRow(10, inComponent: 0, animated: true)
        } else {
            height_value = Int(Utils.getSharedPreferences(data_name: "height"))!
            self.pickerView.selectRow(height_value, inComponent: 0, animated: true)
        }
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
    }
       
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Heights.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Heights[row]
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
        label.text = Heights[row]
        view.addSubview(label)
        view.transform = CGAffineTransform(rotationAngle: 90*(.pi/180))
        return view
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        Utils.saveSharedPreferences(data_name: "height",data_value: Heights[row])
     }
    
    @IBAction func backBtn(_ sender: UIButton) {
        
        let controller = FADAgeController.initWithStoryboard()
        self.present(controller, animated: true, completion: nil);
    }
    
    @IBAction func ftBtn(_ sender: Any) {
    }
    
    @IBAction func cmBtn(_ sender: UIButton) {
    }
    @IBAction func lbsBtn(_ sender: UIButton) {
    }
    @IBAction func kgBtn(_ sender: UIButton) {
    }
    @IBAction func doneBtn(_ sender: UIButton) {
        let controller = FADHomeViewController.initWithStoryboard()
        self.present(controller, animated: true, completion: nil);
    }

}
