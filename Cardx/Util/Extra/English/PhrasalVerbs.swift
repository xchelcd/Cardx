//
//  PhrasalVerbs.swift
//  Cardx
//
//  Created by Xchel Carranza on 06/07/23.
//

import Foundation

class PhrasalVerbs: DataManager {
    
    private static let languageId = UUID(uuidString: "1CCDC72D-8EEE-4ACD-A355-A2312D57B77D")!
    private static let categoryId = UUID(uuidString: "A3D52E77-85E3-4AEC-AAF4-81BF62F02E94")!
    
    public static let language = Language(id: languageId, name: "English")
    private let difficulty = Difficulty(id: CardDifficultyId.MEDIUM, name: CardDifficulty.MEDIUM)
    private let difficultySelected = Difficulty(id: CardDifficultyId.NULL, name: CardDifficulty.NULL)
    public static let category: Category = Category(id: categoryId, name: "Phrasal Verbs")
    
    func getPhrasalVerbs() -> [Card] {
        return[
            Card(id: UUID(), toTranslate: "Break down", translation: "Descomponer", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            Card(id: UUID(), toTranslate: "Drop off", translation: "Dejar", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            .init(id: UUID(), toTranslate: "Call off", translation: "Cancelar", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            .init(id: UUID(), toTranslate: "Come across", translation: "Encontrar", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            .init(id: UUID(), toTranslate: "Carry on", translation: "Continuar", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            .init(id: UUID(), toTranslate: "Drop by", translation: "Visitar", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            .init(id: UUID(), toTranslate: "Find out", translation: "Encontrar/Averiguar", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            .init(id: UUID(), toTranslate: "Get out", translation: "Salir", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            .init(id: UUID(), toTranslate: "Get over", translation: "Superar/Recuperarse", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            .init(id: UUID(), toTranslate: "Get along", translation: "Tener una buena relación/Llevarse bien/Sigue adelante", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            .init(id: UUID(), toTranslate: "Give up", translation: "Rendirse", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            .init(id: UUID(), toTranslate: "Go out", translation: "Salir/Apagarse", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            .init(id: UUID(), toTranslate: "Go on", translation: "Seguir", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            .init(id: UUID(), toTranslate: "Hang out", translation: "Pasar el tiempo", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            .init(id: UUID(), toTranslate: "Look back", translation: "Recordar", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            .init(id: UUID(), toTranslate: "Mess up", translation: "Echar a perder/Desordenar/Arruinar (algo)", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            .init(id: UUID(), toTranslate: "Show up", translation: "Llegar/Aparecer", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            .init(id: UUID(), toTranslate: "Run into", translation: "Reunirse/Toparse con (algo)", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            .init(id: UUID(), toTranslate: "Take off", translation: "Quitar-se/Quitar algo de algo/Despegar", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            .init(id: UUID(), toTranslate: "Watch out", translation: "Estar alerta/Estar atento/Tener cuidado", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            .init(id: UUID(), toTranslate: "Carry out", translation: "Llevar a cabo/Hacer un trabajo", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            .init(id: UUID(), toTranslate: "Take over", translation: "Hacerse cargo/Yomar el control (de algo)", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            .init(id: UUID(), toTranslate: "Hand in", translation: "Entregar (algún trabajo/pendiente)", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            .init(id: UUID(), toTranslate: "Slack off", translation: "Trabajar con menos energía", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            .init(id: UUID(), toTranslate: "Came up with", translation: "Ocurrir (un suceso)", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            .init(id: UUID(), toTranslate: "Bring forward", translation: "Adelantar", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            .init(id: UUID(), toTranslate: "Come up", translation: "Surgir (algo)", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            .init(id: UUID(), toTranslate: "Put back", translation: "Posponer/Retrasar (algo)", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            .init(id: UUID(), toTranslate: "Get together", translation: "Reunirse", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            .init(id: UUID(), toTranslate: "Bring something out", translation: "Lanzar algo (un servicio/producto)", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            .init(id: UUID(), toTranslate: "Pull off", translation: "Llevar a cabo/Lograr (algo)/Cumplir", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            .init(id: UUID(), toTranslate: "Allow for", translation: "Tener en cuenta", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            .init(id: UUID(), toTranslate: "Go over", translation: "Revisar", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            .init(id: UUID(), toTranslate: "Start out", translation: "Comenzar (algo)", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            .init(id: UUID(), toTranslate: "Follow up", translation: "Darle seguimiento a algo/Dar una actualización (de algo en lo que se haya trabajado)", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            .init(id: UUID(), toTranslate: "Catch up", translation: "Ponerse al día", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            .init(id: UUID(), toTranslate: "Keep on", translation: "Continuar", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            .init(id: UUID(), toTranslate: "Keep up", translation: "Mantenerse al día", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            .init(id: UUID(), toTranslate: "Keep away", translation: "Alejar", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            .init(id: UUID(), toTranslate: "Keep in mind", translation: "Tener en cuenta", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            
            .init(id: UUID(), toTranslate: "Put on", translation: "Ponerse algo", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            .init(id: UUID(), toTranslate: "Take off", translation: "Quitarse algo", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            .init(id: UUID(), toTranslate: "Pick up", translation: "Recoger algo", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            //.init(id: UUID(), toTranslate: "Drop off", translation: "", language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category),
            .init(id: UUID(), toTranslate: "Get on", translation: "Progresar/Subir a algo", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            .init(id: UUID(), toTranslate: "Get off", translation: "Quitar/Bajarse/Salirse/Irse", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            .init(id: UUID(), toTranslate: "Run after", translation: "Correr tras de alguien", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            .init(id: UUID(), toTranslate: "Run away", translation: "Huir/Escaparse", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            .init(id: UUID(), toTranslate: "Speed up", translation: "Acelerar", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            .init(id: UUID(), toTranslate: "Slow down", translation: "Ir despacio", language: PhrasalVerbs.language, difficulty: difficulty, difficultySelected: difficultySelected, category: PhrasalVerbs.category),
            
        ]
    }
}
