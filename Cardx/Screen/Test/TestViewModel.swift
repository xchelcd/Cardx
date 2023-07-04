//
//  TestViewModel.swift
//  Cardx
//
//  Created by Xchel Carranza on 03/07/23.
//

import Foundation

class TestViewModel {
    
    private let insertCard: InsertCard
    private let getAllCards: GetAllCards
    private let getAllCardsByLanguage: GetAllCardsByLanguage
    private let clearDB: ClearDatabase
    
    init(insertCard: InsertCard, getAllCards: GetAllCards, getAllCardsByLanguage: GetAllCardsByLanguage, clearDB: ClearDatabase) {
        self.insertCard = insertCard
        self.getAllCards = getAllCards
        self.getAllCardsByLanguage = getAllCardsByLanguage
        self.clearDB = clearDB
    }
    
    func saveCard(card: Card) {
        insertCard.invoke(card: card)
    }
    
    func fetchAllCards() -> [Card] {
        return getAllCards.invoke()
    }
    
    func clearDatabase() {
        clearDB.invoke()
    }
}
