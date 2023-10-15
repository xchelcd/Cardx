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
        coreDataManager.insertCard(card: card)
        
        coreDataManager.insertCategory(category: card.category)
        coreDataManager.insertLanguage(language: card.language)
    }
}
