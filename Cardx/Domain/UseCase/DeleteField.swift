//
//  DeleteField.swift
//  Cardx
//
//  Created by Xchel Carranza on 10/10/23.
//

import Foundation


class DeleteField {
    private let coreDataManager: CoreDataManager
    
    init(coreDataManager: CoreDataManager) {
        self.coreDataManager = coreDataManager
    }
    
    func invoke(_ language: Language) {
        print("[DeleteField]")
        
    }
    
    func invoke(_ category: Category) {
        print("[DeleteField]")
    }
}
