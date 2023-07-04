//
//  Card.swift
//  Cardx
//
//  Created by Xchel Carranza on 03/07/23.
//

import Foundation

struct Card {
    let id: UUID
    let toTranslate: String
    let translation: String
    let language: Language
    let difficulty: Difficulty
    let difficultySelected: Difficulty // by customer
    let category: Category
    
    func toString()  -> String {
        return ".\(id) - \(language.name) - \(toTranslate) = \(translation)"
    }
}
