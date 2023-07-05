//
//  GetAllCategories.swift
//  Cardx
//
//  Created by Xchel Carranza on 05/07/23.
//

import Foundation

class GetAllCatgories {
    private let coreDataManager: CoreDataManager
    
    init(coreDataManager: CoreDataManager) {
        self.coreDataManager = coreDataManager
    }
    
    func invoke() -> [Category] {
        let list = coreDataManager.getAllCategories()
        return list
    }
}
