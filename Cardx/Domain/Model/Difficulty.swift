//
//  Difficulty.swift
//  Cardx
//
//  Created by Xchel Carranza on 03/07/23.
//

import Foundation

struct Difficulty {
    let id: UUID
    let name: CardDifficulty
}

enum CardDifficulty: String, CaseIterable {
    case TRY_AGAING = "Try again"
    case EASY = "Easy"
    case MEDIUM = "Medium"
    case HARD = "Hard"
}
