//
//  SettingViewModel.swift
//  Cardx
//
//  Created by Xchel Carranza on 05/07/23.
//

import Foundation

class SettingViewModel: ViewModel {
    
    private let clearCategoryDatabase: ClearCategoryDatabase
    private let clearLangaugeDatabase: ClearLanguageDatabase
    
    private let getAllLanguages: GetAllLanguages
    private let getAllCategories: GetAllCatgories
    
    private let insertLanguage: InsertLanguage?
    private let insertCategory: InsertCategory?
    
    init(clearCategoryDatabase: ClearCategoryDatabase, clearLangaugeDatabase: ClearLanguageDatabase, getAllLanguages: GetAllLanguages, getAllCategories: GetAllCatgories, insertLanguage: InsertLanguage?, insertCategory: InsertCategory?) {
        self.clearCategoryDatabase = clearCategoryDatabase
        self.clearLangaugeDatabase = clearLangaugeDatabase
        self.getAllLanguages = getAllLanguages
        self.getAllCategories = getAllCategories
        self.insertLanguage = insertLanguage
        self.insertCategory = insertCategory
    }
    
}

extension SettingViewModel {
    
    func fetchAllCategories() -> [Category] {
        let list = getAllCategories.invoke()
        return list
    }
    
    func fetchAllLanguages() -> [Language] {
        let list = getAllLanguages.invoke()
        return list
    }
}

extension SettingViewModel {
    
    func addNewLanguage(language: Language) {
        guard let _ = insertLanguage else {
            fatalError("Instance [insertLanguage] is null")
        }
        insertLanguage?.invoke(language: language)
    }
    
    func addNewCategory(category: Category) {
        guard let _ = insertCategory else {
            fatalError("Instance [insertCategory] is null")
        }
        insertCategory?.invoke(category: category)
    }
}
