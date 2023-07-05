//
//  GetLanguageById.swift
//  Cardx
//
//  Created by Xchel Carranza on 05/07/23.
//

import Foundation

class GetLanguageById {
    private let coreDataManager: CoreDataManager
    
    init(coreDataManager: CoreDataManager) {
        self.coreDataManager = coreDataManager
    }
    
    func invoke(id: UUID) -> Language? {
        let language = coreDataManager.getLanguageById()
        return language
    }
}
