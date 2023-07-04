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
}

enum CardDifficulty: String, CaseIterable {
    case NULL = "NULL"
    case TRY_AGAING = "Try again"
    case EASY = "Easy"
    case MEDIUM = "Medium"
    case HARD = "Hard"
}

enum CardDifficultyId: Int {
    case NULL = -1
    case TRY_AGAING = 0
    case EASY = 1
    case MEDIUM = 2
    case HARD = 3
}
