//
//  Connectors.swift
//  Cardx
//
//  Created by Xchel Carranza on 08/10/23.
//

import Foundation

class Connectors: DataManager {
    
    static func getCategory() -> Category {
        category
    }
    
    static func getLanguage() -> Language {
        language
    }
    
    private static let languageId = UUID(uuidString: "C0FF44F2-1267-4501-A22C-FB8D1362A4A3")!
    private static let categoryId = UUID(uuidString: "174248B4-2553-4C75-BFB8-47D178694637")!
    
    public static let language = Language(id: languageId, name: "English")
    private let difficulty = Difficulty(id: CardDifficultyId.MEDIUM, name: CardDifficulty.MEDIUM)
    private let difficultySelected = Difficulty(id: CardDifficultyId.NULL, name: CardDifficulty.NULL)
    public static let category: Category = Category(id: categoryId, name: "Connectors")
    
    func getConnectors() -> [Card] {
        return[
            Card(id: UUID(), toTranslate: "Maybe", translation: "Tal vez", language: Connectors.language, difficulty: difficulty, difficultySelected: difficultySelected, category: Connectors.category),
            Card(id: UUID(), toTranslate: "Perhaps", translation: "Quizá", language: Connectors.language, difficulty: difficulty, difficultySelected: difficultySelected, category: Connectors.category),
            Card(id: UUID(), toTranslate: "Certainly", translation: "Ciertamente", language: Connectors.language, difficulty: difficulty, difficultySelected: difficultySelected, category: Connectors.category),
            Card(id: UUID(), toTranslate: "However", translation: "Sin embargo", language: Connectors.language, difficulty: difficulty, difficultySelected: difficultySelected, category: Connectors.category),
            Card(id: UUID(), toTranslate: "Therefore", translation: "Por lo tanto", language: Connectors.language, difficulty: difficulty, difficultySelected: difficultySelected, category: Connectors.category),
            Card(id: UUID(), toTranslate: "By the way", translation: "Por cierto", language: Connectors.language, difficulty: difficulty, difficultySelected: difficultySelected, category: Connectors.category),
            Card(id: UUID(), toTranslate: "Meanwhile", translation: "Mientras tanto", language: Connectors.language, difficulty: difficulty, difficultySelected: difficultySelected, category: Connectors.category),
            Card(id: UUID(), toTranslate: "Fortunately", translation: "Afortunadamente", language: Connectors.language, difficulty: difficulty, difficultySelected: difficultySelected, category: Connectors.category),
            Card(id: UUID(), toTranslate: "Nevertheless", translation: "No obstante", language: Connectors.language, difficulty: difficulty, difficultySelected: difficultySelected, category: Connectors.category),
            Card(id: UUID(), toTranslate: "Otherwise", translation: "De lo contrario", language: Connectors.language, difficulty: difficulty, difficultySelected: difficultySelected, category: Connectors.category),
        ]
    }
}
