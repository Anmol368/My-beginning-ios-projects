//
//  LoginVC.swift
//  minionlogin
//
//  Created by Anmol on 23/01/21.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginVC: UIViewController {
    
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loginTapped(_ sender: Any) {
        
        if email.text == "" || password.text == "" {
            displayPopUp(title: "Missing INFO", message: "No fields can be empty")
        } else {
            //Sign In
            Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (user, error) in
                if error != nil {
                    if let myErr = error?.localizedDescription {
                        self.displayPopUp(title: "ERROR", message: myErr)
                    }
                } else {
                    //Perform a logIn
                    print("###########")
                    //print(user)
                    self.performSegue(withIdentifier: "successsegue", sender: nil)
                }
            }
            
        }
        
    }
    
    
    func displayPopUp(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
        
    }
    

}

