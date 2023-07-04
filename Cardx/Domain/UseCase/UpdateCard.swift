//
//  UpdateCard.swift
//  Cardx
//
//  Created by Xchel Carranza on 04/07/23.
//

import Foundation

class UpdateCard {
    private let coreDataManager: CoreDataManager
    
    init(coreDataManager: CoreDataManager) {
        self.coreDataManager = coreDataManager
    }
    
    func invoke(card: Card) {
        coreDataManager.updateCard(card: card)
    }
}
