//
//  Course+CoreDataProperties.swift
//  CourseBook
//
//  Created by Anmol Kumar on 15/01/21.
//
//

import Foundation
import CoreData


extension Course {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Course> {
        return NSFetchRequest<Course>(entityName: "Course")
    }

    @NSManaged public var publisheddate: NSDate?
    @NSManaged public var price: Double
    @NSManaged public var email: String?
    @NSManaged public var coursename: String?
    @NSManaged public var courseToCategory: Category?
    @NSManaged public var courseToImage: Image?

}
