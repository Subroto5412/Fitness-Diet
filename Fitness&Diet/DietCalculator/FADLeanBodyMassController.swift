//
//  FADLeanBodyMassController.swift
//  Fitness&Diet
//
//  Created by Subroto Mohonto on 28/7/20.
//  Copyright © 2020 Sumon Opu. All rights reserved.
//

import UIKit

class FADLeanBodyMassController: UIViewController {
    
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
       
    var LBM : Float = 0.0
    var result : String = ""
    var gender : String = ""
    var age : Float = 0
       
    class CellClass: UITableViewCell {
    }
    class func initWithStoryboard() -> FADLeanBodyMassController
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: FADLeanBodyMassController.className) as! FADLeanBodyMassController
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
    
    @IBAction func CalBtn(_ sender: UIButton) {
        
      //  For men: LBM = (0.32810 × W) + (0.33929 × H) − 29.5336
      //  For women: LBM = (0.29569 × W) + (0.41813 × H) − 43.2933
        let feet: Float? = Float(self.feetTF.text!)
        let inch: Float? = Float(self.inchTF.text!)
        let lbs: Float? = Float(self.weightTF.text!)
        let mass: Float? = (feet! * 12) + inch!
        
        if gender == "Male" {
            let lbs1:Float = (lbs! * 0.453592 ) * 0.32810
            let masss1:Float = (mass! * 2.54) * 0.41813
            LBM = lbs1 + masss1 - 29.5336
            }else {
            
            let lbs1:Float = (lbs! * 0.453592 ) * 0.29569
            let masss1:Float = (mass! * 2.54) * 0.41813
            LBM = lbs1 + masss1 - 43.2933
                          
        }
        
        let alert = UIAlertController(title: "Lean Body Mass Result", message: "\nYour Lean Body Mass is \(LBM) LBM", preferredStyle: UIAlertController.Style.alert)
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

        extension FADLeanBodyMassController: UITableViewDelegate, UITableViewDataSource {
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
                if dataSource[indexPath.row] == "Male" || dataSource[indexPath.row] == "Female" {
                    gender = dataSource[indexPath.row]
                } else {
                    age = Float(dataSource[indexPath.row])!
                }
                removeTransparentView()
            }
        }

