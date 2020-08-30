//
//  FADBMIController.swift
//  Fitness&Diet
//
//  Created by Subroto Mohonto on 28/7/20.
//  Copyright © 2020 Sumon Opu. All rights reserved.
//

import UIKit

class FADBMIController: UIViewController {

    @IBOutlet weak var backBtnView: UIView!
    @IBOutlet weak var selctAgeView: UIButton!
    @IBOutlet weak var selectGenderView: UIButton!
    @IBOutlet weak var btnView: UIButton!
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var weightTF: UITextField!
    @IBOutlet weak var feetTF: UITextField!
    @IBOutlet weak var inchTF: UITextField!
    
    let transparentView = UIView()
    let tableView = UITableView()
    var selectedButton = UIButton()
    var dataSource = [String]()
    
    var BMI : Float = 0.0
    var result : String = ""
    
    class CellClass: UITableViewCell {
    }
    
    class func initWithStoryboard() -> FADBMIController
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: FADBMIController.className) as! FADBMIController
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.backBtnView.layer.cornerRadius = 10
        self.selctAgeView.layer.cornerRadius = 10
        self.selectGenderView.layer.cornerRadius = 10
        self.btnView.layer.cornerRadius = 10
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CellClass.self, forCellReuseIdentifier: "Cell")
        
        
    }
    
    
    @IBAction func backBtn(_ sender: UIButton) {
        let controller = FADDietCalculatorController.initWithStoryboard()
        self.present(controller, animated: true, completion: nil);
    }
    
    @IBAction func ageBtn(_ sender: UIButton) {
        dataSource = ["15", "16", "17","18","19","20","21","22","23","24","25","26","27","28","29","30","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80"]
        selectedButton = selctAgeView
        addTransparentView(frames: self.selctAgeView.frame)
    }
    
    @IBAction func genderBtn(_ sender: UIButton) {
        
        dataSource = ["Male", "Female"]
        selectedButton = selectGenderView
        addTransparentView(frames: selectGenderView.frame)
    }
    
    
    @IBAction func calculatorBtn(_ sender: UIButton) {
        
        let feet: Float? = Float(self.feetTF.text!)
        let inch: Float? = Float(self.inchTF.text!)
        let lbs: Float? = Float(self.weightTF.text!)
        let mass: Float? = (feet! * 12) + inch!
        BMI = round(703 * ((lbs!)/(mass! * mass!)))
                
        if BMI < 16 {
            result = "\(BMI)Kg/m2 (Severe Thinness)"
        } else if 16.0 < self.BMI && self.BMI < 17.0 {
            result = "\(BMI) Kg/m2 (Moderate Thinness)"
        } else if 17.0 < self.BMI && self.BMI < 18.5 {
            result = "\(BMI) Kg/m2 (Mild Thinness)"
        } else if 18.5 < self.BMI && self.BMI < 25 {
            result = "\(BMI) Kg/m2 (Normal)"
        } else if 25 < self.BMI && self.BMI < 30 {
            result = "\(BMI) Kg/m2 (Overweight)"
        } else if 30 < self.BMI && self.BMI < 35 {
            result = "\(BMI) Kg/m2 (Obese Class I)"
        } else if 35 < self.BMI && self.BMI > 40 {
            result = "\(BMI) Kg/m2 (Obese Class II"
        } else if self.BMI > 40 {
            result = "\(BMI)(Obese Class III)"
        }
        let message =  "\n\nHealthy BMI range: 18.5 kg/m2 - 25 kg/m2 \n Healthy weight for the height: 128.9 lbs - 174.2 lbs\nPonderal Index: 12.9 kg/m3"
        let alert = UIAlertController(title: "BMI Result", message: "\nBMI = "+result+message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func addTransparentView(frames: CGRect) {
        let window = UIApplication.shared.keyWindow
        transparentView.frame = window?.frame ?? self.view.frame
        self.view.addSubview(transparentView)
        
        tableView.frame = CGRect(x: 28, y:frames.origin.y + frames.height+self.bgView.frame.origin.y, width: frames.width, height: 0)
        self.view.addSubview(tableView)
        tableView.layer.cornerRadius = 5
        
        transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        tableView.reloadData()
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(removeTransparentView))
        transparentView.addGestureRecognizer(tapgesture)
        transparentView.alpha = 0
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0.5
            self.tableView.frame = CGRect(x: 28, y: self.bgView.frame.origin.y + frames.origin.y + frames.height + 5, width: frames.width, height: CGFloat(self.dataSource.count * 50))
        }, completion: nil)
    }
    
    @objc func removeTransparentView() {
        let frames = selectedButton.frame
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0
            self.tableView.frame = CGRect(x: 20, y: self.bgView.frame.origin.y + frames.height, width: frames.width, height: 0)
        }, completion: nil)
    }
}

extension FADBMIController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedButton.setTitle(dataSource[indexPath.row], for: .normal)
        removeTransparentView()
    }
}
