//
//  Connectors.swift
//  Cardx
//
//  Created by Xchel Carranza on 08/10/23.
//

import Foundation

class Connectors {
    
    private let language = Language(id: UUID(), name: "English")
    private let difficulty = Difficulty(id: CardDifficultyId.MEDIUM, name: CardDifficulty.MEDIUM)
    private let difficultySelected = Difficulty(id: CardDifficultyId.NULL, name: CardDifficulty.NULL)
    private let category: Category = Category(id: UUID(), name: "Connectors")
    
    func getConnectors() -> [Card] {
        return[
            Card(id: UUID(), toTranslate: "Maybe", translation: "Tal vez", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            Card(id: UUID(), toTranslate: "Perhaps", translation: "Quizá", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            Card(id: UUID(), toTranslate: "Certainly", translation: "Ciertamente", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            Card(id: UUID(), toTranslate: "However", translation: "Sin embargo", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            Card(id: UUID(), toTranslate: "Therefore", translation: "Por lo tanto", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            Card(id: UUID(), toTranslate: "By the way", translation: "Por cierto", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            Card(id: UUID(), toTranslate: "Meanwhile", translation: "Mientras tanto", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            Card(id: UUID(), toTranslate: "Fortunately", translation: "Afortunadamente", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            Card(id: UUID(), toTranslate: "Nevertheless", translation: "No obstante", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            Card(id: UUID(), toTranslate: "Otherwise", translation: "De lo contrario", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
        ]
    }
}
