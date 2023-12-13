//
//  SignupViewController.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 10/12/2023.
//

import UIKit
import FirebaseAuth

class SignupViewController: UIViewController {
    
    @IBOutlet weak var emailFeild: UITextField!
    @IBOutlet weak var passwordFeild: UITextField!
    
    @IBAction func createAccount(_ sender: Any) {
        let email = emailFeild.text ?? ""
        let password = passwordFeild.text ?? ""
        
        Auth.auth().createUser(withEmail: email, password: password) {[weak self] authResult, error in
            guard let self = self else {return}
            if error != nil{
                self.presentAlert(message: error!.localizedDescription, title: "Error" )
            }
            else{
                self.presentAlert(message: "Account Created!", title: "Success")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStyle()
    }
    
    private func setupStyle(){
        self.navigationItem.title = "Sign up"
        
        emailFeild.placeholder = "Email..."
        emailFeild.becomeFirstResponder()
        passwordFeild.placeholder = "Password..."
    }
    
    private func presentAlert(message: String, title: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}
