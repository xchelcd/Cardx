//
//  Language.swift
//  Cardx
//
//  Created by Xchel Carranza on 03/07/23.
//

import Foundation

struct Language: CollectionData {

    var chipTitle: String {
        get {
            name
        }
    }
    
    func toString() -> String {
        name
    }
    
    
    let id: UUID
    let name: String
}
