//
//  CoreDataManager.swift
//  Cardx
//
//  Created by Xchel Carranza on 03/07/23.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    
    static let shared = CoreDataManager()
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "CardxModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to initialize Core Data \(error)")
            }
        }
    }
    
    private func saveData() {
        do {
            try viewContext.save()
            print(_tag, "[Saved]")
        } catch (let error) {
            viewContext.rollback()
            print(_tag, "[Save] [\(error)]")
        }
    }
}

extension CoreDataManager {
    
    func insertCard(card: Card) {
        saveData()
        print(_tag, "Card inserted: \(card.toString())")
    }
    
    func deleteCard(cardId: UUID) {
        saveData()
    }
    
    func updateCard(card: Card) {
        saveData()
    }
    
    func getAllCards() -> [Card] {
        let request = NSFetchRequest<CardEntity>(entityName: "CardEntity")
        
        var list = [CardEntity]()
        do {
            list = try viewContext.fetch(request)
            print(_tag, "items: \(list.count)")
        } catch let error {
            print(_tag, error)
        }
        
        let cardList: [Card] = list.map { entity in    
            let difficultySelected = Difficulty(id: CardDifficultyId(rawValue: Int(entity.difficultySelected))!, name: CardDifficulty(rawValue: CardDifficulty.allCases[Int(entity.difficultySelected)].rawValue)!)
            let difficulty = Difficulty(id: CardDifficultyId(rawValue: Int(entity.difficulty))!, name: CardDifficulty(rawValue: CardDifficulty.allCases[Int(entity.difficulty)].rawValue)!)
            let language = Language(id: entity.id!, name: "German")
            let category = Category(id: entity.categoryId!, name: "German")
            
            return Card(id: entity.id!, toTranslate: entity.toTranslate!, translation: entity.translation!, language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category)
        }
        //saveData()
        print(_tag, "Fetched")
        return cardList
    }
    
    func getCardsByCategory() -> [Card] {
        saveData()
        return []
    }
    
    func getCardsByLanguage() -> [Card] {
        saveData()
        return []
    }
    
    func getCardsByDifficulty() -> [Card] {
        saveData()
        return []
    }
    
    func getCard() -> Card? {
        saveData()
        return nil
    }
    
    func clearDatabase(entity: String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try viewContext.fetch(fetchRequest)
            for object in results {
                guard let objectData = object as? NSManagedObject else {continue}
                viewContext.delete(objectData)
            }
        } catch let error {
            print("Detele all data in \(entity) error :", error)
        }
    }
}
