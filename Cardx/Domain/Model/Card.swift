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
    var position: Int = 0
    
    func toString()  -> String {
        return "\(position).\(id) - \(language.name) - \(toTranslate) = \(translation)"
    }
    
    func toString1()  -> String {
        return "\(position). - \(toTranslate) = \(translation)"
    }
}
