//
//  LoginViewController.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 10/12/2023.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    static let Identifier = "Login"
    
    @IBOutlet weak var emailFeild: UITextField!
    
    @IBOutlet weak var passwordFeild: UITextField!
    
    @IBOutlet weak var loginButton: PrimaryButton!
    
    
    @IBAction func login(_ sender: Any) {
        let email = emailFeild.text ?? ""
        let password = passwordFeild.text ?? ""
        
        Auth.auth().signIn(withEmail: email, password: password) {[weak self] authResult, error in
            guard let self = self else {return}
            if error != nil{
                self.presentAlert(message: error!.localizedDescription, title: "Error" )
            }
            else{
            
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
                let destiniationVewController = storyboard.instantiateViewController(withIdentifier: Constatnts.Identifier.ViewController.PRIVATE_SECTION)
                
                UIApplication.shared.setWindowRootViewController(viewController: destiniationVewController, animate: true)
            }
        }
    }
    
    @IBAction func createAccount(_ sender: Any) {
        performSegue(withIdentifier: Constatnts.Identifier.Segue.LOGIN_TO_SIGNUP, sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        
        setupStyle()
    }
    

    private func setupStyle(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
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
