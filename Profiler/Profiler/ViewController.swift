//
//  ViewController.swift
//  Profiler
//
//  Created by Anmol on 23/01/21.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    let myURL = "https://randomuser.me/api"
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    var imageURL = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    
    @IBAction func GetPersonTapped(_ sender: Any) {
        Alamofire.request(myURL).responseJSON { (response) in
            let result = response.result
            //print(result)
            
            //Check for SUCESS: True
            
            if let dict = result.value as? Dictionary<String, AnyObject>{
                if let myNewDict = (dict["results"] as! NSArray)[0] as? Dictionary<String, AnyObject>{
                    if let name = myNewDict["name"] as? Dictionary<String, AnyObject>{
                        if let firstName = name["first"] as? String {
                            self.nameLabel.text = firstName
                        }
                    }
                }
            }
            
            if let dict = result.value as? Dictionary<String, AnyObject>{
                if let myNewDict = (dict["results"] as! NSArray)[0] as? Dictionary<String, AnyObject>{
                        if let webEmail = myNewDict["email"] as? String {
                            self.emailLabel.text = webEmail
                            //print(webEmail)
                        }
                }
            }
            
            if let dict = result.value as? Dictionary<String, AnyObject>{
                if let myNewDict = (dict["results"] as! NSArray)[0] as? Dictionary<String, AnyObject>{
                        if let webPhone = myNewDict["phone"] as? String {
                            self.phoneLabel.text = webPhone
                            //print(webPhone)
                        }
                }
            }
            
            //Get Image
            
            if let dict = result.value as? Dictionary<String, AnyObject>{
                if let myNewDict = (dict["results"] as! NSArray)[0] as? Dictionary<String, AnyObject>{
                    if let photo = myNewDict["picture"] as? Dictionary<String, AnyObject>{
                        if let webPic = photo["large"] as? String {
                            self.imageURL = webPic
                            print(self.imageURL)
                        }
                    }
                }
            }
            
            //Set an Image
            
            if let URL = URL(string: self.imageURL) {
                if let data = NSData(contentsOf: URL) {
                    self.imageView.image = UIImage(data: data as Data)
                    self.imageView.backgroundColor = UIColor.clear
                }
            }
            
        }
    }
    

}

