//
//  GetCategoryById.swift
//  Cardx
//
//  Created by Xchel Carranza on 05/07/23.
//

import Foundation

class GetCategoryById {
    private let coreDataManager: CoreDataManager
    
    init(coreDataManager: CoreDataManager) {
        self.coreDataManager = coreDataManager
    }
    
    func invoke(id: UUID) -> Category? {
        let category = coreDataManager.getCategoryById()
        return category
    }
}
