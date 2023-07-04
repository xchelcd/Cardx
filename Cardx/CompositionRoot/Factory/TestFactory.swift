//
//  TestFactory.swift
//  Cardx
//
//  Created by Xchel Carranza on 03/07/23.
//

import UIKit

protocol TestFactory {
    func makeModule(coordinator: TestCoordinator) -> UIViewController
}


struct TestFactoryImp: TestFactory {
    
    func makeModule(coordinator: TestCoordinator) -> UIViewController {
        
        let coreDataManager = CoreDataManager.shared
        
        let insertCard = InsertCard(coreDataManager: coreDataManager)
        let getAllCards = GetAllCards(coreDataManager: coreDataManager)
        let getAllCardsByLanguage = GetAllCardsByLanguage(coreDataManager: coreDataManager)
        let clearDB = ClearDatabase(coreDataManager: coreDataManager)
        
        let viewModel = TestViewModel(
            insertCard: insertCard,
            getAllCards: getAllCards,
            getAllCardsByLanguage: getAllCardsByLanguage,
            clearDB: clearDB
        )
        
        let controller = TestScreen(viewModel: viewModel)
        return controller
    }
}
