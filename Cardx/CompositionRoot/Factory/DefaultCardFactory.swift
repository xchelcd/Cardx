//
//  DefaultCardFactory.swift
//  Cardx
//
//  Created by Xchel Carranza on 06/07/23.
//

import UIKit

protocol DefaultCardsFactory {
    mutating func makeModule(coordinator: DefaultCardsCoordinator) -> UIViewController
    func makeFilterModule(navController: UINavigationController, categories: Set<Category>, languages: Set<Language>) -> Coordinator
}

struct DefaultCardsFactoryImp: DefaultCardsFactory {
    
    var controller: DefaultCardsScreen? = nil
    
    mutating func makeModule(coordinator: DefaultCardsCoordinator) -> UIViewController {
        
        let cardList = PhrasalVerbs().getPhrasalVerbs() + OverPhrase().getOverPhrase() + Connectors().getConnectors()
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
        
        controller = DefaultCardsScreen(coordinator: coordinator, cardList: cardList, cardviewModel: cardViewModel)
        controller?.setupToolbar(title: "Default cards")
        controller?.view.accessibilityIdentifier = "view_deault_cards"
        return controller!
    }
    
    func makeFilterModule(navController: UINavigationController, categories: Set<Category>, languages: Set<Language>) -> Coordinator {
        let filterFactory = FilterFactoryImp()
        let filterCoordinator = FilterCoordinator(navController: navController, factory: filterFactory, filterToDefaultCardsCoordinator: controller!, categories: categories, languages: languages)
        
        return filterCoordinator
    }
}
