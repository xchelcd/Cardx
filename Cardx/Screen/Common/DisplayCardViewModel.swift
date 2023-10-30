//
//  DisplayCardViewModel.swift
//  Cardx
//
//  Created by Xchel Carranza on 20/10/23.
//

import Foundation

class DisplayCardViewModel: ViewModel {
    
    private let fetchCards: GetAllCards
    
    init(fetchCards: GetAllCards) {
        self.fetchCards = fetchCards
    }
    
    func getAllCards() -> [Card] {
        fetchCards.invoke()
    }
    
    func updatePosition(card: Card) {
        
    }
}
