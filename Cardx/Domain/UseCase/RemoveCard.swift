//
//  DeleteCard.swift
//  Cardx
//
//  Created by Xchel Carranza on 04/07/23.
//

import Foundation

class RemoveCard {
    private let coreDataManager: CoreDataManager
    
    init(coreDataManager: CoreDataManager) {
        self.coreDataManager = coreDataManager
    }
    
    func invoke(card: Card) {
        coreDataManager.deleteCard(cardId: card.id)
    }
}
