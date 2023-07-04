//
//  CategoryEntity+CoreDataProperties.swift
//  Cardx
//
//  Created by Xchel Carranza on 04/07/23.
//
//

import Foundation
import CoreData


extension CategoryEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CategoryEntity> {
        return NSFetchRequest<CategoryEntity>(entityName: "CategoryEntity")
    }

    @NSManaged public var id: Int16
    @NSManaged public var name: String?

}

extension CategoryEntity : Identifiable {

}
