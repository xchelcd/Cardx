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
        let removeCard = RemoveCard(coreDataManager: coreDataManager)
        
        let viewModel = TestViewModel(
            insertCard: insertCard,
            getAllCards: getAllCards,
            getAllCardsByLanguage: getAllCardsByLanguage,
            clearDB: clearDB,
            removeCard: removeCard
        )
        
        let controller = TestScreen(viewModel: viewModel)
        controller.setupToolbar(title: "Test")
        controller.view.accessibilityIdentifier = "view_test"
        return controller
    }
}
