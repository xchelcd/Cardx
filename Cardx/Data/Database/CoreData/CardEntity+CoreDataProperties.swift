//
//  CardEntity+CoreDataProperties.swift
//  Cardx
//
//  Created by Xchel Carranza on 03/07/23.
//
//

import Foundation
import CoreData


extension CardEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CardEntity> {
        return NSFetchRequest<CardEntity>(entityName: "CardEntity")
    }

    @NSManaged public var categoryId: UUID?
    @NSManaged public var difficulty: Int16
    @NSManaged public var difficultySelected: Int16
    @NSManaged public var id: UUID?
    @NSManaged public var languageId: UUID?
    @NSManaged public var toTranslate: String?
    @NSManaged public var translation: String?

}

extension CardEntity : Identifiable {

}
