//
//  OverPhrase.swift
//  Cardx
//
//  Created by Xchel Carranza on 08/10/23.
//

import Foundation

class OverPhrase: DataManager {
    
    static func getCategory() -> Category {
        category
    }
    
    static func getLanguage() -> Language {
        language
    }
    
    private static let categoryId = UUID(uuidString: "CEF1C131-E84D-478F-BF1E-0B494AD7BE9B")!
    
    public static let language = Language(id: EnglishDataManager.languageId, name: "English")
    private let difficulty = Difficulty(id: CardDifficultyId.MEDIUM, name: CardDifficulty.MEDIUM)
    private let difficultySelected = Difficulty(id: CardDifficultyId.NULL, name: CardDifficulty.NULL)
    public static let category: Category = Category(id: categoryId, name: "Over Phrases")
    
    func getOverPhrase() -> [Card] {
        return[
            Card(id: UUID(), toTranslate: "Over", translation: "Sobre/Encima", language: OverPhrase.language, difficulty: difficulty, difficultySelected: difficultySelected, category: OverPhrase.category),
            Card(id: UUID(), toTranslate: "Over and above", translation: "Encima de", language: OverPhrase.language, difficulty: difficulty, difficultySelected: difficultySelected, category: OverPhrase.category),
            Card(id: UUID(), toTranslate: "Over and over", translation: "Uno y otra vez", language: OverPhrase.language, difficulty: difficulty, difficultySelected: difficultySelected, category: OverPhrase.category),
            Card(id: UUID(), toTranslate: "Over the top", translation: "Excesivo", language: OverPhrase.language, difficulty: difficulty, difficultySelected: difficultySelected, category: OverPhrase.category),
            Card(id: UUID(), toTranslate: "Over there", translation: "Por ahí", language: OverPhrase.language, difficulty: difficulty, difficultySelected: difficultySelected, category: OverPhrase.category),
            Card(id: UUID(), toTranslate: "Over here", translation: "Por aquí", language: OverPhrase.language, difficulty: difficulty, difficultySelected: difficultySelected, category: OverPhrase.category),
            Card(id: UUID(), toTranslate: "Over time", translation: "Con el tiempo", language: OverPhrase.language, difficulty: difficulty, difficultySelected: difficultySelected, category: OverPhrase.category),
        ]
    }
}
