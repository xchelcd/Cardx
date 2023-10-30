//
//  DisplayCardsFactory.swift
//  Cardx
//
//  Created by Xchel Carranza on 21/10/23.
//

import UIKit

protocol DisplayCardsFactory {
    func makeModule(coordinator: DisplayCardsCoordinator) -> UIViewController
}

struct DisplayCardsFactoryImp: DisplayCardsFactory {
    
    func makeModule(coordinator: DisplayCardsCoordinator) -> UIViewController {
        
        let coreDataManager = CoreDataManager.shared
        let getAllCards = GetAllCards(coreDataManager: coreDataManager)
        
        let viewModel = DisplayCardViewModel(fetchCards: getAllCards)
        
        let controller = DisplayCardsScreen(coordinator: coordinator, viewModel: viewModel)
        
//        controller.setupToolbar(title: "Cards")
        controller.view.accessibilityIdentifier = "view_cards"
        
        return controller
    }
}
