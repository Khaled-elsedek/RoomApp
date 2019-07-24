//
//  RegestrationVC.swift
//  SwiftyCampTaskDay#
//
//  Created by Khaled on 7/19/19.
//  Copyright © 2019 Khaled. All rights reserved.
//

import UIKit
import IBAnimatable
import SVProgressHUD

class RegestrationVC: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpBTn: AnimatableButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func showAlert(msgerror:String = "complete all fields"){
        let alert = UIAlertController(title: "error", message: msgerror, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func signupBtnWasPressed(_ sender: Any) {
        
        
        guard let email = emailTextField.text , emailTextField.text != "" else { showAlert(); return}
        guard email.isEmail == true else {return showAlert(msgerror: "enter a valid mail")}
        guard let password = passwordTextField.text , passwordTextField.text != "" else {return showAlert()}
        guard password.isValidPassword == true else {return showAlert(msgerror: "enter a valid password")}
        guard let name = nameTextField.text , nameTextField.text != "" else {return showAlert()}
        SVProgressHUD.show()
        AuthService.instance.registerUSer(email: email, password: password, name: name) { (error, success, errormsg) in
            
            if success {
                print("dd")
                
                if errormsg != "Account created successfully"{
                    self.showAlert(msgerror: errormsg)
                }else {
                    SVProgressHUD.dismiss()
                    let st = UIStoryboard(name: "Main", bundle: nil)
                    let vc = st.instantiateViewController(withIdentifier: "HomeScreen")
                    self.navigationController?.pushViewController(vc, animated: true)
                    self.signUpBTn.isEnabled = false
                    
                }
            }else {
                self.showAlert(msgerror: "connection faild unaple to signup try again")
                print("connection faild unaple to signup")
            }
        }
        
        
        
        
        
        
            }
    
    

    

}
