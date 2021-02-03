//
//  SuccessVC.swift
//  minionlogin
//
//  Created by Anmol on 23/01/21.
//

import UIKit
import Firebase
import FirebaseStorage

class SuccessVC: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let storageRef = Storage.storage().reference()
        let tempImage = storageRef.child("images/myimage.jpeg")
        
        //Code to upload image
        
//        let image = UIImage(named: "image.jpeg")
//        let metadata = StorageMetadata()
//        metadata.contentType = "image/jpeg"
//
//        tempImage.putData((image?.jpegData(compressionQuality: 0.2))!, metadata: metadata) { (data, error) in
//            if error != nil {
//                print(error?.localizedDescription)
//           } else {
//               print("Upload done")
//            }
//        }
        
        
        //Getting the image
        
        tempImage.getData(maxSize: 1*1024*1024) { (data, error) in
            if error != nil {
                print(error?.localizedDescription)
            } else {
                self.imageView.image = UIImage(data: data!)
            }
        }
        

        
    }
    

}
