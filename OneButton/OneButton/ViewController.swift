//
//  ViewController.swift
//  OneButton
//
//  Created by Anmol Kumar on 21/08/1942 Saka.
//

import UIKit

class ViewController: UIViewController {

    var buttonState = true
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var buttonText: UIButton!
    
    @IBAction func buttonTapped(_ sender: Any) {
        
        if buttonState == true {
            
            self.view.backgroundColor = UIColor.black
            buttonText.setTitle("Lights IN", for: .normal)
            buttonState = false
        } else {
            
            self.view.backgroundColor = UIColor.white
            buttonText.setTitle("Lights Out", for: .normal)
            buttonState = true
            
         }
    }
    
}

