//
//  CardViewModel.swift
//  Cardx
//
//  Created by Xchel Carranza on 04/07/23.
//

import Foundation

class CardViewModel: ViewModel {
    
    private let insertCard: InsertCard
    private let getAllCards: GetAllCards
    //private let getAllCardsByLanguage: GetAllCardsByLanguage
    private let clearDB: ClearDatabase
    private let updateCard: UpdateCard
    private let removeCard: RemoveCard
    
    init(
        insertCard: InsertCard,
        getAllCards: GetAllCards,
        //getAllCardsByLanguage: GetAllCardsByLanguage,
        clearDB: ClearDatabase,
        updateCard: UpdateCard,
        removeCard: RemoveCard
    ) {
        self.insertCard = insertCard
        self.getAllCards = getAllCards
        //self.getAllCardsByLanguage = getAllCardsByLanguage
        self.clearDB = clearDB
        self.updateCard = updateCard
        self.removeCard = removeCard
    }
    
    var cardList: [Card] = []
    
    func saveCard(card: Card) {
        insertCard.invoke(card: card)
    }
    
    func fetchAllCards() -> [Card] {
        return getAllCards.invoke()
    }
    
    func clearDatabase() {
        clearDB.invoke()
    }
    
    func updateCard(card: Card) {
        updateCard.invoke(card: card)
    }
    
    func deleteCard(card: Card) {
        removeCard.invoke(card: card)
    }
    
    func getListFiltered(categoriesFiltered: [UUID]?, languagesFiltered: [UUID]?, difficultiesFiltered: [Int]?) -> [Card] {
        if let list = categoriesFiltered {
            cardList = cardList.filter { card in
                list.contains(card.category.id)
            }
        }
        
        if let list = languagesFiltered {
            cardList = cardList.filter { card in
                list.contains(card.language.id)
            }
        }
        
        if let list = difficultiesFiltered {
            cardList = cardList.filter { card in
                list.contains(card.difficulty.id.rawValue)
            }
        }
        
        return cardList
    }
}
