//
//  LoginController.swift
//  SurveyBox
//
//  Created by Abraham Tesfay on 9/17/19.
//  Copyright © 2019 Abraham Tesfay. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginController: UIViewController {
    
    //IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationController?.isNavigationBarHidden = true
        loginButton.layer.cornerRadius = self.loginButton.frame.height / 2
        emailView.layer.cornerRadius = self.emailView.frame.height / 2
        emailView.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        emailView.layer.borderWidth = 1
        passwordView.layer.cornerRadius = self.passwordView.frame.height / 2
        passwordView.layer.borderWidth = 1
        passwordView.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    fileprivate func loginwithFirebase() {
        Auth.auth().signIn(withEmail: emailTextField.text ?? "", password: passwordTextField.text ?? "") { (data, error) in
            if let error = error {
                print(error)
                return
            }
            
            print("Successfully login")
        }
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        loginwithFirebase()
    }
    
    @IBAction func signupButtonPressed(_ sender: Any) {
        let signupVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "signupVC") as! SignUpController
        self.navigationController?.pushViewController(signupVC, animated: true)
    }
    
}
