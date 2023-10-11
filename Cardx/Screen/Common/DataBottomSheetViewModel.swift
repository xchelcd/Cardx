//
//  DataBottomSheetViewModel.swift
//  Cardx
//
//  Created by Xchel Carranza on 10/10/23.
//

import Foundation

class DataBottomSheetViewModel: ViewModel {
    
    private let deleteField: DeleteField
    
    init(deleteField: DeleteField) {
        self.deleteField = deleteField
    }
    
}

extension DataBottomSheetViewModel {
 
    func deleteLanguage(_ language: Language) {
        print(_tag, "Delete: \(language)")
        deleteField.invoke(language)
    }
    
    func deleteCategory(_ category: Category) {
        print(_tag, "Delete: \(category)")
        deleteField.invoke(category)
    }
    
}
