//
//  ViewController.swift
//  RandomUser
//
//  Created by Anmol on 20/01/21.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var firstname = ""
    var city = ""
    var gender = ""
    var email = ""
    var phone = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = "https://randomuser.me/api"
        
        Alamofire.request(myURL).responseJSON { (response) in
            //            print("###########")
            //            print(response.response)
            //            print("###########")
            //            print(response.result)
            //            print("###########")
            //            print(response.data)
            //            print("###########")
            //            print(response.request)
            
            //            if let JSON = response.result.value {
            //                print("###########")
            //                print("JSON: \(JSON)")
            
            //            }
            
            
            let result = response.result
            //print(result)
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                //print(dict)
                if let innerDictResult = (dict["results"] as! NSArray)[0] as? Dictionary<String, AnyObject> {
                    //print(innerDictResult)
                    if let webGender = innerDictResult["gender"] as? String {
                        self.gender = webGender
                        print(self.gender)
                    }
                }
            }
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let myNewDict = (dict["results"] as! NSArray)[0] as? Dictionary<String, AnyObject> {
                    if let webPhone = myNewDict["phone"] as? String {
                        self.phone = webPhone
                        print(self.phone)
                    }
                }
            }
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let myNewDict = (dict["results"] as! NSArray)[0] as? Dictionary<String, AnyObject> {
                    if let name = myNewDict["name"] as? Dictionary<String, AnyObject> {
                        if let webFirst = name["first"] as? String {
                            self.firstname = webFirst
                            print(self.firstname)
                        }
                    }
                }
                
            }
        }
        
        
        
    }
    
    
}

