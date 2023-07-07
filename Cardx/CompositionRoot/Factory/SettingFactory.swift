//
//  SettingFactory.swift
//  Cardx
//
//  Created by Xchel Carranza on 05/07/23.
//

import UIKit

protocol SettingFactory {
    func makeModule(coordinator: SettingCoordinator) -> UIViewController
    func makeBottomSheetModule(navController: UINavigationController, categoryList: [Category]?, langaugeList: [Language]?) -> Coordinator
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
    
    func makeBottomSheetModule(navController: UINavigationController,categoryList: [Category]?, langaugeList: [Language]?) -> Coordinator {
        let factoy = BottomSheetFactoryImp()
        let coordiantor = BottomSheetCoordinator(navController: navController, factory: factoy, categoryList: categoryList, languageList: langaugeList)
        return coordiantor
    }
}
