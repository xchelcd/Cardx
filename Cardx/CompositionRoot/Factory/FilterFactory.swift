//
//  FilterFactory.swift
//  Cardx
//
//  Created by Xchel Carranza on 11/10/23.
//

import UIKit

protocol FilterFactory {
    func makeModule(coordinator: FilterCoordinator, filterToDefaultCardsCoordinator: FilterDialogCoordinator) -> UIViewController
}

struct FilterFactoryImp: FilterFactory {
    
    func makeModule(coordinator: FilterCoordinator, filterToDefaultCardsCoordinator: FilterDialogCoordinator) -> UIViewController {
        
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
        
        let dialog = FilterDialog(coordinator: coordinator, viewModel: settingViewModel)
        dialog.modalPresentationStyle = .overFullScreen
        dialog.view.accessibilityIdentifier = "view_filter_dialog"
        return dialog
    }
    
}
