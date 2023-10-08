//
//  OverPhrase.swift
//  Cardx
//
//  Created by Xchel Carranza on 08/10/23.
//

import Foundation

class OverPhrase {
    
    private let language = Language(id: UUID(), name: "English")
    private let difficulty = Difficulty(id: CardDifficultyId.MEDIUM, name: CardDifficulty.MEDIUM)
    private let difficultySelected = Difficulty(id: CardDifficultyId.NULL, name: CardDifficulty.NULL)
    private let category: Category = Category(id: UUID(), name: "Over Phrases")
    
    func getOverPhrase() -> [Card] {
        return[
            Card(id: UUID(), toTranslate: "Over", translation: "Sobre/Encima", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            Card(id: UUID(), toTranslate: "Over and above", translation: "Encima de", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            Card(id: UUID(), toTranslate: "Over and over", translation: "Uno y otra vez", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            Card(id: UUID(), toTranslate: "Over the top", translation: "Excesivo", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            Card(id: UUID(), toTranslate: "Over there", translation: "Por ahí", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            Card(id: UUID(), toTranslate: "Over here", translation: "Por aquí", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            Card(id: UUID(), toTranslate: "Over time", translation: "Con el tiempo", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
        ]
    }
}
