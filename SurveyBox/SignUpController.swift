//
//  SignUpController.swift
//  SurveyBox
//
//  Created by Abraham Tesfay on 9/17/19.
//  Copyright © 2019 Abraham Tesfay. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpController: UIViewController {
    
    //IBOutlets
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        signupButton.layer.cornerRadius = self.signupButton.frame.height / 2
        emailView.layer.cornerRadius = self.emailView.frame.height / 2
        emailView.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        emailView.layer.borderWidth = 1
        passwordView.layer.cornerRadius = self.passwordView.frame.height / 2
        passwordView.layer.borderWidth = 1
        passwordView.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
       
    }
    
    fileprivate func signupwithFirebase() {
        Auth.auth().createUser(withEmail: emailTextField.text ?? "", password: passwordTextField.text ?? "") { (data, error) in
            if let error = error {
                print(error)
                return
            }

            print("Successfully create user")
        }
    }
    
    @IBAction func signupButtonPressed(_ sender: Any) {
        signupwithFirebase()
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
