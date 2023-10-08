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
    
    // MARK: - change the int by uuid
    func invoke(id: UUID) -> Category? {
        let category = coreDataManager.getCategoryById(id: 0)
        return category
    }
}
