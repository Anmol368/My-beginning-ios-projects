//
//  CourseCell.swift
//  CourseBook
//
//  Created by Anmol kumar on 15/01/21.
//

import UIKit

class CourseCell: UITableViewCell {

    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var courseName: UILabel!
    @IBOutlet weak var courseEmail: UILabel!
    @IBOutlet weak var coursePrice: UILabel!
    
    
    func fillCellWithData(course: Course){
        
        courseName.text = course.coursename
        courseEmail.text = course.email
        coursePrice.text = "$ \(course.price)"
        
        // TODO: Set image later
        
        myImage.image = course.courseToImage?.image as? UIImage
        
    }
    

}








