//
//  SignUpVC.swift
//  minionlogin
//
//  Created by Anmol on 23/01/21.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class SignUpVC: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginTapped(_ sender: Any) {
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        //displayPopUp(title: "Test", message: "Test was Success")
        
        if email.text == "" || password.text == "" {
            displayPopUp(title: "Missing INFO", message: "No fields can be empty")
        } else {
            //Create User
            Auth.auth().createUser(withEmail: email.text!, password: password.text!) { (user, error) in
                if error != nil {
                    if let myErr = error?.localizedDescription {
                        self.displayPopUp(title: "Error", message: myErr)
                    }
                } else {
                    //print(user)
                    //Enter user in Database as well
                    
                    Database.database().reference().child("users").child(user!.user.uid).child("email").setValue(self.email.text)
                    
                    
                    self.displayPopUp(title: "Success", message: "Registered Successfully")
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
