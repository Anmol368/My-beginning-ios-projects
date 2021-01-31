//
//  Category+CoreDataProperties.swift
//  CourseBook
//
//  Created by Anmol Kumar on 15/01/21.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var name: String?
    @NSManaged public var categoryToCourse: Course?
    @NSManaged public var categoryToImage: Image?

}
