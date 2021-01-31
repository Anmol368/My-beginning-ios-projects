//
//  Image+CoreDataProperties.swift
//  CourseBook
//
//  Created by Anmol Kumar on 15/01/21.
//
//

import Foundation
import CoreData


extension Image {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Image> {
        return NSFetchRequest<Image>(entityName: "Image")
    }

    @NSManaged public var image: NSObject?
    @NSManaged public var imageToCourse: Course?
    @NSManaged public var imageToCategory: Category?

}
