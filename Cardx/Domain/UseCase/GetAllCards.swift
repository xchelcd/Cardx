//
//  GetAllCards.swift
//  Cardx
//
//  Created by Xchel Carranza on 03/07/23.
//

import Foundation

class GetAllCards {
    private let coreDataManager: CoreDataManager
    
    init(coreDataManager: CoreDataManager) {
        self.coreDataManager = coreDataManager
    }
    
    func invoke() -> [Card] {
        let cardList = coreDataManager.getAllCards()
        return cardList
    }
}
