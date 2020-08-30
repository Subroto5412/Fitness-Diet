//
//  FADLoginController.swift
//  Fitness&Diet
//
//  Created by Subroto Mohonto on 16/7/20.
//  Copyright © 2020 Sumon Opu. All rights reserved.
//

import UIKit
import FirebaseAuth

class FADLoginController: UIViewController {

    @IBOutlet weak var bodyContainer: UIView!
    @IBOutlet weak var emailContainer: UIView!
    @IBOutlet weak var passwordContainer: UIView!
    @IBOutlet weak var loginContainer: UIButton!
    @IBOutlet weak var createAccountContainer: UIButton!
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    class func initWithStoryboard() -> FADLoginController
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: FADLoginController.className) as! FADLoginController
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bodyContainer.layer.cornerRadius = 10
        self.emailContainer.layer.cornerRadius = 10
        self.passwordContainer.layer.cornerRadius = 10
        self.loginContainer.layer.cornerRadius = 10
        self.createAccountContainer.layer.cornerRadius = 10
        
        emailTF.setBottomBorder()
        passwordTF.setBottomBorder()

    }
    
    @IBAction func signUpBtn(_ sender: UIButton) {
         let controller = FADSignUpController.initWithStoryboard()
         self.present(controller, animated: true, completion: nil);
    }
    
    @IBAction func loginBtn(_ sender: UIButton) {
        print("Continue button Tapped")
        guard let email  = emailTF.text,!email.isEmpty,
            let password = passwordTF.text, !password.isEmpty else {
                print("Enter Correct Input")
                return
            }
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password,completion: {[weak self] result, error in
            
            if result == nil {
              let alert = UIAlertController(title: "Error Message", message: "Email and Password don't match", preferredStyle: .alert)
              alert.addAction(UIAlertAction(title: "Continue", style: .cancel, handler: {_ in}))
                self!.present(alert, animated: true)
            }
            else{
                let alert = UIAlertController(title: "Success Message", message: "Login Successfully", preferredStyle: .alert)
                       alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {_ in FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: {[weak self] result, error in
                           
                         Utils.saveSharedPreferences(data_name: "signup",data_value: email)
                        
                          let controller = FADHomeViewController.initWithStoryboard()
                           self!.present(controller, animated: true, completion: nil);
                        
                       })}))
               self!.present(alert, animated: true)
            }
        })
    }
    
}


extension UITextField {

    func setBottomBorder() {
      self.borderStyle = .none
      self.layer.backgroundColor = UIColor.white.cgColor
      self.layer.masksToBounds = false
      self.layer.shadowColor = UIColor.gray.cgColor
      self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
      self.layer.shadowOpacity = 1.0
      self.layer.shadowRadius = 0.0
    }
}
