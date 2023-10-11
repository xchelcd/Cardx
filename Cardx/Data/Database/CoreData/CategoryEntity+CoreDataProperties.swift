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

    @NSManaged public var id: UUID // entity.id should be a uuid instead int
    @NSManaged public var name: String?

}

extension CategoryEntity : Identifiable {
    
    // MARK: - change the int by uuid
    func toDomain() -> Category {
        //Category(id: UUID(), name: name ?? "")
        Category(id: UUID(), name: name ?? "")
    }
}
