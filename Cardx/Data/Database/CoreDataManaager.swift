//
//  CoreDataManaager.swift
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
        persistentContainer = NSPersistentContainer(name: "Cardx")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to initialize Core Data \(error)")
            }
        }
    }
    
    func saveData() {
        do {
            try viewContext.save()
        } catch (let error) {
            viewContext.rollback()
            print(_tag, "[Save] [\(error)]")
        }
    }
}

extension CoreDataManager {
    func insertCard(card: Card) {
        saveData()
    }
    
    func deleteCard(cardId: Int) {
        saveData()
    }
    
    func updateCard(card: Card) {
        saveData()
    }
    
    func getAllCards() -> [Card] {
        saveData()
        return []
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
}
