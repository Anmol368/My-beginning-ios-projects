//
//  ViewController.swift
//  USARegister
//
//  Created by Anmol Kumar on 13/09/1942 Saka.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var selectState: UIButton!
    
    var states = ["ALABAMA",
                  "ALASKA",
                  "AMERICAN SAMOA",
                  "ARIZONA",
                  "ARKANSAS",
                  "CALIFORNIA",
                  "COLORADO",
                  "CONNECTICUT"]
                  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.dataSource = self
        pickerView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let myStates = states[row]
        
        return myStates
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let state = states[row]
        selectState.setTitle(state, for: .normal)
        //pickerView.isHidden = true
    }
    
    //to dissmiss the keyboard by tapping on screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func selectStateTapped(_ sender: Any) {
        
        pickerView.isHidden = false
    }
    
}

