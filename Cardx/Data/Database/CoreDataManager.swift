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

// MARK: - Card
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
            let language = Language(id: entity.id!, name: "ToDo")
            let category = Category(id: entity.categoryId!, name: "ToDo")
            
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

// MARK: - Category
extension CoreDataManager {
    func insertCategory(category: CategoryEntity) {
        saveData()
        print(_tag, "CategoryInserted: \(category.name)")
    }
    
    // MARK: - change the int by uuid
    // id should be uuid type
    func getCategoryById(id: Int) -> Category? {
        let request = NSFetchRequest<CategoryEntity>(entityName: "CategoryEntity")
        var list = [CategoryEntity]()
        do {
            list = try viewContext.fetch(request)
            print(_tag, "items: \(list.count)")
        } catch let error {
            print(_tag, error)
        }
        
        return list.filter { $0.id == id }.map { $0.toDomain() }.first
    }
    
    func getAllCategories() -> [Category] {
        let request = NSFetchRequest<CategoryEntity>(entityName: "CategoryEntity")
        
        var list = [CategoryEntity]()
        do {
            list = try viewContext.fetch(request)
            print(_tag, "items: \(list.count)")
        } catch let error {
            print(_tag, error)
        }
        
        let categoryList: [Category] = list.map { entity in
                .init(id: UUID(), name: entity.name ?? "")
        }

        print(_tag, "Fetched")
        return categoryList
    }
}


// MARK: - Language
extension CoreDataManager {
    func insertLanguage(language: LanguageEntity) {
        saveData()
        print(_tag, "LanguageInserted: \(language.name)")
    }
    
    // MARK: - change the int by uuid
    func getLanguageById(id: Int) -> Language? {
        let request = NSFetchRequest<LanguageEntity>(entityName: "LanguageEntity")
        var list = [LanguageEntity]()
        do {
            list = try viewContext.fetch(request)
            print(_tag, "items: \(list.count)")
        } catch let error {
            print(_tag, error)
        }
        
        return list.filter { $0.id == id }.map { $0.toDomain() }.first
    }
    
    func getAllLanguages() -> [Language] {
        let request = NSFetchRequest<LanguageEntity>(entityName: "LanguageEntity")
        
        var list = [LanguageEntity]()
        do {
            list = try viewContext.fetch(request)
            print(_tag, "items: \(list.count)")
        } catch let error {
            print(_tag, error)
        }
        
        let categoryList: [Language] = list.map { entity in
                .init(id: UUID(), name: entity.name ?? "-")
        }

        print(_tag, "Fetched")
        return categoryList
    }
}
