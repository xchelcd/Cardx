//
//  Difficulty.swift
//  Cardx
//
//  Created by Xchel Carranza on 03/07/23.
//

import Foundation

struct Difficulty {
    let id: CardDifficultyId
    let name: CardDifficulty
    
    static func getDifficulty(index: Int) -> Difficulty {
        let cardDifficultyId = CardDifficultyId(rawValue: index)
        let cardDifficulty = CardDifficulty.allCases[index]
        return .init(id: cardDifficultyId!, name: cardDifficulty)
    }
    
    static let difficulties: [Difficulty] = [
        .init(id: CardDifficultyId.EASY, name: CardDifficulty.EASY),
        .init(id: CardDifficultyId.MEDIUM, name: CardDifficulty.MEDIUM),
        .init(id: CardDifficultyId.HARD, name: CardDifficulty.HARD),
    ]
}

enum CardDifficulty: String, CaseIterable {
    case NULL = "NULL"
    case TRY_AGAING = "Try again"
    case EASY = "Easy"
    case MEDIUM = "Medium"
    case HARD = "Hard"
}

enum CardDifficultyId: Int {
    case NULL = 0
    case TRY_AGAING = 1
    case EASY = 2
    case MEDIUM = 3
    case HARD = 4
}
