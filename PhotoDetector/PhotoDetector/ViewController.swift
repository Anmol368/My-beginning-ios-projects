//
//  ViewController.swift
//  PhotoDetector
//
//  Created by Anmol on 25/01/21.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var detectedLabel: UILabel!
    @IBOutlet weak var sureLabel: UILabel!
    
    let myLib = Resnet50()
    
    var imagePicker = UIImagePickerController()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
    }
    
    
    @IBAction func librarySelected(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func cameraSelected(_ sender: Any) {
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let ima = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = ima
            machineLearn(image: ima)
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    func machineLearn(image: UIImage) {
        if let model = try? VNCoreMLModel(for: myLib.model) {
            
            //Request from model
            let req = VNCoreMLRequest(model: model) { (req, error) in
                //Check if error is nil
                if let results = req.results as? [VNClassificationObservation] {
                    for i in results {
                        print("\(i.identifier) and sure: \(i.confidence)")
                    }
                    
                    self.detectedLabel.text = results.first?.identifier
                    self.sureLabel.text = "\((results.first?.confidence)! * 100) %"
                    
                }
                    
                
            }
            
            //Handler for request
            if let imgData = image.pngData() {
                let reqhandler = VNImageRequestHandler(data: imgData, options: [:])
                try? reqhandler.perform([req])
            }
        }
    }
    
    
    
}

