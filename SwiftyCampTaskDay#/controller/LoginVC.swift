//
//  LoginVC.swift
//  SwiftyCampTaskDay#
//
//  Created by Khaled on 7/12/19.
//  Copyright © 2019 Khaled. All rights reserved.
//

import UIKit
import SVProgressHUD

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var PasswordTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func showAlert(msgerror:String = "complete all fields"){
        let alert = UIAlertController(title: "error", message: msgerror, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func SignInBtnWasPRessed(_ sender: Any) {
        guard let email = emailTxtField.text , emailTxtField.text != "" else { showAlert(); return}
        guard email.isEmail == true else {return showAlert(msgerror: "enter a valid mail")}
        guard let password = PasswordTxtField.text , PasswordTxtField.text != "" else { showAlert(); return}
        guard password.isValidPassword == true else {return showAlert(msgerror: "enter a valid password")}
        SVProgressHUD.show()
        NetworkCall.login(email: email, password: password) { (error : Error?, success : Bool , errormsg : String) in
            if success {
                if errormsg != ""{
                    SVProgressHUD.dismiss()
                    self.showAlert(msgerror: errormsg)
                }else {
                    SVProgressHUD.dismiss()
                    let st = UIStoryboard(name: "Main", bundle: nil)
                    let vc = st.instantiateViewController(withIdentifier: "HomeScreen")
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            } else {
                SVProgressHUD.dismiss()
                self.showAlert(msgerror: "connection faild unable to login try again")
            }
        }
    }
    
    @IBAction func CreateBtnWasPressed(_ sender: Any) {
        let st = UIStoryboard(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(withIdentifier: "RegisterationScreen")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func skipToMainBtnWasPressed(_ sender: Any) {
        let st = UIStoryboard(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(withIdentifier: "HomeScreen")
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
