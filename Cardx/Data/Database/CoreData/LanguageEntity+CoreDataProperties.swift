//
//  LanguageEntity+CoreDataProperties.swift
//  Cardx
//
//  Created by Xchel Carranza on 03/07/23.
//
//

import Foundation
import CoreData


extension LanguageEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LanguageEntity> {
        return NSFetchRequest<LanguageEntity>(entityName: "LanguageEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?

}

extension LanguageEntity : Identifiable {

}
