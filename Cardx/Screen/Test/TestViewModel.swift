//
//  TestViewModel.swift
//  Cardx
//
//  Created by Xchel Carranza on 03/07/23.
//

import Foundation

class TestViewModel {
    
    private let saveCard: SaveCard
    private let getAllCards: GetAllCards
    private let getAllCardsByLanguage: GetAllCardsByLanguage
    
    init(saveCard: SaveCard, getAllCards: GetAllCards, getAllCardsByLanguage: GetAllCardsByLanguage) {
        self.saveCard = saveCard
        self.getAllCards = getAllCards
        self.getAllCardsByLanguage = getAllCardsByLanguage
    }
}
