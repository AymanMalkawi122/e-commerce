//
//  ProfileViewController.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 11/12/2023.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {
    private let logoutButtonTitle = "Logout"
    
    @IBOutlet weak var userEmail: UILabel!
    
    @IBOutlet weak var userLetter: UILabel!
    
    @IBOutlet weak var purchaseHistoryTag: UIStackView!
    
    @IBOutlet weak var darkMode: UISwitch!
    
    @IBAction func darkModeSwitchClicked(_ sender: UISwitch) {
        switch sender.isOn{
            
        case true:
            UserDefaults.standard.set(true, forKey: Constatnts.Key.DARK_MODE)
            UIApplication.shared.firstKeyWindow?.overrideUserInterfaceStyle = .dark
        case false:
            UserDefaults.standard.set(false, forKey: Constatnts.Key.DARK_MODE)
            UIApplication.shared.firstKeyWindow?.overrideUserInterfaceStyle = .light
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let darkModeSatus = UserDefaults.standard.bool(forKey: Constatnts.Key.DARK_MODE)
        darkMode.setOn(darkModeSatus, animated: false)
        userEmail.text = Auth.auth().currentUser?.email
        userLetter.layer.cornerRadius = 10
        userLetter.clipsToBounds = true
        configureNavBar()
    }
    
    private func configureNavBar(){
        self.title = "Profile"
//        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let barButtonMenu = UIMenu(title: "", children: [
            UIAction(title: logoutButtonTitle, image: UIImage(systemName: "rectangle.portrait.and.arrow.right"), handler: menuHandler)
        ])
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Manage", image: UIImage(systemName: "ellipsis"), target:self, action: nil, menu: barButtonMenu)
        
    }
    
    private func menuHandler(action: UIAction){
        switch action.title{
        case logoutButtonTitle:
            logUserOut()
        default:
            fatalError("Unhadeled menu item: \(action.title)")
        }
    }
    
    private func logUserOut(){
        do { try Auth.auth().signOut()
        
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            let destiniationVewController = storyboard.instantiateViewController(withIdentifier: Constatnts.Identifier.ViewController.PUBLIC_SECTION)
            
            UIApplication.shared.setWindowRootViewController(viewController: destiniationVewController, animate: true)
            }
        catch { print("Error:User already logged out") }
    }
}
