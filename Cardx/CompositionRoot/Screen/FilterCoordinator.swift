//
//  FilterCoordinator.swift
//  Cardx
//
//  Created by Xchel Carranza on 11/10/23.
//

import UIKit

class FilterCoordinator: Coordinator {
    var navController: UINavigationController
    
    let factory: FilterFactory
    
    let filterToDefaultCardsCoordinator: FilterDialogCoordinator
    
    let categories: Set<Category>
    let languages: Set<Language>
    
    lazy var dialog: FilterDialog = {
        return factory.makeModule(coordinator: self, filterToDefaultCardsCoordinator: filterToDefaultCardsCoordinator, categories: categories, languages: languages) as! FilterDialog
    }()
    
    
    init(navController: UINavigationController, factory: FilterFactory, filterToDefaultCardsCoordinator: FilterDialogCoordinator, categories: Set<Category>, languages: Set<Language>) {
        self.navController = navController
        self.factory = factory
        self.filterToDefaultCardsCoordinator = filterToDefaultCardsCoordinator
        self.categories = categories
        self.languages = languages
    }
    
    func start() {
        //dialog = factory.makeModule(coordinator: self)
        navController.present(dialog, animated: true)
    }
    
}

extension FilterCoordinator: FilterDialogCoordinator {
    func applyFilter(categoriesFiltered: [UUID]?, languagesFiltered: [UUID]?, difficultiesFiltered: [Int]?) {
        dialog.dismiss(animated: true)
        filterToDefaultCardsCoordinator.applyFilter(categoriesFiltered: categoriesFiltered, languagesFiltered: languagesFiltered, difficultiesFiltered: difficultiesFiltered)
    }
}
