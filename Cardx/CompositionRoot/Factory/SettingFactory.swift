//
//  SettingFactory.swift
//  Cardx
//
//  Created by Xchel Carranza on 05/07/23.
//

import UIKit

protocol SettingFactory {
    func makeModule(coordinator: SettingCoordinator) -> UIViewController
}

struct SettingFactoryImp: SettingFactory {
    
    func makeModule(coordinator: SettingCoordinator) -> UIViewController {
        
        let coreDataManager = CoreDataManager.shared
        
        let clearCategoryDatabase = ClearCategoryDatabase(coreDataManager: coreDataManager)
        let clearLanguageDatabase = ClearLanguageDatabase(coreDataManager: coreDataManager)
        
        let getAllLanguages = GetAllLanguages(coreDataManager: coreDataManager)
        let getAllCategories = GetAllCatgories(coreDataManager: coreDataManager)
        
        let insertLanguage = InsertLanguage(coreDataManager: coreDataManager)
        let insertCategory = InsertCategory(coreDataManager: coreDataManager)
        
        let settingViewModel = SettingViewModel(
            clearCategoryDatabase:clearCategoryDatabase,
            clearLangaugeDatabase: clearLanguageDatabase,
            getAllLanguages: getAllLanguages,
            getAllCategories: getAllCategories,
            insertLanguage: insertLanguage,
            insertCategory: insertCategory
        )
        
        let controller = SettingsScreen(coordinator: coordinator, settingViewmodel: settingViewModel)
        controller.setupToolbar(title: "Settings")
        return controller
    }
}
