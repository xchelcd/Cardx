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
        
//        let description = NSPersistentStoreDescription()
//        description.shouldMigrateStoreAutomatically = true
//        description.shouldInferMappingModelAutomatically = true
//        persistentContainer.persistentStoreDescriptions = [description]
        
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to initialize Core Data \(error)")
            }
        }
//        clearAllDatabase()
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
    
    private func clearAllDatabase() {
        clearDatabase(entity: EntityName.CARD_ENTITY.rawValue)
        clearDatabase(entity: EntityName.LANGUAGE_ENTITY.rawValue)
        clearDatabase(entity: EntityName.CATEGORY_ENTITY.rawValue)
    }
}

// MARK: - Card
extension CoreDataManager {
    
    func insertCard(card: Card) {
        do {
            let request: NSFetchRequest<CardEntity> = CardEntity.fetchRequest()
            request.predicate = NSPredicate(format: "toTranslate == %@", card.toTranslate)
            let numberOfRecords = try viewContext.count(for: request)
            if numberOfRecords == 0 {
                
                let cardEntity = CardEntity(context: viewContext)
                
                cardEntity.id = card.id
                cardEntity.toTranslate = card.toTranslate
                cardEntity.translation = card.translation
                cardEntity.languageId = card.language.id
                cardEntity.categoryId = card.category.id
                cardEntity.difficulty = Int16(card.difficulty.id.rawValue)
                cardEntity.difficultySelected = Int16(card.difficultySelected.id.rawValue)
                
                saveData()
                print(_tag, "Card inserted: \(card.toString())")
            }
        } catch {
            print(_tag, "Error saving context \(error)")
        }
        
    }
    
    func deleteCard(cardId: UUID) {
        let request = NSFetchRequest<CardEntity>(entityName: "CardEntity")
        
        var list = [CardEntity]()
        do {
            list = try viewContext.fetch(request)
            let item = list.filter { $0.id! == cardId }.first
            if let toDelete = item {
                viewContext.delete(toDelete)
                saveData()
            }
        } catch let error {
            print(_tag, error)
        }
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
            
            let language = getLanguageById(id: entity.languageId!)
            let category = getCategoryById(id: entity.categoryId!)
            
            guard let language = language, let category = category else {
                print(_tag, "[Language] or [Category] were null")
                fatalError("[Language] or [Category] were null")
            }
            
            return Card(id: entity.id!, toTranslate: entity.toTranslate!, translation: entity.translation!, language: language, difficulty: difficulty, difficultySelected: difficultySelected, category: category)
        }
        //saveData()
//        print(_tag, "Fetched")
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
            print(_tag, "Detele all data in \(entity) error :", error)
        }
    }
}

// MARK: - Category
extension CoreDataManager {
    func insertCategory(category: Category) {
        do {
            let request = NSFetchRequest<CategoryEntity>(entityName: "CategoryEntity")//: NSFetchRequest<CategoryEntity> = CategoryEntity.fetchRequest()
            request.predicate = NSPredicate(format: "id == %@", category.id as CVarArg)
            let numberOfRecords = try viewContext.count(for: request)
            if numberOfRecords == 0 {
                let categoryEntity = CategoryEntity(context: viewContext)
                
                categoryEntity.id = category.id
                categoryEntity.name = category.name
                saveData()
                print(_tag, "CategoryInserted: \(category)")
            }
        } catch {
            print(_tag, "Error saving context \(error)")
        }
    }
    
    // MARK: - change the int by uuid
    // id should be uuid type
    func getCategoryById(id: UUID) -> Category? {
//        print(_tag, "CategoryId(getCategoryById): \(id)")
        let request = NSFetchRequest<CategoryEntity>(entityName: "CategoryEntity")
        var list = [CategoryEntity]()
        do {
            list = try viewContext.fetch(request)
//            print(_tag, "items: \(list.count)")
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
                .init(id: entity.id, name: entity.name ?? "")
        }

//        print(_tag, "Fetched")
        return categoryList
    }
    
    func delete(_ category: Category) {
        // MARK: - delete
        let request = NSFetchRequest<CategoryEntity>(entityName: "CategoryEntity")
        var list = [CategoryEntity]()
        do {
            list = try viewContext.fetch(request)
            let item = list.filter { $0.id == category.id }.first
            if let toDelete = item {
                viewContext.delete(toDelete)
                saveData()
            }
        } catch let error {
            print(_tag, error)
        }
        // MARK: - delete
    }
}


// MARK: - Language
extension CoreDataManager {
    func insertLanguage(language: Language) {
        do {
            let request: NSFetchRequest<LanguageEntity> = LanguageEntity.fetchRequest()
            request.predicate = NSPredicate(format: "id == %@", language.id as CVarArg)
            let numberOfRecords = try viewContext.count(for: request)
            if numberOfRecords == 0 {
                let languageEntity = LanguageEntity(context: viewContext)
                
                languageEntity.id = language.id
                languageEntity.name = language.name
                saveData()
                print(_tag, "LanguageInserted: \(language)")
            }
        } catch {
            print(_tag, "Error saving context \(error)")
        }
    }
    
    // MARK: - change the int by uuid
    func getLanguageById(id: UUID) -> Language? {
//        print(_tag, "LanguageId(getLanguageById): \(id)")
        let request = NSFetchRequest<LanguageEntity>(entityName: "LanguageEntity")
        var list = [LanguageEntity]()
        do {
            list = try viewContext.fetch(request)
//            print(_tag, "items: \(list.count)")
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
        
        let languageList: [Language] = list.map { entity in
                .init(id: entity.id, name: entity.name ?? "-")
        }

        print(_tag, "Fetched: \(languageList.map(\.id))")
        return languageList
    }
    
    func delete(_ language: Language) {
        // MARK: - delete
        let request = NSFetchRequest<LanguageEntity>(entityName: "LanguageEntity")
        var list = [LanguageEntity]()
        do {
            list = try viewContext.fetch(request)
            let item = list.filter { $0.id == language.id }.first
            if let toDelete = item {
                viewContext.delete(toDelete)
                saveData()
            }
        } catch let error {
            print(_tag, error)
        }
        // MARK: - delete
    }
}
