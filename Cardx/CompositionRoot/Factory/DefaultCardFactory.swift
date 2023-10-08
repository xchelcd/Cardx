//
//  DefaultCardFactory.swift
//  Cardx
//
//  Created by Xchel Carranza on 06/07/23.
//

import UIKit

protocol DefaultCardsFactory {
    func makeModule(coordinator: DefaultCardsCoordinator) -> UIViewController
}

struct DefaultCardsFactoryImp: DefaultCardsFactory {
    func makeModule(coordinator: DefaultCardsCoordinator) -> UIViewController {
        
        let cardList = PhrasalVerbs().getPhrasalVerbs()
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
        
        let controller = DefaultCardsScreen(cardList: cardList, cardviewModel: cardViewModel)
        
        return controller
    }
}
