//
//  FADSignUpController.swift
//  Fitness&Diet
//
//  Created by Subroto Mohonto on 16/7/20.
//  Copyright © 2020 Sumon Opu. All rights reserved.
//

import UIKit
import FirebaseAuth

class FADSignUpController: UIViewController {

    @IBOutlet weak var bodyContainer: UIView!
    @IBOutlet weak var userContainer: UIView!
    @IBOutlet weak var emailContainer: UIView!
    @IBOutlet weak var passwordContainer: UIView!
    @IBOutlet weak var signUBtn: UIButton!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var backButton: UIView!
    
    
    class func initWithStoryboard() -> FADSignUpController
      {
          let storyboard = UIStoryboard(name: "Main", bundle: nil)
          let controller = storyboard.instantiateViewController(withIdentifier: FADSignUpController.className) as! FADSignUpController
          return controller
      }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bodyContainer.layer.cornerRadius = 10
        self.userContainer.layer.cornerRadius = 10
        self.emailContainer.layer.cornerRadius = 10
        self.passwordContainer.layer.cornerRadius = 10
        self.signUBtn.layer.cornerRadius = 10
        self.backButton.layer.cornerRadius = 10
      
        
        nameTF.setBottomBorder()
        emailTF.setBottomBorder()
        passwordTF.setBottomBorder()

    }
          
    @IBAction func signUpBtn(_ sender: UIButton) {
        
        let name  = nameTF.text
        let email  = emailTF.text
        let password = passwordTF.text
  
        if name!.isEmpty {
            self.showToast(message: "Enter Name", font: .systemFont(ofSize: 12.0))
        }
        else if email!.isEmpty {
            self.showToast(message: "Enter Email", font: .systemFont(ofSize: 12.0))
        }
        else if password!.isEmpty {
            self.showToast(message: "Enter password", font: .systemFont(ofSize: 12.0))
        }
        else{
            self.showCreateAccount(name: name!, email: email!, password: password!)
        }
        
    }
    @IBAction func backBtn(_ sender: UIButton) {
        let controller = FADLoginController.initWithStoryboard()
        self.present(controller, animated: true, completion: nil);
    }
    
    func showCreateAccount(name: String, email: String, password: String)
    {
        print("Continue button Tapped")
              guard let email  = emailTF.text,!email.isEmpty,
                  let password = passwordTF.text, !password.isEmpty else {
                      print("Missing Field data")
                      return
                  }
        
        let alert = UIAlertController(title: "Create Account", message: "Would you like to create an account", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {_ in FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: {[weak self] result, error in
            
            if result == nil {
                self!.showToast(message: "Account Create Failed", font: .systemFont(ofSize: 12.0))
            }
            else {
                Utils.saveSharedPreferences(data_name: "signup",data_value: self!.nameTF.text!)
                self!.showToast(message: "Account has Created Successfully", font: .systemFont(ofSize: 12.0))
                let controller = FADGenderController.initWithStoryboard()
                self!.present(controller, animated: true, completion: nil);
            }
          })
        }))
    
        present(alert, animated: true)
    }
}

extension UIViewController {

func showToast(message : String, font: UIFont) {

    let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
    toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    toastLabel.textColor = UIColor.white
    toastLabel.font = font
    toastLabel.textAlignment = .center;
    toastLabel.text = message
    toastLabel.alpha = 1.0
    toastLabel.layer.cornerRadius = 10;
    toastLabel.clipsToBounds  =  true
    self.view.addSubview(toastLabel)
    UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
         toastLabel.alpha = 0.0
    }, completion: {(isCompleted) in
        toastLabel.removeFromSuperview()
    })
} }
