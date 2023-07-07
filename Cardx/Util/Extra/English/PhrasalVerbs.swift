//
//  PhrasalVerbs.swift
//  Cardx
//
//  Created by Xchel Carranza on 06/07/23.
//

import Foundation

class PhrasalVerbs {
    
    private let language = Language(id: UUID(), name: "English")
    private let difficulty = Difficulty(id: CardDifficultyId.MEDIUM, name: CardDifficulty.MEDIUM)
    private let difficultySelected = Difficulty(id: CardDifficultyId.NULL, name: CardDifficulty.NULL)
    private let category: Category = Category(id: UUID(), name: "Phrasal Verbs")
    
    func getPhrasalVerbs() -> [Card] {
        return[
            Card(id: UUID(), toTranslate: "Break down", translation: "Descomponer", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            .init(id: UUID(), toTranslate: "Call off", translation: "Cancelar", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            .init(id: UUID(), toTranslate: "Come across", translation: "Encontrar", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            .init(id: UUID(), toTranslate: "Carry on", translation: "Continuar", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            .init(id: UUID(), toTranslate: "Drop by", translation: "Visitar", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            .init(id: UUID(), toTranslate: "Find out", translation: "Encontrar/Averiguar", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            .init(id: UUID(), toTranslate: "Get out", translation: "Salir", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            .init(id: UUID(), toTranslate: "Get over", translation: "Superar/Recuperarse", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            .init(id: UUID(), toTranslate: "Get along", translation: "Tener una buena relación/Llevarse bien/Sigue adelante", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            .init(id: UUID(), toTranslate: "Give up", translation: "Rendirse", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            .init(id: UUID(), toTranslate: "Go out", translation: "Salir/Apagarse", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            .init(id: UUID(), toTranslate: "Go on", translation: "Seguir", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            .init(id: UUID(), toTranslate: "Hang out", translation: "Pasar el tiempo", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            .init(id: UUID(), toTranslate: "Look back", translation: "Recordar", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            .init(id: UUID(), toTranslate: "Mess up", translation: "Echar a perder/Desordenar/Arruinar (algo)", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            .init(id: UUID(), toTranslate: "Show up", translation: "Llegar/Aparecer", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            .init(id: UUID(), toTranslate: "Run into", translation: "Reunirse/Toparse con (algo)", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            .init(id: UUID(), toTranslate: "Take off", translation: "Quitar-se/Quitar algo de algo/Despegar", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            .init(id: UUID(), toTranslate: "Watch out", translation: "Estar alerta/Estar atento/Tener cuidado", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            .init(id: UUID(), toTranslate: "Carry out", translation: "Llevar a cabo/Hacer un trabajo", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            .init(id: UUID(), toTranslate: "Take over", translation: "Hacerse cargo/Yomar el control (de algo)", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            .init(id: UUID(), toTranslate: "Hand in", translation: "Entregar (algún trabajo/pendiente)", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            .init(id: UUID(), toTranslate: "Slack off", translation: "Trabajar con menos energía", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            .init(id: UUID(), toTranslate: "Came up with", translation: "Ocurrir (un suceso)", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            .init(id: UUID(), toTranslate: "Bring forward", translation: "Adelantar", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            .init(id: UUID(), toTranslate: "Come up", translation: "Surgir (algo)", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            .init(id: UUID(), toTranslate: "Put back", translation: "Posponer/Retrasar (algo)", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            .init(id: UUID(), toTranslate: "Get together", translation: "Reunirse", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            .init(id: UUID(), toTranslate: "Bring something out", translation: "Lanzar algo (un servicio/producto)", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            .init(id: UUID(), toTranslate: "Pull off", translation: "Llevar a cabo/Lograr (algo)/Cumplir", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            .init(id: UUID(), toTranslate: "Allow for", translation: "Tener en cuenta", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            .init(id: UUID(), toTranslate: "Go over", translation: "Revisar", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            .init(id: UUID(), toTranslate: "Start out", translation: "Comenzar (algo)", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            .init(id: UUID(), toTranslate: "Follow up", translation: "Darle seguimiento a algo/Dar una actualización (de algo en lo que se haya trabajado)", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            .init(id: UUID(), toTranslate: "Catch up", translation: "Ponerse al día", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            .init(id: UUID(), toTranslate: "", translation: "", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
        ]
    }
}
