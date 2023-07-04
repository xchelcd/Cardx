//
//  InsertCard.swift
//  Cardx
//
//  Created by Xchel Carranza on 03/07/23.
//

import Foundation

class InsertCard {
    private let coreDataManager: CoreDataManager
    
    init(coreDataManager: CoreDataManager) {
        self.coreDataManager = coreDataManager
    }
    
    func invoke(card: Card) {
        let cardEntity = CardEntity(context: coreDataManager.viewContext)
        
        cardEntity.id = card.id
        cardEntity.toTranslate = card.toTranslate
        cardEntity.translation = card.translation
        cardEntity.languageId = card.language.id
        cardEntity.categoryId = card.category.id
        cardEntity.difficulty = Int16(card.difficulty.id.rawValue)
        cardEntity.difficultySelected = Int16(card.difficultySelected.id.rawValue)
        // MARK: - to check coreDataManager.saveData() or coreDataManager.insertData(card: Card)
        coreDataManager.insertCard(card: card)
    }
}
