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
        
        let saveCard = SaveCard(coreDataManager: coreDataManager)
        let getAllCards = GetAllCards(coreDataManager: coreDataManager)
        let getAllCardsByLanguage = GetAllCardsByLanguage(coreDataManager: coreDataManager)
        
        let viewModel = TestViewModel(
            saveCard: saveCard,
            getAllCards: getAllCards,
            getAllCardsByLanguage: getAllCardsByLanguage
        )
        
        let controller = TestScreen(viewModel: viewModel)
        return controller
    }
}
