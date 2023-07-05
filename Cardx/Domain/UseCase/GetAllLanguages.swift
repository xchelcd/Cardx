//
//  GetAllLanguages.swift
//  Cardx
//
//  Created by Xchel Carranza on 05/07/23.
//

import Foundation

class GetAllLanguages {
    private let coreDataManager: CoreDataManager
    
    init(coreDataManager: CoreDataManager) {
        self.coreDataManager = coreDataManager
    }
    
    func invoke() -> [Language] {
        let list = coreDataManager.getAllLanguages()
        return list
    }
}
