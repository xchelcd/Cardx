//
//  InsertLanguage.swift
//  Cardx
//
//  Created by Xchel Carranza on 05/07/23.
//

import Foundation

class InsertLanguage {
    private let coreDataManager: CoreDataManager
    
    init(coreDataManager: CoreDataManager) {
        self.coreDataManager = coreDataManager
    }
    
    func invoke(language: Language) {
        let languageEntity = LanguageEntity(context: coreDataManager.viewContext)
        
        languageEntity.id = Int16(0) // MARK: - change to uuid
        languageEntity.name = language.name
        
        coreDataManager.insertLanguage(language: languageEntity)
    }
}
