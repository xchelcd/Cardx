//
//  ClearDatabase.swift
//  Cardx
//
//  Created by Xchel Carranza on 04/07/23.
//

import Foundation

class ClearDatabase {
    private let coreDataManager: CoreDataManager
    
    init(coreDataManager: CoreDataManager) {
        self.coreDataManager = coreDataManager
    }
    
    func invoke() {
        coreDataManager.clearDatabase(entity: EntityName.CARD_ENTITY.rawValue)
    }
}

enum EntityName: String {
    case CARD_ENTITY = "CardEntity"
    case CATEGORY_ENTITY = "CategoryEntity"
    case LANGUAGE_ENTITY = "LanguageEntity"
}
