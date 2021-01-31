//
//  ViewController.swift
//  LightsOut
//
//  Created by Anmol Kumar on 21/08/1942 Saka.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func lightsOutTapped(_ sender: Any) {
        
        self.view.backgroundColor = UIColor.black
    }
    
    @IBAction func lightsInTapped(_ sender: Any) {
        
        self.view.backgroundColor = UIColor.white
    }
    
}

