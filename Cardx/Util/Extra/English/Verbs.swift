//
//  Verbs.swift
//  Cardx
//
//  Created by Xchel Carranza on 06/07/23.
//

import Foundation

class Verbs: DataManager {
    
    private static let languageId = UUID(uuidString: "4E8A7E0F-B00F-4AF4-92DD-D89BB6EF2609")!
    private static let categoryId = UUID(uuidString: "6502A7BC-7ECD-44FC-8C90-FC67213A74BD")!
    
    public static let language = Language(id: languageId, name: "English")
    let difficulty = Difficulty(id: CardDifficultyId.MEDIUM, name: CardDifficulty.EASY)
    let difficultySelected = Difficulty(id: CardDifficultyId.NULL, name: CardDifficulty.NULL)
    public static let category: Category = Category(id: categoryId, name: "Verbs")
    
    func getPhrasalVerbs() -> [Card] {
        return [
            
        ]
    }
}
