//
//  ViewController.swift
//  ACoffeeApp
//
//  Created by Anmol Kumar on 29/08/1942 Saka.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var pricePay: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func priceTapped(_ sender: Any) {
        
        if inputText.text == "" {
            
            errorLabel.text = "Enter value in box"
        } else {
            
            let input = Double(inputText.text!)
            pricePay.text = "\(input! * 5) $"
            view.endEditing(true)      //line to dissmiss keyboard
            
        }
        
        
    }
    
    

}

