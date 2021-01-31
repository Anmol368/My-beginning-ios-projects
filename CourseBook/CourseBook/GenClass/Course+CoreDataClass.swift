//
//  Course+CoreDataClass.swift
//  CourseBook
//
//  Created by Anmol Kumar on 15/01/21.
//
//

import Foundation
import CoreData

@objc(Course)
public class Course: NSManagedObject {

    public override func awakeFromInsert() {
        super.awakeFromInsert()
        self.publisheddate = NSDate()
    }
    
}
