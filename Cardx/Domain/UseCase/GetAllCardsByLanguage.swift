//
//  GetAllCardsByLanguage.swift
//  Cardx
//
//  Created by Xchel Carranza on 03/07/23.
//

import Foundation


class GetAllCardsByLanguage {
    private let coreDataManager: CoreDataManager
    
    init(coreDataManager: CoreDataManager) {
        self.coreDataManager = coreDataManager
    }
    
    func invoke() -> [Card] {
        let cardList = [Card]()
        return cardList
    }
}
