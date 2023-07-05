//
//  InsertCategory.swift
//  Cardx
//
//  Created by Xchel Carranza on 05/07/23.
//

import Foundation

class InsertCategory {
    private let coreDataManager: CoreDataManager
    
    init(coreDataManager: CoreDataManager) {
        self.coreDataManager = coreDataManager
    }
    
    func invoke(category: Category) {
        let categoryEntity = CategoryEntity(context: coreDataManager.viewContext)
        
        categoryEntity.id = Int16(0) // MARK: - change to uuid
        categoryEntity.name = category.name
        
        coreDataManager.insertCategory(category: categoryEntity)
    }
}
