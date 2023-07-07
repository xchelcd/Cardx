//
//  Verbs.swift
//  Cardx
//
//  Created by Xchel Carranza on 06/07/23.
//

import Foundation

class Verbs {
    let language = Language(id: UUID(), name: "English")
    let difficulty = Difficulty(id: CardDifficultyId.MEDIUM, name: CardDifficulty.MEDIUM)
    let difficultySelected = Difficulty(id: CardDifficultyId.NULL, name: CardDifficulty.NULL)
    let category: Category = Category(id: UUID(), name: "Phrasal Verbs")
    
    func getPhrasalVerbs() -> [Card] {
        return [
            
        ]
    }
}
