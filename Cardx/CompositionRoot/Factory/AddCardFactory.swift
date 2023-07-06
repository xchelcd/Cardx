//
//  AddCardFactory.swift
//  Cardx
//
//  Created by Xchel Carranza on 04/07/23.
//

import UIKit

protocol AddCardFactory {
    func makeModule(coordinator: AddCardCoordinator) -> UIViewController
}

struct AddCardFactoryImp: AddCardFactory {
    
    
    func makeModule(coordinator: AddCardCoordinator) -> UIViewController {
        
        let coreDataManager = CoreDataManager.shared
        
        let insertCard = InsertCard(coreDataManager: coreDataManager)
        let getAllCards = GetAllCards(coreDataManager: coreDataManager)
        //let getAllCardsByParam = FetchAllCardsByParam(coreDataManager: coreDataManager)
        let clearDatabase = ClearDatabase(coreDataManager: coreDataManager)
        let updateCard = UpdateCard(coreDataManager: coreDataManager)
        let removeCard = RemoveCard(coreDataManager: coreDataManager)
        
        let cardViewModel = CardViewModel(
            insertCard: insertCard,
            getAllCards: getAllCards,
            //getAllCardsByParam: getAllCardsByParam,
            clearDB: clearDatabase,
            updateCard: updateCard,
            removeCard: removeCard
        )
        
        let clearCategoryDatabase = ClearCategoryDatabase(coreDataManager: coreDataManager)
        let clearLanguageDatabase = ClearLanguageDatabase(coreDataManager: coreDataManager)
        let getAllLanguages = GetAllLanguages(coreDataManager: coreDataManager)
        let getAllCategories = GetAllCatgories(coreDataManager: coreDataManager)
        
        
        let settingViewModel = SettingViewModel(
            clearCategoryDatabase: clearCategoryDatabase,
            clearLangaugeDatabase: clearLanguageDatabase,
            getAllLanguages: getAllLanguages,
            getAllCategories: getAllCategories,
            insertLanguage: nil,
            insertCategory: nil
        )
        
        let controller = AddCardScreen(coordinator: coordinator, cardViewModel: cardViewModel, settingViewModel: settingViewModel)
        
        return controller
    }
}
