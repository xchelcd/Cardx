//
//  EnglishDataManager.swift
//  Cardx
//
//  Created by Xchel Carranza on 14/10/23.
//

import Foundation

protocol DataManager {
//    static func getCategory() -> Category
//    static func getLanguage() -> Language
}

class EnglishDataManager {
    
    static let languageId = UUID(uuidString: "1CCDC72D-8EEE-4ACD-A355-A2312D57B77D")!
    
    static func getCategories() -> [Category] {
        return [PhrasalVerbs.category, Verbs.category, OverPhrase.category, Verbs.category]
    }
    
    static func getLanguages() -> [Language] {
        return [PhrasalVerbs.language, Verbs.language, OverPhrase.language, Verbs.language]
    }
}
